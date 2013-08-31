<?php

/**
 * TODO:
 * ACL
 * 
 * Gallery
 *  -photo
 *  -video
 * {control gallery:photo $product->gallery}
 * {control gallery:video $product->gallery}
 * {control photo:xs $product->gallery->photo}
 * 
 * Social
 *  -comments
 *  -reviews
 *  -rating
 * {control social:comments $product->social}
 * {control social:reviews $product->social}
 * {control social:rating $product->social}
 * 
 * User
 * ex. in shop module extend $this->user->related('shop_user')->adress
 */

namespace CMS;

use WebLoader;
use Nette\Application\UI\Presenter;
use \JavaScriptPacker;

abstract class BasePresenter extends Presenter {

    /**
     * @var string
     */
    protected $baseBacklink;

    /**
     * @inject
     * @var \CMS\Component\Menu\MenuControl
     */
    public $menu;

    protected function startup() {
        parent::startup();
        $this->baseBacklink = $this->storeRequest();
    }

    protected function beforeRender() {
        parent::beforeRender();
        $this->template->backlink = $this->baseBacklink;
        $this->template->baseLayout = dirname(__DIR__) . '/templates/@layout.latte';
        $this->template->frontLayout = dirname(__DIR__) . '/Front/templates/@layout.latte';
        $this->template->adminLayout = dirname(__DIR__) . '/Admin/templates/@layout.latte';
    }

    /**
     * @return \WebLoader\Nette\CssLoader
     */
    protected function createComponentCss() {
        $dir = $this->context->parameters['wwwDir'] . '/temp';
        $files = new WebLoader\FileCollection();
        $files->addFiles($this->context->parameters['styles']['files']);
        $compiler = WebLoader\Compiler::createCssCompiler($files, $dir);
        $compiler->addFilter(function($css) {
                    return str_replace(array("\r\n", "\r", "\n", "\t", '  ', '    ', '    '), '', str_replace(': ', ':', preg_replace('!/\*[^*]*\*+([^/][^*]*\*+)*/!', '', $css)));
                });
        return new WebLoader\Nette\CssLoader($compiler, $this->template->basePath . '/temp');
    }

    /**
     * @return \WebLoader\Nette\JavaScriptLoader
     */
    protected function createComponentJs() {
        $dir = $this->context->parameters['wwwDir'] . '/temp';
        $files = new WebLoader\FileCollection();
        $files->addFiles($this->context->parameters['scripts']['files']);
        $compiler = WebLoader\Compiler::createJsCompiler($files, $dir);
        $compiler->addFilter(function($js) {
                    $packer = new JavaScriptPacker($js);
                    return $packer->pack();
                });
        return new WebLoader\Nette\JavaScriptLoader($compiler, $this->template->basePath . '/temp');
    }

    /**
     * @return MenuControl
     */
    protected function createComponentMenu() {
        return $this->menu;
    }

}