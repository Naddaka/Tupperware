<?php
/*
* This file is part of phpMorphy project
*
* Copyright (c) 2007-2012 Kamaev Vladimir <heromantor@users.sourceforge.net>
*
*     This library is free software; you can redistribute it and/or
* modify it under the terms of the GNU Lesser General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
*     This library is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* Lesser General Public License for more details.
*
*     You should have received a copy of the GNU Lesser General Public
* License along with this library; if not, write to the
* Free Software Foundation, Inc., 59 Temple Place - Suite 330,
* Boston, MA 02111-1307, USA.
*/

class phpMorphy_Fsa_Tree_File extends phpMorphy_Fsa_FsaAbstract {
    function walk($trans, $word, $readAnnot = true) {
        $__fh = $this->resource; $fsa_start = $this->fsa_start;

        for($i = 0, $c = $GLOBALS['__phpmorphy_strlen']($word); $i < $c; $i++) {
            $prev_trans = $trans;
            $char = ord($word[$i]);

            /////////////////////////////////
            // find char in state begin
			// tree version
			$result = true;
			$start_offset = $fsa_start + ((($trans >> 11) & 0x1FFFFF) << 2);

			// read first trans in state
			fseek($__fh, $start_offset);			list(, $trans) = unpack('V', fread($__fh, 4));

			// If first trans is term(i.e. pointing to annot) then skip it
			if(($trans & 0x0100)) {
				// When this is single transition in state then break
				if(($trans & 0x0200) && ($trans & 0x0400)) {
					$result = false;
				} else {
					$start_offset += 4;
					fseek($__fh, $start_offset);					list(, $trans) = unpack('V', fread($__fh, 4));
				}
			}

			// if all ok process rest transitions in state
			if($result) {
				// walk through state
				for($idx = 1, $j = 0; ; $j++) {
					$attr = ($trans & 0xFF);

					if($attr == $char) {
						$result = true;
						break;
					} else if($attr > $char) {
						if(($trans & 0x0200)) {
							$result = false;
							break;
						}

						$idx = $idx << 1;
					} else {
						if(($trans & 0x0400)) {
							$result = false;
							break;
						}

						$idx = ($idx << 1) + 1;
					}

					if($j > 255) {
						throw new phpMorphy_Exception('Infinite recursion possible');
					}

										// read next trans
					fseek($__fh, $start_offset + (($idx - 1) << 2));					list(, $trans) = unpack('V', fread($__fh, 4));
				}
			}

            // find char in state end
            /////////////////////////////////

            if(!$result) {
                $trans = $prev_trans;
                break;
            }
        }

        $annot = null;
        $result = false;
        $prev_trans = $trans;

        if($i >= $c) {
            // Read annotation when we walked all chars in word
            $result = true;

            if($readAnnot) {
                // read annot trans
                fseek($__fh, $fsa_start + ((($trans >> 11) & 0x1FFFFF) << 2));                list(, $trans) = unpack('V', fread($__fh, 4));

                if(0 == ($trans & 0x0100)) {
                    $result = false;
                } else {
                    $annot = $this->getAnnot($trans);
                }
            }
        }

        return array(
            'result' => $result,
            'last_trans' => $trans,
            'word_trans' => $prev_trans,
            'walked' => $i,
            'annot' => $annot
        );
    }

    function collect($startNode, $callback, $readAnnot = true, $path = '') {
        $total = 0;

        $stack = array();
        $stack_idx = array();
        $start_idx = 0;
        array_push($stack, null);
        array_push($stack_idx, null);

        $state = $this->readState((($startNode) >> 11) & 0x1FFFFF);

        do {
            for($i = $start_idx, $c = count($state); $i < $c; $i++) {
                $trans = $state[$i];

                if(($trans & 0x0100)) {
                    $total++;

                    if($readAnnot) {
                        $annot = $this->getAnnot($trans);
                    } else {
                        $annot = $trans;
                    }

                    if(!call_user_func($callback, $path, $annot)) {
                        return $total;
                    }
                } else {
                    $path .= chr(($trans & 0xFF));
                    array_push($stack, $state);
                    array_push($stack_idx, $i + 1);
                    $state = $this->readState((($trans) >> 11) & 0x1FFFFF);
                    $start_idx = 0;

                    break;
                }
            }

            if($i >= $c) {
                $state = array_pop($stack);
                $start_idx = array_pop($stack_idx);
                $path = $GLOBALS['__phpmorphy_substr']($path, 0, -1);
            }
        } while(!empty($stack));

        return $total;
    }

    function readState($index) {
        $__fh = $this->resource; $fsa_start = $this->fsa_start;

        $result = array();

		$offset = $fsa_start + (($index) << 2);

		// read first trans
		fseek($__fh, $offset);		list(, $trans) = unpack('V', fread($__fh, 4));

		// check if first trans is pointer to annot, and not single in state
		if(($trans & 0x0100) && !(($trans & 0x0200) || ($trans & 0x0400))) {
			$result[] = $trans;

			list(, $trans) = unpack('V', fread($__fh, 4));
			$offset += 4;
		}

		// read rest
		for($expect = 1; $expect; $expect--) {
			if(!($trans & 0x0200)) $expect++;
			if(!($trans & 0x0400)) $expect++;

			$result[] = $trans;

			if($expect > 1) {
				list(, $trans) = unpack('V', fread($__fh, 4));
				$offset += 4;
			}
		}

        return $result;
    }

    function unpackTranses($rawTranses) {
        settype($rawTranses, 'array');
        $result = array();

        foreach($rawTranses as $rawTrans) {
            $result[] = array(
				'term'  => ($rawTrans & 0x0100) ? true : false,
				'llast' => ($rawTrans & 0x0200) ? true : false,
				'rlast' => ($rawTrans & 0x0400) ? true : false,
				'attr'  => ($rawTrans & 0xFF),
				'dest'  => (($rawTrans) >> 11) & 0x1FFFFF,
			);
        }

        return $result;
    }

    protected function readRootTrans() {
        $__fh = $this->resource; $fsa_start = $this->fsa_start;

        fseek($__fh, $fsa_start + 0);        list(, $trans) = unpack('V', fread($__fh, 4));

        return $trans;
    }

    protected function readAlphabet() {
        $__fh = $this->resource; $fsa_start = $this->fsa_start;

        fseek($__fh, $this->header['alphabet_offset']);        return fread($__fh, $this->header['alphabet_size']);
    }

    function getAnnot($trans) {
        if(!($trans & 0x0100)) {
            return null;
        }

        $__fh = $this->resource; $fsa_start = $this->fsa_start;

        $offset =
            $this->header['annot_offset'] +
            ((($trans & 0xFF) << 21) | (($trans >> 11) & 0x1FFFFF));

        fseek($__fh, $offset);        $len = ord(fread($__fh, 1));

        if($len) {
            $annot = fread($__fh, $len);
        } else {
            $annot = null;
        }

        return $annot;
    }

}