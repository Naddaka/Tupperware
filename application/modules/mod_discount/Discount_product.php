<?php

namespace mod_discount;

use CMSFactory\assetManager;
use discount_model_front;
use mod_discount\classes\BaseDiscount;
use Propel\Runtime\ActiveQuery\Criteria;

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

/**
 * Class Discount_product for Mod_Discount module
 * @author DevImageCms
 * @copyright (c) 2013, ImageCMS
 * @package ImageCMSModule
 * @property discount_model_front $discount_model_front
 */
class Discount_product
{

    private $discountForProduct;

    private static $object;

    /**
     * singelton method
     * @return Discount_product
     */
    public static function create() {
        if (!self::$object) {
            self::$object = new self;
        }
        return self::$object;
    }

    /**
     * __construct base object loaded
     * @access private
     * @author DevImageCms
     * @internal param $ ---
     * @copyright (c) 2013, ImageCMS
     */
    private function __construct() {
        $this->ci = & get_instance();
        $lang = new \MY_Lang();
        $lang->load('mod_discount');
        include_once __DIR__ . '/models/discount_model_front.php';
        $this->ci->discount_model_front = new discount_model_front;
        $this->baseDiscount = BaseDiscount::create();
        $this->discountForProduct = array_merge($this->baseDiscount->discountType['product'], $this->baseDiscount->discountType['brand'], $this->createChildDiscount($this->baseDiscount->discountType['category']));
    }

    /**
     * create child discount
     * @access private
     * @author DevImageCms
     * @param array
     * @return array
     * @copyright (c) 2013, ImageCMS
     */
    private function createChildDiscount($discount) {

        if (count($discount) > 0) {
            $resultDiscount = [];
            foreach ($discount as $disc) {
                $resultDiscount[] = $disc;
                if ($disc['child']) {
                    $query = \SCategoryQuery::create()
                        ->setComment(__METHOD__)
                        ->select(['id'])
                        ->filterByFullPathIds('%:' . $disc['category_id'] . ';%', Criteria::LIKE)
                        ->find()->toArray();
                    if (count($query) > 0) {
                        foreach ($query as $child) {
                            $discAux = $disc;
                            $discAux['category_id'] = $child;
                            $resultDiscount[] = $discAux;
                        }
                    }
                }
            }

            return $resultDiscount;
        } else {
            return $discount;
        }
    }

    /**
     * get product discount for product_id and product_vid
     * @access public
     * @author DevImageCms
     * @param $product
     * @param null|float $price
     * @return bool
     * @internal param product $array [id,vid]
     * @copyright (c) 2013, ImageCMS
     */
    public function getProductDiscount($product, $price = null) {

        $discountArray = $this->getDiscountOneProduct($product);

        if (count($discountArray) > 0) {
            if (null === $price) {

                $price = \SProductVariantsQuery::create()
                    ->findOneById($product['vid'])->getPrice();

                //                $price = $this->ci->discount_model_front->getPrice($product['vid']);
            }
            $discountMax = $this->baseDiscount->getMaxDiscount($discountArray, $price);
            $discountValue = $this->baseDiscount->getDiscountValue($discountMax, $price);
        } else {
            assetManager::create()->discount = false;
            return false;
        }

        assetManager::create()->discount = [
                                            'discoun_all_product' => $discountArray,
                                            'discount_max'        => $discountMax,
                                            'discount_value'      => $discountValue,
                                            'price'               => $price,
                                           ];

        return true;
    }

    /**
     * get product discount for one prouct
     * @access private
     * @author DevImageCms
     * @param array product [product_id,brand_id,category_id]
     * @return array
     * @copyright (c) 2013, ImageCMS
     */
    private function getDiscountOneProduct($product) {

        $arrDiscount = [];

        foreach ($this->discountForProduct as $disc) {
            foreach ($product as $key => $value) {
                if ($key !== 'id' && $disc[$key]) {
                    if ($disc[$key] == $value) {
                        $arrDiscount[] = $disc;
                    }
                }
            }
        }

        return $arrDiscount;
    }

}