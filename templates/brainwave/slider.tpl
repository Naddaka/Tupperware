<!-- slider.tpl -->
<!-- Header with slider -->
<header id="home">
    <div id="slides" class="home-slider">
        {$category = get_category(76)}
        {$item = $CI->load->module('cfcm')->connect_fields($category, 'category')}
        {if strip_tags($item.field_menu) == 'Button'}
        <a class="logo" href="{site_url()}"> <img class="logo-img" style="max-width: {strip_tags($item.field_logowidth)}px; margin-top: {strip_tags($item.field_logotop)}" src="{$item.field_logo}?v=1.0.0" alt="LOGO"> </a>
        {/if}
        <div class="slides-container">
            {$pages = category_pages('78')}
            {foreach $pages as $item}
            {$item = $CI->load->module('cfcm')->connect_fields($item, 'page')}
            {if strip_tags($item.field_slideStyle) == 'Default'}
            <div class="slide{if strip_tags($item.field_textcolor) == 'Black'} text-black{/if}{if strip_tags($item.field_textcolor) == 'White'} text-white{/if}{if strip_tags($item.field_textcolor) == 'Gray'} text-gray{/if}" data-overlay-color="{if $item.field_bgcolor}{strip_tags($item.field_bgcolor)}{else:}#000{/if}" data-overlay-opacity="{if strip_tags($item.field_overlay) == 'OFF'}0{else:}{strip_tags($item.field_overlay)}{/if}"> <img src="{$item.field_pagephoto}?v=1.0.0" alt="">
                <div class="content">
                    <div class="display-tc">
                        <div class="text-center{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.45s"{/if}>
                         <!--Предварительное содержание -->
                         {if $item.prev_text}
                         <div class="h5 text-uppercase {if strip_tags($item.field_lineoff) == ''}underline-large{/if} display-ib mb-xs5 mb-md15">{strip_tags($item.prev_text)}</div>
                         {/if}
                     </div>
                     <!-- Заголовок -->
                     {if strip_tags($item.field_titleoff) == ''}
                     <h1 class="text-uppercase text-center mb-md20 mb-md40{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.55s"{/if}>{$item.title}</h1>
                     {/if}
                     <!-- Полное содержание -->
                     {if $item.full_text}
                     <div class="text-center">
                        <div class="container{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.55s"{/if}>
                            <div class="row">
                                <div class="col-sm-8 col-sm-offset-2">
                                    <p class="text-center mb-md20 mb-md40 mt15">{$item.full_text}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    {/if}
                    <div class="text-center"> 
                        {if $item.field_link}
                        <a href="{$item.field_link}" class="btn btn-primary btn-inverted scrollTo{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.65s"{/if}>{strip_tags($item.field_btname)}</a>
                        {/if} 
                        {if $item.field_getlink}
                        <a href="{$item.field_getlink}" class="btn btn-default btn-inverted{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.75s"{/if}>{strip_tags($item.field_gettext)}</a>
                        {/if} 
                    </div>
                </div>
            </div>
        </div>
        {/if}

        {if strip_tags($item.field_slideStyle) == 'Middle'}
        <div class="slide{if strip_tags($item.field_textcolor) == 'Black'} text-black{/if}{if strip_tags($item.field_textcolor) == 'White'} text-white{/if}{if strip_tags($item.field_textcolor) == 'Gray'} text-gray{/if}" data-overlay-color="{if $item.field_bgcolor}{strip_tags($item.field_bgcolor)}{else:}#000{/if}" data-overlay-opacity="{if strip_tags($item.field_overlay) == 'OFF'}0{else:}{strip_tags($item.field_overlay)}{/if}"> <img src="{$item.field_pagephoto}?v=1.0.0" alt="">
            <div class="content">
                <div class="display-tc">
                    <div class="text-center">
                        <!-- Заголовок -->
                        {if strip_tags($item.field_titleoff) == ''}
                        <div class="text-uppercase {if strip_tags($item.field_lineoff) == ''}underline-large{/if} display-ib mb-xs5 mb-md15">{$item.title}</div>
                        {/if}
                    </div>
                    <!-- Полное содержание -->
                    {if $item.full_text}
                    <div class="text-center">
                        <div class="container{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.55s"{/if}>
                            <div class="row">
                                <div class="col-sm-8 col-sm-offset-2">
                                    <p class="text-center mb-md20 mb-md40 mt15">{$item.full_text}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    {/if}
                    <!--Предварительное содержание -->
                    {if $item.prev_text}
                    <div class="middle-header text-uppercase text-center mt-md30 mb-md20 mb-md40{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.55s"{/if}>{$item.prev_text}</div>
                    {/if}
                    <div class="text-center"> 
                        {if $item.field_link}
                        <a href="{$item.field_link}" class="btn btn-primary btn-inverted scrollTo{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.65s"{/if}>{strip_tags($item.field_btname)}</a>
                        {/if} 
                        {if $item.field_getlink}
                        <a href="{$item.field_getlink}" class="btn btn-default btn-inverted{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.75s"{/if}>{strip_tags($item.field_gettext)}</a>
                        {/if} 
                    </div>
                </div>
            </div>
        </div>
        {/if}

        {if strip_tags($item.field_slideStyle) == 'Large'}
        <div class="slide{if strip_tags($item.field_textcolor) == 'Black'} text-black{/if}{if strip_tags($item.field_textcolor) == 'White'} text-white{/if}{if strip_tags($item.field_textcolor) == 'Gray'} text-gray{/if}" data-overlay-color="{if $item.field_bgcolor}{strip_tags($item.field_bgcolor)}{else:}#000{/if}" data-overlay-opacity="{if strip_tags($item.field_overlay) == 'OFF'}0{else:}{strip_tags($item.field_overlay)}{/if}"> <img src="{$item.field_pagephoto}?v=1.0.0" alt="">
            <div class="content">
                <div class="display-tc">
                    <div class="text-center">
                       <!--  <a class="logo-in-slide" href="{site_url()}"> <img class="logo-img" src="{echo siteinfo('siteinfo_logo')}?v=1.0.0" alt=""> </a> -->
                       <!-- Заголовок -->
                       {if strip_tags($item.field_titleoff) == ''}
                       <div class="large-header text-uppercase {if strip_tags($item.field_lineoff) == ''}underline-large{/if} display-ib mb-xs5 mb-md15{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeIn{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.5s"{/if}>{$item.title}</div>
                       {/if}
                   </div>
                   <!-- Полное содержание -->
                   {if $item.full_text}
                   <div class="text-center">
                    <div class="container{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeIn{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.5s"{/if}>
                        <div class="row">
                            <div class="col-sm-8 col-sm-offset-2">
                                <p class="text-center mb-md20 mb-md40 mt15">{$item.full_text}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                {/if}
                <!--Предварительное содержание -->
                {if $item.prev_text}
                <div class="h5 text-uppercase text-center mt-md15 mb-md20 mb-md40{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.75s"{/if}>{strip_tags($item.prev_text)}</div>
                {/if}
                <div class="text-center"> 
                    {if $item.field_link}
                    <a href="{$item.field_link}" class="btn btn-primary btn-inverted scrollTo{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.75s"{/if}>{strip_tags($item.field_btname)}</a>
                    {/if} 
                    {if $item.field_getlink}
                    <a href="{$item.field_getlink}" class="btn btn-default btn-inverted{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.75s"{/if}>{strip_tags($item.field_gettext)}</a>
                    {/if} 
                </div>
            </div>
        </div>
    </div>
    {/if}
    {if strip_tags($item.field_slideStyle) == 'Text rotator'}
    <div class="home-text-rotate image{if strip_tags($item.field_textcolor) == 'Black'} text-black{/if}{if strip_tags($item.field_textcolor) == 'White'} text-white{/if}{if strip_tags($item.field_textcolor) == 'Gray'} text-gray{/if}" data-background="{$item.field_pagephoto}?v=1.0.0" data-overlay-color="{if $item.field_bgcolor}{strip_tags($item.field_bgcolor)}{else:}#000{/if}" data-overlay-opacity="{if strip_tags($item.field_overlay) == 'OFF'}0{else:}{strip_tags($item.field_overlay)}{/if}">
        <div class="slide">
            <div class="content">
                <div class="display-tc">
                    <div class="text-center {if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.35s"{/if}>
                        {if strip_tags($item.field_titleoff) == ''}
                        <div class="h5 white text-uppercase underline-large display-ib mb-xs5 mb-md5">{$item.title}</div>
                        {/if}
                    </div>
                    <div class="h1 white text-uppercase text-center mb-xs5 mb-md30 fadeInUp wow" data-wow-delay=".55s">{strip_tags($item.prev_text)}<span class="js-rotating" data-animation="flipInX">{strip_tags($item.full_text)}</span></div>
                    <div class="text-center"> 
                       {if $item.field_link}
                       <a href="{$item.field_link}" class="btn btn-primary{if strip_tags($item.field_textcolor) == 'White'} btn-inverted{/if} scrollTo{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.85s"{/if}>{strip_tags($item.field_btname)}</a>
                       {/if} 
                       {if $item.field_getlink}
                       <a href="{$item.field_getlink}" class="btn btn-default {if strip_tags($item.field_textcolor) == 'White'} btn-inverted{/if}{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.90s"{/if}>{strip_tags($item.field_gettext)}</a>
                       {/if}  
                   </div>
               </div>
           </div>
       </div>
   </div>
   {/if}
        
        {if strip_tags($item.field_slideStyle) == 'Block left' or strip_tags($item.field_slideStyle) == 'Block right'}
       
        <div class="slide{if strip_tags($item.field_textcolor) == 'Black'} text-black{/if}{if strip_tags($item.field_textcolor) == 'White'} text-white{/if}{if strip_tags($item.field_textcolor) == 'Gray'} text-gray{/if}"> <img src="{$item.field_pagephoto}?v=1.0.0" alt="">
            <div class="content">
                <div id="slide-block-lr" class="display-tc">
                         <div class="container">
                 <div class="row">
                    <div class="col-sm-12">
                    <div class="slider-block-r{if strip_tags($item.field_slideStyle) == 'Block right'} alignright{/if}{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.35s"{/if} data-overlay-color="{if $item.field_bgcolor}{strip_tags($item.field_bgcolor)}{else:}#000{/if}" data-overlay-opacity="{if strip_tags($item.field_overlay) == 'OFF'}0{else:}{strip_tags($item.field_overlay)}{/if}">

                            <!-- Заголовок -->
                            {if strip_tags($item.field_titleoff) == ''}
                            <div class="slide-title {if strip_tags($item.field_lineoff) == ''}underline-large{/if}{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.55s"{/if}>{$item.title}</div>
                            {/if}

                            <!--Предварительное содержание -->
                            {if $item.prev_text}
                            <div class="slide-prevtext{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.65s"{/if}>{$item.prev_text}</div>
                            {/if}

                            <!-- Полное содержание -->
                            {if $item.full_text}
                            <div class="slide-fulltext{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.75s"{/if}>
                                <div class="row">
                                    <div class="col-sm-8 col-sm-offset-2">
                                        <p class="text-center mb-md20 mb-md40 mt15">{$item.full_text}</p>
                                    </div>
                                </div>
                            </div>
                            {/if}
                            <!-- Кнопки -->
                            {if $item.field_link}
                            <a href="{$item.field_link}" class="btn btn-primary{if strip_tags($item.field_textcolor) == 'White'} btn-inverted{/if} scrollTo{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.85s"{/if}>{strip_tags($item.field_btname)}</a>
                            {/if} 
                            {if $item.field_getlink}
                            <a href="{$item.field_getlink}" class="btn btn-default {if strip_tags($item.field_textcolor) == 'White'} btn-inverted{/if}{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay="0.90s"{/if}>{strip_tags($item.field_gettext)}</a>
                            {/if} 

                        </div>          
                    </div>

                </div>
            </div>
               </div>
           </div>
       </div>
    {/if}
    {/foreach}

</div>

<nav class="slides-navigation"> <a href="#" class="next"><i class="fa fa-angle-right"></i></a> <a href="#" class="prev"><i class="fa fa-angle-left"></i></a> </nav>
</div>
{$category = get_category(76)}
{$item = $CI->load->module('cfcm')->connect_fields($category, 'category')}
<div class="scroll-btn-wrapper">
    <a href="#block-center" class="scroll-down scrollTo{if strip_tags($item.field_mouseColor) == 'Black'} inverted{/if}{if strip_tags($item.field_mouseColor) == 'Gray'} inverted2{/if}"><img class="scroll-down-img" src="{$THEME}img/mouse.png?v=1.0.0" alt="">{echo siteinfo('siteinfo_transl-scroll')}</a>
</div>
</header>