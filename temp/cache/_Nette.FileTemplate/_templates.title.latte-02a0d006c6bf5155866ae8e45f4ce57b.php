<?php //netteCache[01]000381a:2:{s:4:"time";s:21:"0.76611100 1374621453";s:9:"callbacks";a:2:{i:0;a:3:{i:0;a:2:{i:0;s:19:"Nette\Caching\Cache";i:1;s:10:"checkFiles";}i:1;s:59:"/var/www/cms/app/Menu/Components/Menu/templates/title.latte";i:2;i:1374621453;}i:1;a:3:{i:0;a:2:{i:0;s:19:"Nette\Caching\Cache";i:1;s:10:"checkConst";}i:1;s:25:"Nette\Framework::REVISION";i:2;s:28:"$WCREV$ released on $WCDATE$";}}}?><?php

// source file: /var/www/cms/app/Menu/Components/Menu/templates/title.latte

?><?php
// prolog Nette\Latte\Macros\CoreMacros
list($_l, $_g) = Nette\Latte\Macros\CoreMacros::initRuntime($template, '8gzcj2xjmm')
;
// prolog Nette\Latte\Macros\UIMacros

// snippets support
if (!empty($_control->snippetMode)) {
	return Nette\Latte\Macros\UIMacros::renderSnippets($_control, $_l, get_defined_vars());
}

//
// main template
//
if (isset($current)): echo Nette\Templating\Helpers::escapeHtml($current->title, ENT_NOQUOTES) ?>
 | <?php endif ;echo Nette\Templating\Helpers::escapeHtml($home->title, ENT_NOQUOTES) ;