<?php

/**
 * Shop Controller class file.
 */
class ShopController extends MY_Controller
{

    public static $cmsVersion = FALSE;

    public static $currentLocale = null;

    public static $doShowUntranslated = FALSE;

    protected $template_path = null;

    public function __construct() {
        parent::__construct();
        $this->template_path = ShopCore::$template_path;
    }

    public static function checkLicensePremium() {
        if (self::$cmsVersion !== 'shop_premium') {
            $msg = lang('Error checking permissions');
            $ci = &get_instance();
            $ci->template->assign('content', $msg);
            $msg = $ci->template->fetch('main');
            die($msg);
        }
    }

    public static function checkVar() {
        if (!isset(self::$cmsVersion)) {
            $msg = lang('Error checking permissions');
            $ci = &get_instance();
            $ci->template->assign('content', $msg);
            $msg = $ci->template->fetch('main');
            die($msg);
        }
    }

    /**
     * Display 404 error page.
     *
     * @access public
     */
    public function error404() {
        header('HTTP/1.0 404 Not Found');
        $this->render(
            'error404',
            [
             'error' => ShopCore::t('Страница не найдена'),
            ]
        );
        exit;
    }

    /**
     * Fetch template file and display it in main.tpl
     *
     * @param string $name template file name
     * @param array $data template data
     * @param bool $fetch
     * @return string
     * @access public
     */
    public function render($name, $data = [], $fetch = false) {
        $this->template->add_array($data);
        $content = $this->template->fetch('file:' . $this->template_path . $name . '.tpl');

        if ($fetch === false) {
            $this->template->assign('content', $content);
            $this->template->display('file:' . $this->template_path . '../main.tpl', [], false);
        } else {
            return $content;
        }

        /** Profilers */
        //        $this->template->run_info();
        //        echo ShopCore::app()->SPropelLogger->displayAsTable();
    }

    public static function getShowUntranslated() {
        return self::$doShowUntranslated;
    }

    /**
     * @param string $name
     * @param array $data
     */
    public function render_min($name, $data = []) {
        $this->template->add_array($data);
        return $this->template->display('file:' . $this->template_path . $name . '.tpl');
    }

}