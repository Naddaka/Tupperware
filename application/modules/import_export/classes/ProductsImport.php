<?php

namespace import_export\classes;

use CI_DB_active_record;
use core\models\Route;
use Exception;
use stdClass;
use TrueBV\Punycode;

(defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 *
 * @property CI_DB_active_record $db
 */
class ProductsImport extends BaseImport
{

    /**
     * Class ProductsImport
     * @var ProductsImport
     */
    protected static $_instance;

    /**
     * Path to the temp origin photo
     * @var string
     */
    private $imagetemppathOrigin = './uploads/origin/';

    /**
     * Path to the temp addition photo
     * @var string
     */
    private $imagetemppathAdd = './uploads/origin/additional/';

    /**
     * Path to the origin photo
     * @var string
     */
    private $imageOriginPath = './uploads/shop/products/origin/';

    /**
     * Path to the addition photo
     * @var string
     */
    private $imageAddPath = './uploads/shop/products/origin/additional/';

    /**
     * Main currency
     * @var array
     */
    private $mainCur = [];

    public function __construct() {
        $this->load->helper('translit');
        parent::__construct();
        $this->mainCur = $this->db
            ->get_where('shop_currencies', ['is_default' => '1'])
            ->row_array();

        if (!is_dir($this->imagetemppathOrigin)) {
            mkdir($this->imagetemppathOrigin, 0777);
            if (!is_dir($this->imagetemppathAdd)) {
                mkdir($this->imagetemppathAdd, 0777);
            }
        }
    }

    /**
     * Start Import process
     * @access public
     * @author Kaero
     * @copyright ImageCMS (c) 2012, Kaero <dev@imagecms.net>
     * @param array $EmptyFields
     * @return bool
     */
    public function make($EmptyFields) {
        if (ImportBootstrap::hasErrors()) {
            return FALSE;
        }
        self::create()->processBrands();
        self::create()->startCoreProcess($EmptyFields);
    }

    /**
     * Start Core Process
     * @author Kaero
     * @copyright ImageCMS (c) 2012, Kaero <dev@imagecms.net>
     * @param array $EmptyFields
     */
    private function startCoreProcess($EmptyFields) {
        foreach (BaseImport::create()->content as $key => $node) {

            $result = $this->db
                ->limit(1)
                ->select('shop_product_variants.product_id as ProductId')
                ->select('shop_products.category_id as SCategoryId')
                ->select('shop_products_i18n.name as ProductName')
                ->join('shop_products', 'shop_products.id = shop_product_variants.product_id', 'left outer')
                ->join('shop_products_i18n', 'shop_products_i18n.id = shop_products.id')
                ->where('number', $node['num'])
                ->get('shop_product_variants')
                ->row();

            $mas[$key] = (!($result instanceof stdClass)) ? $this->runProductInsertQuery($node, $EmptyFields) : $this->runProductUpdateQuery($result->ProductId, $node, $EmptyFields);

            BaseImport::create()->content[$key]['ProductId'] = $mas[$key]['ProductId'];
            $ids[$key] = $mas[$key]['variantId'];
            BaseImport::create()->content[$key]['variantId'] = $mas[$key]['variantId'];
        }

        ImportBootstrap::addMessage(implode('/', $ids), 'content');
        $this->runCopyImages(BaseImport::create()->content);
    }

    /**
     * Run Product Update Query
     * @param integer $productId
     * @param array $arg Processed arguments list
     * @param boolean $EmptyFields
     * @return array|void
     * @author Kaero
     * @access private
     * @copyright ImageCMS (c) 2012, Kaero <dev@imagecms.net>
     */
    public function runProductUpdateQuery($productId, $arg, $EmptyFields) {
        $insertData = [];

        if ($arg['url'] != '') {
            $arg['url'] = $this->urlCheck($arg['url'], $productId);
        }

        if ($arg['imgs'] != '') {
            $this->runAditionalImages($arg, $productId);
        }

        if (isset($arg['name']) && $arg['name'] == '') {
            Logger::create()
                ->set('Колонка имени товара пустая. ID - ' . $productId . ' update. - IMPORT');
            return;
        }

        if (isset($arg['cat']) && $arg['cat'] == '') {
            Logger::create()
                ->set('Колонка категории товара пустая. ID - ' . $productId . ' update. - IMPORT');
            return;
        }

        /* START product Update query block */
        $prepareNames = $binds = $updateData = [];

        $productAlias = [
                         'act'        => 'active',
                         'CategoryId' => 'category_id',
                         'oldprc'     => 'old_price',
                         'hit'        => 'hit',
                         'archive'    => 'archive',
                         'hot'        => 'hot',
                         'action'     => 'action',
                         'BrandId'    => 'brand_id',
                         'relp'       => 'related_products',
                         'mimg'       => 'mainImage',
                        ];

        foreach ($arg as $key => $val) {
            if (isset($productAlias[$key])) {
                if (!$EmptyFields) {
                    //Если галочка обновления, то обновлять старую цену если она пустая
                    if ($key == 'oldprc' && !trim($val)) {
                        continue;
                    }
                }
                array_push($prepareNames, $productAlias[$key]);
                $binds[$productAlias[$key]] = $val;
            }
        }

        $prepareNames = array_merge($prepareNames, ['updated']);
        $binds = array_merge($binds, ['updated' => date('U')]);

        foreach ($prepareNames as $value) {
            $updateData[] = $value . '="' . $binds[$value] . '"';
        }

        $this->db->query('UPDATE shop_products SET ' . implode(',', $updateData) . ' WHERE `id`= ?', [$productId]);

        $this->db->query('UPDATE route SET `url`= ?, `parent_url` = ? WHERE `entity_id`= ? AND `type` = "product"', [$arg['url'], $this->full_path_category($arg['cat']), $productId]);

        /* START product i18n Update query block */
        $prepareNames = $binds = $updateData = [];

        $productAlias = [
                         'name'   => 'name',
                         'shdesc' => 'short_description',
                         'desc'   => 'full_description',
                         'mett'   => 'meta_title',
                         'metd'   => 'meta_description',
                         'metk'   => 'meta_keywords',
                        ];

        foreach ($arg as $key => $val) {
            if (isset($productAlias[$key])) {
                if (!$EmptyFields) {
                    //Если галочка обновления, то обновлять если поле пустое
                    if (!trim($val) && $key != 'name') {
                        continue;
                    }
                }
                array_push($prepareNames, $productAlias[$key]);
                $binds[$productAlias[$key]] = $val;

                if ($this->db->dbdriver == 'mysqli') {
                    $updateData[] = '`' . $productAlias[$key] . '`="' . mysqli_real_escape_string($this->db->conn_id, $val) . '"';
                } else {
                    $updateData[] = '`' . $productAlias[$key] . '`="' . mysql_real_escape_string($val) . '"';
                }

                $insertData[$productAlias[$key]] = $val;
            }
        }

        $checkIdProductI18n = $this->db->where('id', $productId)->where('locale', $this->languages)->get('shop_products_i18n')->row()->id;
        if ($checkIdProductI18n) {
            $this->db->query('UPDATE shop_products_i18n SET ' . implode(',', $updateData) . ' WHERE `id`= ' . $productId . ' AND `locale`= "' . $this->languages . '"');
        } else {
            $insertData['locale'] = $this->languages;
            $insertData['id'] = $productId;
            $this->db->insert('shop_products_i18n', $insertData);
        }
        /* END product i18n Update query block */

        $this->updateSProductsCategories($arg, $productId, $EmptyFields);
        $varId = $this->runProductVariantUpdateQuery($arg, $productId, $EmptyFields);

        return [
                'ProductId' => $productId,
                'variantId' => $varId,
               ];
    }

    /**
     * Run Product Variant Update Query
     * @param array $arg Processed arguments list
     * @param integer $productId Product Id for alias
     * @param boolean $EmptyFields
     * @return boolean
     * @access private
     * @author Kaero
     * @copyright ImageCMS (c) 2012, Kaero <dev@imagecms.net>
     */
    private function runProductVariantUpdateQuery(&$arg, &$productId, $EmptyFields) {
        /* START product variant insert query block */

        $prepareNames = $binds = $updateData = [];

        $productAlias = [
                         'stk' => 'stock',
                         'prc' => 'price',
                         'num' => 'number',
                        ];

        if ($arg['prc']) {
            $arg['prc'] = str_replace(',', '.', $arg['prc']);
        }

        foreach ($arg as $key => $val) {
            if (isset($productAlias[$key])) {
                if (!$EmptyFields) {
                    //Если галочка обновления, то обновлять если поле пустое
                    if ('' === $val && $key != 'num') {
                        continue;
                    }
                }
                array_push($prepareNames, $productAlias[$key]);
                $binds[$productAlias[$key]] = $val;
            }
        }

        if ($arg['cur']) {
            $prepareNames = array_merge($prepareNames, ['currency']);

            $cur = $this->db->select('id')
                ->get_where('shop_currencies', ['id' => $arg['cur']])
                ->row()->id;

            if (!$cur) {
                $cur = $this->mainCur['id'];
            }

            $binds = array_merge(
                $binds,
                ['currency' => $cur]
            );
        }

        if (!$EmptyFields) {
            //Если галочка обновления, то обновлять если поле пустое
            if (trim($arg['prc'])) {
                $binds = array_merge(
                    $binds,
                    [
                     'price_in_main' => $arg['prc'],
                    ]
                );
                $prepareNames = array_merge($prepareNames, ['price_in_main']);
            }
        } else {
            $binds = array_merge(
                $binds,
                [
                 'price_in_main' => $arg['prc'],
                ]
            );
            $prepareNames = array_merge($prepareNames, ['price_in_main']);
        }

        foreach ($prepareNames as $value) {
            $updateData[] = $value . '="' . $binds[$value] . '"';
        }

        $this->db->query('UPDATE shop_product_variants SET ' . implode(',', $updateData) . ' WHERE `number`= ? AND `product_id` = ?', [$arg['num'], $productId]);

        $variantModel = $this->db->query('SELECT id FROM shop_product_variants WHERE `number` = ? AND `product_id` = ?', [$arg['num'], $productId])->row();
        /* END product variant insert query block */

        /* START product variant i18n insert query block */
        $prepareNames = $binds = $updateData = [];
        $productAlias = (isset($arg['var'])) ? ['var' => 'name'] : ['name' => 'name'];

        foreach ($arg as $key => $val) {
            if (isset($productAlias[$key])) {
                if (!$EmptyFields) {
                    //Если галочка обновления, то обновлять если поле пустое
                    if (!trim($val) && ($key == 'var' || $key == 'name')) {
                        continue;
                    }
                }
                array_push($prepareNames, $productAlias[$key]);
                $binds[$productAlias[$key]] = $val;
                if ($this->db->dbdriver == 'mysqli') {
                    $updateData[] = $productAlias[$key] . '="' . mysqli_real_escape_string($this->db->conn_id, $val) . '"';
                } else {
                    $updateData[] = $productAlias[$key] . '="' . mysql_real_escape_string($val) . '"';
                }
                $insertData[$productAlias[$key]] = $val;
            }
        }

        $checkIdProductVariantI18n = $this->db->where('id', $variantModel->id)->where('locale', $this->languages)->get('shop_product_variants_i18n')->row()->id;
        if ($checkIdProductVariantI18n) {
            $this->db->query('UPDATE shop_product_variants_i18n SET ' . implode(',', $updateData) . ' WHERE `locale`= ? AND `id` = ?', [$this->languages, $variantModel->id]);
        } else {
            $insertData['locale'] = $this->languages;
            $insertData['id'] = $variantModel->id;
            $this->db->insert('shop_product_variants_i18n', $insertData);
        }
        /* END product variant i18n insert query block */

        return $variantModel->id;
    }

    /**
     * Run Product Insert Query
     * @param array $arg Processed arguments list
     * @param boolean $EmptyFields
     * @return boolean
     * @author Kaero
     * @access private
     * @copyright ImageCMS (c) 2012, Kaero <dev@imagecms.net>
     */
    private function runProductInsertQuery($arg, $EmptyFields) {
        if ($arg['name'] == '') {
            Logger::create()
                ->set('Колонка имени товара пустая. NUM - ' . $arg['num'] . ' insert. - IMPORT');
            return;
        }

        if ($arg['cat'] == '') {
            Logger::create()
                ->set('Колонка категории товара пустая. NUM - ' . $arg['num'] . ' insert. - IMPORT');
            return;
        }

        $this->load->helper('string');

        $result = $this->db
            ->where('name', $arg['name'])
            ->get('shop_products_i18n')
            ->row();

        if ($arg['act'] == null) {
            $arg['act'] = 1;
        }

        if ($result) {
            $this->updateSProductsCategories($arg, $result->id, $EmptyFields);
            $varId = $this->runProductVariantInsertQuery($arg, $result->id);
            return [
                    'ProductId' => $result->id,
                    'variantId' => $varId,
                   ];
        }

        /* START product insert query block */
        $prepareNames = $binds = [];
        $productAlias = [
                         'act'        => 'active',
                         'CategoryId' => 'category_id',
                         'oldprc'     => 'old_price',
                         'hit'        => 'hit',
                         'archive'    => 'archive',
                         'hot'        => 'hot',
                         'action'     => 'action',
                         'BrandId'    => 'brand_id',
                         'relp'       => 'related_products',
                         'mimg'       => 'mainImage',
                        ];

        foreach ($arg as $key => $val) {
            if (isset($productAlias[$key])) {
                if (!$EmptyFields) {
                    //Если галочка обновления, то обновлять старую цену если она пустая
                    if ($key == 'oldprc' && !trim($val)) {
                        continue;
                    }
                }
                array_push($prepareNames, $productAlias[$key]);
                $binds[$productAlias[$key]] = $val;
            }
        }

        $prepareNames = array_merge($prepareNames, ['created', 'updated']);

        $binds = array_merge(
            $binds,
            [
             'created' => date('U'),
             'updated' => date('U'),
            ]
        );

        $this->db->query('INSERT INTO shop_products (' . implode(',', $prepareNames) . ') VALUES (' . substr(str_repeat('?,', count($prepareNames)), 0, -1) . ')', $binds);

        $productId = $this->db->insert_id();

        $route = [

                  'type'       => Route::TYPE_PRODUCT,
                  'entity_id'  => $productId,
                  'url'        => $this->urlCheck($arg['url'], $productId, $arg['name']),
                  'parent_url' => $this->full_path_category($arg['cat']),

                 ];
        $this->db->insert('route', $route);

        $routeId = $this->db->insert_id();

        $this->db->query('UPDATE shop_products SET `route_id`= ? WHERE `id`= ?', [$routeId, $productId]);

        $url = Route::createRouteUrl($route['url'], $route['parent_url'], Route::TYPE_PRODUCT);

        $this->db->where('trash_url', $url)->delete('trash');

        /* END product insert query block */

        if ($arg['imgs'] != '') {
            $arg['imgs'] = $this->runAditionalImages($arg, $productId);
        }

        /* START product i18n insert query block */
        $prepareNames = $binds = [];

        $productAlias = [
                         'name'   => 'name',
                         'shdesc' => 'short_description',
                         'desc'   => 'full_description',
                         'mett'   => 'meta_title',
                         'metd'   => 'meta_description',
                         'metk'   => 'meta_keywords',
                        ];

        foreach ($arg as $key => $val) {
            if (isset($productAlias[$key])) {
                array_push($prepareNames, $productAlias[$key]);
                $binds[$productAlias[$key]] = $val;
            }
        }
        $prepareNames = array_merge($prepareNames, ['locale', 'id']);

        $binds = array_merge(
            $binds,
            [
             'locale' => $this->languages,
             'id'     => $productId,
            ]
        );

        $this->db->query('INSERT INTO shop_products_i18n (' . implode(',', $prepareNames) . ') VALUES (' . substr(str_repeat('?,', count($prepareNames)), 0, -1) . ')', $binds);
        /* END product i18n insert query block */

        $this->updateSProductsCategories($arg, $productId, $EmptyFields);
        $varId = $this->runProductVariantInsertQuery($arg, $productId);

        return [
                'ProductId' => $productId,
                'variantId' => $varId,
               ];
    }

    /**
     * Run Product Variant Insert Query
     * @param array $arg Processed arguments list
     * @param integer $productId Product Id for alias
     * @return boolean
     * @access private
     * @author Kaero
     * @copyright ImageCMS (c) 2012, Kaero <dev@imagecms.net>
     */
    private function runProductVariantInsertQuery(&$arg, &$productId) {
        if (isset($arg['prc'])) {
            $arg['prc'] = str_replace(',', '.', $arg['prc']);
        } else {
            $arg['prc'] = 0;
        }

        $arg['stk'] = isset($arg['stk']) ? $arg['stk'] : 0;

        /* START product variant insert query block */
        $prepareNames = $binds = [];
        $productAlias = [
                         'stk' => 'stock',
                         'prc' => 'price',
                         'num' => 'number',
                        ];

        foreach ($arg as $key => $val) {
            if (isset($productAlias[$key])) {
                array_push($prepareNames, $productAlias[$key]);
                $binds[$productAlias[$key]] = $val;
            }
        }

        $cur = $this->db->select('id')
            ->get_where('shop_currencies', ['id' => $arg['cur']])
            ->row()->id;

        if ($cur == null) {
            $cur = $this->mainCur['id'];
        }

        $prepareNames = array_merge($prepareNames, ['product_id', 'currency', 'price_in_main', 'position']);
        $binds = array_merge(
            $binds,
            [
             'product_id'    => $productId,
             'currency'      => $cur,
             'price_in_main' => $arg['prc'], 0
            ]
        );
        $this->db->query(
            'INSERT INTO shop_product_variants (' . implode(',', $prepareNames) . ')
            VALUES (' . substr(str_repeat('?,', count($prepareNames)), 0, -1) . ')',
            $binds
        );
        $productVariantId = $this->db->insert_id();

        $this->db->set('position', $productVariantId)->where('id', $productVariantId)->update('shop_product_variants');
        /* END product variant insert query block */

        /* START product variant i18n insert query block */
        $prepareNames = $binds = [];
        $productAlias = (isset($arg['var'])) ? ['var' => 'name'] : ['name' => 'name'];
        foreach ($arg as $key => $val) {
            if (isset($productAlias[$key])) {
                array_push($prepareNames, $productAlias[$key]);
                $binds[$productAlias[$key]] = $val;
            }
        }

        $prepareNames = array_merge($prepareNames, ['id', 'locale']);
        $binds = array_merge(
            $binds,
            [
             'id'     => $productVariantId,
             'locale' => $this->languages,
            ]
        );
        $this->db->query(
            'INSERT INTO shop_product_variants_i18n (' . implode(',', $prepareNames) . ')
            VALUES (' . substr(str_repeat('?,', count($prepareNames)), 0, -1) . ')',
            $binds
        );
        /* END product variant i18n insert query block */

        return $productVariantId;
    }

    /**
     * Update Shop Products Categories
     * @param array $arg Processed arguments list
     * @param integer $productId Product Id for alias
     * @param $EmptyFields
     * @return bool|null
     * @author Kaero
     * @copyright ImageCMS (c) 2012, Kaero <dev@imagecms.net>
     */
    private function updateSProductsCategories(&$arg, $productId, $EmptyFields) {
        $shopCategoryIds = [];

        $updateAddCategories = isset($arg['addcats']) && ('' !== trim($arg['addcats']) || $EmptyFields);
        if ($updateAddCategories) {

            $this->db->delete('shop_product_categories', ['product_id' => $productId]);

            $arrNames = [];
            foreach (explode('|', $arg['addcats']) as $k => $val) {
                $temp = explode('/', $val);
                $arrNames[$k]['category'] = end($temp);
                if ($temp[count($temp) - 2]) {
                    $arrNames[$k]['parent'] = $temp[count($temp) - 2];
                }
            }
            // Привязка к имени доп категорий а не к транслиту full_path_url
            foreach ($arrNames as $key => $value) {
                if ($value['parent']) {
                    $parentId = $this->db->select('id')
                        ->where('name', $value['parent'])
                        ->where('locale', $this->input->post('language'))
                        ->get('shop_category_i18n')
                        ->row()
                        ->id;

                    $idAddCat = $this->db->select('shop_category_i18n.id')
                        ->where('shop_category_i18n.name', $value['category'])
                        ->where('shop_category.parent_id', $parentId)
                        ->join('shop_category', 'shop_category.id=shop_category_i18n.id')
                        ->where('shop_category_i18n.locale', $this->input->post('language'))
                        ->get('shop_category_i18n')
                        ->row_array();
                } else {
                    $idAddCat = $this->db->select('id')
                        ->where('name', $value['category'])
                        ->where('locale', $this->input->post('language'))
                        ->get('shop_category_i18n')
                        ->row_array();
                }
                $idsAddCat[$key]['id'] = $idAddCat['id'];
            }

            foreach ($idsAddCat as $one) {
                array_push($shopCategoryIds, (int) $one['id']);
            }
        }

        $mainCategory = $this->db
            ->select('category_id')
            ->where('id', $productId)
            ->get('shop_products');

        if ($mainCategory->num_rows() > 0) {
            $mainCategory = (int) $mainCategory->row_array()['category_id'];
            array_push($shopCategoryIds, $mainCategory);
            $shopCategoryIds = array_unique($shopCategoryIds);
        }

        foreach ($shopCategoryIds as $categoryId) {
            try {
                if ($categoryId) {
                    $this->db->insert(
                        'shop_product_categories',
                        [
                         'product_id'  => $productId,
                         'category_id' => $categoryId,
                        ]
                    );
                }
            } catch (Exception $exc) {
                echo $exc->getTraceAsString();
            }
        }
    }

    /**
     * @param string $val
     * @return string
     */
    private function full_path_category($val) {
        $this->load->helper('translit');
        $str = explode('/', $val);
        $str = array_map('trim', $str);
        $str = array_map('translit_url', $str);
        return implode('/', $str);
    }

    /**
     * Process Brands
     * @author Kaero
     * @copyright ImageCMS (c) 2012, Kaero <dev@imagecms.net>
     */
    protected function processBrands() {
        $this->load->helper('translit');
        foreach (BaseImport::create()->content as $key => $node) {
            if (isset($node['brd']) && !empty($node['brd'])) {
                $result = $this->db->query(
                    '
                SELECT SBrands.id as BrandId
                FROM `shop_brands` as SBrands
                LEFT OUTER JOIN `shop_brands_i18n` AS SBrandsI18n ON SBrandsI18n.id = SBrands.id
                WHERE SBrandsI18n.name = ? AND locale = ?
                LIMIT 1',
                    [
                     $node['brd'],
                     $this->languages,
                    ]
                )->row();
                if (!($result instanceof stdClass)) {
                    $this->db->insert('shop_brands', ['url' => translit_url($node['brd'])]);
                    $brandId = $this->db->insert_id();
                    foreach ($this->allLanguages as $val) {
                        $this->db->insert('shop_brands_i18n', ['name' => $node['brd'], 'locale' => $val, 'id' => $brandId]);
                    }
                    BaseImport::create()->content[$key]['BrandId'] = $brandId;
                } else {
                    BaseImport::create()->content[$key]['BrandId'] = $result->BrandId;
                }
            }
        }
    }

    /**
     * ProductsImport Singleton
     * @return ProductsImport
     * @access public
     * @author Kaero
     * @copyright ImageCMS (c) 2012, Kaero <dev@imagecms.net>
     */
    public static function create() {
        (null !== self::$_instance) OR self::$_instance = new self();
        return self::$_instance;
    }

    /**
     * If the file is in the origin folder, it is copied to the origin and entered
     * into the db. If the file is not in a folder, but the pace is already in
     * the original folder, just entered into the database.
     * @param array $result
     */
    private function runCopyImages($result) {
        foreach ((array) $result as $item) {
            if (preg_match('/http\:\/\//i', $item['vimg']) || preg_match('/https\:\/\//i', $item['vimg'])) {
                $filename = $this->saveImgByUrl($item['vimg'], 'origin');
                if ($filename) {
                    copy($this->imagetemppathOrigin . $filename, $this->imageOriginPath . $filename);
                    $this->db->set('mainImage', $filename);
                    $this->db->where('id', $item['variantId']);
                    $this->db->update('shop_product_variants');
                }
            } else {
                $this->load->helper('translit');
                $vImageArray = explode('.', $item['vimg']);
                $vImageArray[0];
                $vImageArray[0] = translit_url($vImageArray[0]);
                $translitImg = implode('.', $vImageArray);

                if (($translitImg != '') && (file_exists($this->imageOriginPath . $translitImg))) {
                    $this->db->set('mainImage', $translitImg);
                    $this->db->where('id', $item['variantId']);
                    $this->db->update('shop_product_variants');
                } elseif (($item['vimg'] != '') && (file_exists($this->imagetemppathOrigin . $item['vimg']))) {
                    copy($this->imagetemppathOrigin . $item['vimg'], $this->imageOriginPath . $translitImg);
                    $this->db->set('mainImage', $translitImg);
                    $this->db->where('id', $item['variantId']);
                    $this->db->update('shop_product_variants');
                } elseif (($item['vimg'] != '') && (file_exists($this->imagetemppathOrigin . iconv('UTF-8', 'Windows-1251', $item['vimg'])))) {
                    copy($this->imagetemppathOrigin . iconv('UTF-8', 'Windows-1251', $item['vimg']), $this->imageOriginPath . $translitImg);
                    $this->db->set('mainImage', $translitImg);
                    $this->db->where('id', $item['variantId']);
                    $this->db->update('shop_product_variants');
                }
            }
        }
    }

    /**
     * Save the picture on coal in the original folder or the origin/additional
     * @param string $param url
     * @param bool|string $type (origin|additional)
     * @return bool|string Name of file OR False
     * @access private
     */
    private function saveImgByUrl($param, $type = false) {
        if (!$type) {
            Logger::create()
                ->set('$type is false. saveImgByUrl() ProductsImport.php. - IMPORT');
            return FALSE;
        }
        $path = ($type && $type == 'origin') ? './uploads/origin/' : './uploads/origin/additional/';
        $name = explode('/', $param);
        $sitename = $name[2];
        $name = explode('.', end($name));
        $name = urldecode($name[0]);
        $goodName = $sitename . '_' . $name;

        $paramTemp = explode('?', $param);
        $param = is_array($paramTemp) ? $paramTemp[0] : $param;

        $format = pathinfo($param, PATHINFO_EXTENSION);

        switch ($format) {
            case 'jpg':
            case 'jpeg':
            case 'png':
            case 'gif':
                $flag = TRUE;
                break;
            default:
                Logger::create()
                    ->set('The link does not lead to the image or images in the correct format ProductsImport.php. - IMPORT');
                return false;
        }

        $this->load->helper('translit');
        if (!file_exists($path . $goodName . '.' . $format)) {
            if ($flag) {
                $url = $param;
                $timeoutlimit = '5';
                ini_set('default_socket_timeout', $timeoutlimit);
                $fp = fopen($url, 'r');
                $res = fread($fp, 500);
                fclose($fp);
                if (strlen($res) > 0) {
                    $s = file_get_contents($param);
                    $goodName = translit_url($goodName);
                    file_put_contents($path . $goodName . '.' . $format, $s);
                } else {
                    Logger::create()
                        ->set('Server with a picture does not answer ' . $timeoutlimit . ' sec. ProductsImport.php. - IMPORT');
                }
                return $goodName . '.' . $format;
            }
            return FALSE;
        } else {
            $goodName = translit_url($goodName);
            return $goodName . '.' . $format;
        }
    }

    /**
     * Does not allow duplicate url
     * @param string $url
     * @param int|string $id
     * @param string $name
     * @return string
     */
    public function urlCheck($url, $id = '', $name = '') {

        if ($url == '') {
            return translit_url(trim($name));
        } else {
            $url = translit_url($url);
        }
        // Check if Url is aviable.
        $urlCheck = $this->db
            ->select('url, entity_id')
            ->where('url', $url)
            ->where('entity_id !=' . $id)
            ->get('route')
            ->row();

        if ($urlCheck->id != $id) {
            return $url;
        } else {
            return $id . '_' . random_string('alnum', 8);
        }
    }

    /**
     * If the file is in the folder origin/additional, then copied to the original and
     * entered into the db. If the file does not exist in the folder origin/additional
     * but already exists in the original, just entered into the database
     * @param array $arg
     * @param integer $id
     */
    public function runAditionalImages($arg, $id) {
        $this->db->delete('shop_product_images', ['product_id' => $id]);

        $arg['imgs'] = explode('|', $arg['imgs']);

        if ($arg['imgs'] != []) {
            foreach ((array) $arg['imgs'] as $key => $img) {
                $this->db->set('product_id', $id);
                $img = trim($img);

                if (preg_match('/http\:\/\//i', $img) || preg_match('/https\:\/\//i', $img)) {
                    $filename = $this->saveImgByUrl($img, 'additional');
                    if ($filename) {
                        copy($this->imagetemppathAdd . $filename, $this->imageAddPath . $filename);
                        $this->db->set('image_name', $filename);
                        $this->db->set('position', $key);
                        $this->db->insert('shop_product_images');
                    }
                } else {
                    $this->load->helper('translit');
                    $vImageArray = explode('.', $img);
                    $vImageArray[0];
                    $vImageArray[0] = translit_url($vImageArray[0]);
                    $translitImg = implode('.', $vImageArray);

                    if (file_exists($this->imageAddPath . $translitImg)) {
                        /* If the photo is not in the orogin folder, but there is $this->imageAddPath */
                        $this->db->set('image_name', $translitImg);
                        $this->db->set('position', $key);
                    } elseif (file_exists($this->imagetemppathAdd . $img)) {
                        /* If the photo is in the orogin folder */
                        copy($this->imagetemppathAdd . $img, $this->imageAddPath . $translitImg);
                        $this->db->set('image_name', $translitImg);
                        $this->db->set('position', $key);
                    } elseif (file_exists($this->imagetemppathAdd . iconv('UTF-8', 'Windows-1251', $img))) {
                        copy($this->imagetemppathAdd . iconv('UTF-8', 'Windows-1251', $img), $this->imageAddPath . $translitImg);
                        $this->db->set('image_name', $translitImg);
                        $this->db->set('position', $key);
                    }
                    $this->db->insert('shop_product_images');
                }
            }
        }
    }

}