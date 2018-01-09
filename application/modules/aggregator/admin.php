<?php

use aggregator\src\AggregatorFactory;
use aggregator\src\IAggregator;
use CMSFactory\assetManager;
use CMSFactory\ModuleSettings;

(defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * Image CMS
 * Sample Module Admin
 */
class Admin extends BaseAdminController
{

    /**
     * @var IAggregator[]
     */
    private $aggregators;

    /**
     * @var ModuleSettings
     */
    private $settings;

    public function __construct() {
        parent::__construct();
        $lang = new MY_Lang();
        $lang->load('aggregator');
        $this->settings    = ModuleSettings::ofModule('aggregator');
        $this->aggregators = AggregatorFactory::getAggregatorContainer($this->settings->get());

    }

    /**
     * Render all
     */
    public function index() {
        $configsView = [];
        foreach ($this->aggregators->getAggregators() as $aggregator) {

            $configsView[$aggregator->getId()] = $this->getView($aggregator);
        }

        assetManager::create()->setData(
            [
             'configsView' => $configsView,
             'aggregators' => $this->aggregators,
            ]
        )->renderAdmin('main');
    }

    /**
     * @param IAggregator $aggregator
     *
     * @return string
     */
    private function getView(IAggregator $aggregator) {
        $fields = '';

        foreach ($aggregator->getModuleViewFields() as $field) {

            $fields .= assetManager::create()
                                   ->setData($field)
                                   ->setData(['aggregator' => $aggregator])
                                   ->fetchAdminTemplate($field['type']);
        }

        $fileDir = UPLOADSPATH.'files/'.$aggregator->getId().'.xml';
        if(is_file($fileDir)) {
            $fields .= assetManager::create()
                ->setData(
                    [
                     'path' => site_url('/uploads/files/'.$aggregator->getId().'.xml'),
                     'time' => date('d F Y H:i:s.', filectime($fileDir)),
                     'size' => $this->filesize_formatted($fileDir),
                    ]
                )
                ->fetchAdminTemplate('savefile');
        }

        return assetManager::create()->setData(
            [
             'fields'     => $fields,
             'aggregator' => $aggregator,
            ]
        )->fetchAdminTemplate('block', false);

    }

    /**
     * @param string $path
     *
     * @return string
     */
    private function filesize_formatted($path) {
        $size = filesize($path);
        $units = [
                  'B',
                  'KB',
                  'MB',
                  'GB',
                  'TB',
                  'PB',
                  'EB',
                  'ZB',
                  'YB',
                 ];
        $power = $size > 0 ? floor(log($size, 1024)) : 0;
        return number_format($size / (1024 ** $power), 2, '.', ',') . ' ' . $units[$power];
    }

    public function save() {

        $configs = [];
        foreach ($this->aggregators as $aggregator) {
            if ($aggregatorConfigs = $this->input->post($aggregator->getId())) {
                $configs[$aggregator->getId()] = $aggregatorConfigs;
            }
        }
        $this->settings->set($configs);
        $this->lib_admin->log(lang('Settings in the aggregator has been saved', 'aggregator'));

    }

}