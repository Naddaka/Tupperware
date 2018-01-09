<?php

use CMSFactory\assetManager;
use CMSFactory\Events;

(defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * Image CMS
 * Shop news
 *
 * News can be displaying on category and product pages
 *
 * in order to display news insert in product.tpl or category.tpl:
 *
 * {$CI->load->module('shop_news')->getShopNews()}
 *
 * @property Shop_news_model shop_news_model
 */
class Shop_news extends MY_Controller
{

    public function __construct() {
        parent::__construct();
        $lang = new MY_Lang();
        $lang->load('shop_news');
    }

    public static function adminAutoload() {
        Events::create()->onAdminPagePreEdit()->setListener('_extendPageAdmin');
    }

    /**
     * Display module template on tab "Modules additions" when edit page.
     * @param array $shopNewsData
     */
    public static function _extendPageAdmin($shopNewsData) {
        $shopNews = new Shop_news();

        $view = $shopNews->prepareInterface($shopNewsData, $shopNewsData['pageId']);
        assetManager::create()
                ->appendData('moduleAdditions', $view);
    }

    /**
     * Get shop news for shop category or product
     * @param integer $limit
     */
    public function getShopNews($limit = 20) {

        $this->load->model('shop_news_model');
        //Prepare category id
        if ($this->core->core_data['data_type'] == 'shop_category') {
            $categoryId = $this->core->core_data['id'];
        } elseif ($this->core->core_data['data_type'] == 'product') {
            $productId = $this->core->core_data['id'];
            $categoryId = $this->shop_news_model->getProductCategory($productId);
        }

        // Get content ids by category
        $contentIds = $this->shop_news_model->getContentIds($categoryId);

        // Prepare array with content ids
        $ids = [];
        foreach ($contentIds as $contentId) {
            $ids[] .= $contentId['content_id'];
        }

        $content = $this->shop_news_model->getContent($ids, $limit);

        assetManager::create()
                ->setData(['contentShopNews' => $content])
                ->registerStyle('style')
                ->registerScript('scripts')
                ->render('content', true);
    }

    /**
     * Prepare and return template for module
     * @param array $data
     * @param integer $pageId
     * @return string
     */
    public function prepareInterface($data, $pageId) {
        $currentCategories = $this->db->where('content_id', $pageId)->get('mod_shop_news')->row_array();
        $currentCategories = explode(',', $currentCategories['shop_categories_ids']);

        return assetManager::create()
                        ->setData(['shopNews' => $data, 'categories' => ShopCore::app()->SCategoryTree->getTree(), 'currentCategories' => $currentCategories])
                        ->registerScript('scripts')
                        ->fetchTemplate('/admin/adminModuleInterface');
    }

    /**
     * Save categories for displaying page content
     */
    public function ajaxSaveShopCategories() {
        $data = $this->input->post('data');
        $contentId = $this->input->post('contentId');
        $this->load->model('shop_news_model');

        $this->shop_news_model->saveCategories($contentId, $data);
        showMessage(lang('Changes have been saved', 'shop_news'));
    }

    /**
     * Install
     */
    public function _install() {

        /** Create module's table * */
        ($this->dx_auth->is_admin()) OR exit;
        $this->load->dbforge();

        $fields = [
                   'content_id'          => [
                                             'type'       => 'INT',
                                             'constraint' => 11,
                                            ],
                   'shop_categories_ids' => [
                                             'type'       => 'VARCHAR',
                                             'constraint' => 1000,
                                            ],
                  ];

        $this->dbforge->add_field($fields);
        $this->dbforge->create_table('mod_shop_news', TRUE);

        /** Update module settings * */
        $this->db->where('name', 'shop_news')
            ->update('components', ['autoload' => '1', 'enabled' => '1']);
    }

    /**
     * Uninstall
     */
    public function _deinstall() {

        $this->load->dbforge();
        $this->dbforge->drop_table('mod_shop_news');
    }

}

/* End of file sample_module.php */