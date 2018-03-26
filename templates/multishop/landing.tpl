<!-- landing.tpl -->
{foreach $pages as $page}
{$page = $CI->load->module('cfcm')->connect_fields($page, 'page')}
{if $page.field_video}
<div class="page-section bg-section {strip_tags($page.field_hight)} {strip_tags($page.field_bgposition)}" data-background="{$page.field_bgimage}?v=1.0.0" data-overlay-color="#000" data-overlay-opacity="0.5">
  <div class="text-center">
    <a href="{$page.field_video}" class="popup-youtube big-icon white"><div class="circle pulse"></div><i class="fa fa-play"></i></a>
    <div>
      <h2 class="text-uppercase title-3 white mt50">{$page.title}</h2>
    </div>
    <span class="sub-header white opacity-50 text-uppercase ls-02">{strip_tags($page.prev_text)}</span>
  </div>
</div>
{else:}
<!-- Главный контейнер (стили блоков / настройки фона, цвета текста и другие) -->
<div id="{if strip_tags($page.field_lanpage) == 'Default'}page-standart{/if}{if strip_tags($page.field_lanpage) == 'Centered'}block-center{/if}{if strip_tags($page.field_lanpage) == 'Text right'}block-right{/if}{if strip_tags($page.field_lanpage) == 'Text left'}block-left{/if}{if strip_tags($page.field_lanpage) == 'Picture alignment to bottom'}block-img-bottom{/if}{if strip_tags($page.field_lanpage) == 'Only the photo as a background'}only-img-bg{/if}{if strip_tags($page.field_lanpage) == 'Two columns'}two-collum{/if}{if strip_tags($page.field_lanpage) == 'Photos-left'}photos-left{/if}{if strip_tags($page.field_lanpage) == 'Photos-right'}photos-right{/if}" class="page-section bg-section{if strip_tags($page.field_bgfixed) == 'ON'} fixed{/if}{if strip_tags($page.field_cover) == 'Fill'} cover{/if}{if strip_tags($page.field_cover) == 'Fit'} contain{/if}{if strip_tags($page.field_cover) == 'Original'} origin{/if}{if strip_tags($page.field_textcolor) == 'Black'} text-black{/if}{if strip_tags($page.field_textcolor) == 'White'} text-white{/if}{if strip_tags($page.field_textcolor) == 'Gray'} text-gray{/if} {strip_tags($page.field_bgposition)}" data-background="{$page.field_bgimage}?v=1.0.0" style="background-color:{$page.field_bgcolor}" {if strip_tags($page.field_lanpage) == 'Text right' or strip_tags($page.field_lanpage) == 'Text left'}{else:}{if strip_tags($page.field_overlay) == 'OFF'}{else:}data-overlay-color="{if $page.field_bgcolor}{strip_tags($page.field_bgcolor)}{else:}#000{/if}" data-overlay-opacity="{strip_tags($page.field_overlay)}"{/if}{/if}>
{if strip_tags($page.field_onlywidget) == ''}
<div class="container"{if strip_tags($page.field_lanpage) == 'Text right' or strip_tags($page.field_lanpage) == 'Text left'}{else:} style="padding: {if strip_tags($page.field_martop) == '0'}0{else:}{if $page.field_martop}{$page.field_martop}px{else:}70px{/if}{/if} 15px{if strip_tags($page.field_marbot) == '0'} 0{else:}{if $page.field_marbot} {$page.field_marbot}px{else:} 70px{/if}{/if}"{/if}>
    <div class="row">
       
      {if strip_tags($page.field_lanpage) == 'Photos-left'}<!-- Стиль блока «Photos-left» --> 
       <div class="col-sm-6">
        <div class="layers">
        {if $page.field_pagephoto}
        <img src="{$page.field_pagephoto}?v=1.0.0" alt="" class="layer{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInLeft{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.2s"{/if} width="555" height="439">{/if}
        {if $page.field_accent1}
        <img src="{$page.field_accent1}?v=1.0.0" alt="" class="layer{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInLeft{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.1s"{/if} width="555" height="439">{/if}
        {if $page.field_accent2}
        <img src="{$page.field_accent2}?v=1.0.0" alt="" class="{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'}fadeInLeft{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0"{/if} width="555" height="439">{/if}
          </div>
        </div>
        <div class="col-sm-6">
        {if strip_tags($page.full_text)}
          <h5 class="text-uppercase title-2 mb20 opacity-60{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay=".45s" style="visibility: visible; animation-delay: 0.45s; animation-name:{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if}"{/if}>{strip_tags($page.full_text)}</h5>{/if}
          <!-- Заголовок -->
          {if strip_tags($page.field_titleoff) == ''}<h2 class="{if strip_tags($page.field_uppercase) == ''}{else:}uppercase {/if}mb30{if strip_tags($page.field_bigh) == 'Monster'} giant{/if}{if strip_tags($page.field_bigh) == 'Big'} bigh{/if}{if strip_tags($page.field_bigh) == 'Middle'} middle{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:}{strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="1.00s" style="visibility: visible; animation-delay: 1.00s; animation-name:{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if}"{/if}>{$page.title}</h2>{/if}
          {if strip_tags($page.prev_text)}
        <!-- Предварительное содержимое -->
     <div class="{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="1.35s" style="visibility: visible; animation-delay: 1.35s; animation-name:{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if}"{/if}>{$page.prev_text}</div>{/if}

   
     {if $page.field_link}  <!-- Button «Подробнее» 1 (1)-->
     <a href="{$page.field_link}" class="btn btn-primary{if strip_tags($page.field_textcolor) == 'White'}  btn-inverted{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay=".75s"{/if} style="background-color:{echo siteinfo('siteinfo_color')}">{strip_tags($page.field_btname)}</a>
     <!--/ Button «Подробнее» -->{/if} 
     
     {if $page.field_getlink}<!-- Button «Подробнее 2» (2) -->
     <a href="{$page.field_getlink}" class="btn btn-default{if strip_tags($page.field_textcolor) == 'White'}  btn-inverted{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.75s"{/if} style="background-color:{echo siteinfo('siteinfo_color')}">{strip_tags($page.field_gettext)}</a>
     <!--/ Button «Подробнее 2» -->{/if}
     
        </div>
      <!--/ Photos-left -->{/if} 
      {if strip_tags($page.field_lanpage) == 'Photos-right'}<!-- Стиль блока Photos-right --> 
          
        <div class="col-sm-6">
        {if strip_tags($page.full_text)}
          <h5 class="text-uppercase title-2 mb0 opacity-60{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay=".45s" style="visibility: visible; animation-delay: 0.45s; animation-name:{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if}"{/if}>{strip_tags($page.full_text)}</h5>{/if}
          <!-- Заголовок -->
          {if strip_tags($page.field_titleoff) == ''}<h2 class="{if strip_tags($page.field_uppercase) == ''}{else:}uppercase {/if}mb30{if strip_tags($page.field_bigh) == 'Monster'} giant{/if}{if strip_tags($page.field_bigh) == 'Big'} bigh{/if}{if strip_tags($page.field_bigh) == 'Middle'} middle{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="1.00s" style="visibility: visible; animation-delay: 1.00s; animation-name:{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if}"{/if}>{$page.title}</h2>{/if}
          {if strip_tags($page.prev_text)}
        <!-- Предварительное содержимое -->
     <div class="{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="1.35s" style="visibility: visible; animation-delay: 1.35s; animation-name:{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if}"{/if}>{$page.prev_text}</div>{/if}
     
     {if $page.field_link}<!-- Button «Подробнее» 1 (3)-->
     <a href="{$page.field_link}" class="btn btn-primary{if strip_tags($page.field_textcolor) == 'White'}  btn-inverted{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay=".75s"{/if} style="background-color:{echo siteinfo('siteinfo_color')}">{strip_tags($page.field_btname)}</a>
     <!--/ Button «Подробнее» -->{/if} 
     
     {if $page.field_getlink}<!-- Button «Подробнее 2» (4) -->
     <a href="{$page.field_getlink}" class="btn btn-default{if strip_tags($page.field_textcolor) == 'White'}  btn-inverted{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.75s"{/if} style="background-color:{echo siteinfo('siteinfo_color')}">{strip_tags($page.field_gettext)}</a>
     <!--/ Button «Подробнее 2» -->{/if}
    
    </div>

      <div class="col-sm-6">
        <div class="layers mb-xs40 mt-sm80 mb-md0 mt-md0 mb-lg-50 mt-lg-50">
        {if $page.field_pagephoto}
        <img src="{$page.field_pagephoto}?v=1.0.0" alt="" class="layer{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.2s"{/if} width="555" height="439">{/if}
        {if $page.field_accent1}
        <img src="{$page.field_accent1}?v=1.0.0" alt="" class="layer{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.1s"{/if} width="555" height="439">{/if}
        {if $page.field_accent2}
        <img src="{$page.field_accent2}?v=1.0.0" alt="" class="{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'}fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0"{/if} width="555" height="439">{/if}
          </div>
        </div>
      <!--/ Photos right -->{/if} 

      {if strip_tags($page.field_lanpage) == 'Text right' or strip_tags($page.field_lanpage) == 'Text left'} 
      <!-- Стиль блока «Text right» или «Text left» -->      
      <div class="demi-1">
        <!-- Основное фото -->
        {if $page.field_pagephoto}
        {if strip_tags($page.field_imgmask) == 'Rectangle'}
        <img class="{strip_tags($page.field_imgsize)}" src="{$page.field_pagephoto}" alt="{$page.field_alt}" />
        {else:}
        {if strip_tags($page.field_imgmask) == 'Circle'}
        <div class="img-crop {strip_tags($page.field_imgsize)}">
         <div class="img-mask {strip_tags($page.field_imgsize)}" style="background-image:url({$page.field_pagephoto})"> 
           {if $page.field_alt}
           <span>
             {$page.field_alt}  
           </span> {/if}
         </div>
       </div>
       {/if}
       {if strip_tags($page.field_imgmask) == 'Rounded'}
       <div class="img-crop {strip_tags($page.field_imgsize)}">
         <div class="img-round {strip_tags($page.field_imgsize)}" style="background-image:url({$page.field_pagephoto})"> 
           {if $page.field_alt}
           <span>
             {$page.field_alt}  
           </span> {/if}
         </div>
       </div>
       {/if}
       {/if}
       {/if}<!-- /Основное фото -->
     </div>
     <div{if $page.field_anchor} id="{$page.field_anchor}"{/if} class="demi-2 {strip_tags($page.field_hight)}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} slideInRight{else:} {strip_tags($page.field_animation)}{/if} wow{/if}{if strip_tags($page.field_colwidth) == 'Wide'}{/if}{if strip_tags($page.field_colwidth) == 'Default'} col-default{/if}{if strip_tags($page.field_colwidth) == 'Middle'} col-middle{/if}{if strip_tags($page.field_colwidth) == 'Tight'} col-tight{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.75s" style="visibility: visible; animation-delay: 0.75s; animation-name:{if strip_tags($page.field_animation) == 'Default'} slideInRight{else:} {strip_tags($page.field_animation)}{/if}"{/if} {if $page.field_bgcolor}data-overlay-color="{if $page.field_bgcolor}{strip_tags($page.field_bgcolor)}{else:}#000{/if}"{/if} {if strip_tags($page.field_overlay) == 'OFF'}{else:}data-overlay-opacity="{strip_tags($page.field_overlay)}"{/if}>
     <!-- Заголовок -->
     {if strip_tags($page.field_titleoff) == ''}<div class="{if strip_tags($page.field_uppercase) == ''}{else:}uppercase {/if}h2{if strip_tags($page.field_bigh) == 'Monster'} giant{/if}{if strip_tags($page.field_bigh) == 'Big'} bigh{/if}{if strip_tags($page.field_bigh) == 'Middle'} middle{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="1.00s" style="visibility: visible; animation-delay: 1.00s; animation-name:{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if}"{/if}>{$page.title}</div>
     {/if}
     <!-- Предварительное содержимое -->
     <div class="prev{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="1.35s" style="visibility: visible; animation-delay: 1.35s; animation-name:{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if}"{/if}>{$page.prev_text}</div>
     {if $page.full_text}
     <!-- Полное содержимое -->
     <div class="full{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay=".45s" style="visibility: visible; animation-delay: 0.45s; animation-name:{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if}"{/if}>{$page.full_text}</div>{/if}
     <!-- Button «Подробнее» 1 (5) -->
     {if $page.field_link}
     <a href="{$page.field_link}" class="btn btn-primary{if strip_tags($page.field_textcolor) == 'White'}  btn-inverted{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay=".75s"{/if} style="background-color:{echo siteinfo('siteinfo_color')}">{strip_tags($page.field_btname)}</a>
     {/if} <!--/ Button «Подробнее» -->
   </div> 
   <div class="clearing"></div>
   {/if} <!--/ Text right или слева -->

   <!-- Стиль блока «Two columns» -->
   {if strip_tags($page.field_lanpage) == 'Two columns'} 
   <!-- Заголовок, предварительное и полное содержимое -->
 

 {if strip_tags($page.field_titleoff) == ''}<span class="two-title {if strip_tags($page.field_uppercase) == ''}{else:}uppercase {/if}h2{if strip_tags($page.field_bigh) == 'Monster'} giant{/if}{if strip_tags($page.field_bigh) == 'Big'} bigh{/if}{if strip_tags($page.field_bigh) == 'Middle'} middle{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if} wow{/if} {strip_tags($page.field_bgposition)}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.1s"{/if} style="{if strip_tags($page.field_textcolor) == 'Black'}color: #333{/if}{if strip_tags($page.field_textcolor) == 'White'}color: #fff{/if}{if strip_tags($page.field_textcolor) == 'Gray'}color: #666{/if}{if strip_tags($page.field_textcolor) == 'Color 1'}color:{echo siteinfo('siteinfo_color')}{/if}{if strip_tags($page.field_textcolor) == 'Color 2'}color:{echo siteinfo('siteinfo_color2')}{/if}">{$page.title}</span>
 {/if}     
 <div{if $page.field_anchor} id="{$page.field_anchor}"{/if} class="col-sm-6">
 {$page.prev_text}
 <!-- Button «Подробнее» 1 (6) -->
  {if $page.field_link}
  <a href="{$page.field_link}" class="btn btn-primary{if strip_tags($page.field_textcolor) == 'White'}  btn-inverted{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.65s"{/if}>{strip_tags($page.field_btname)}</a>
  {/if} 
</div>
<div class="col-sm-6">
 {$page.full_text}
<!-- Button «Подробнее» 2 (7) -->
  {if $page.field_getlink}
  <a href="{$page.field_getlink}" class="btn btn-primary{if strip_tags($page.field_textcolor) == 'White'}  btn-inverted{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.75s"{/if}>{strip_tags($page.field_gettext)}</a>
  {/if} 
</div>
{/if} <!--/ Two columns -->

<!-- Стиль блока «World» -->
{if strip_tags($page.field_lanpage) == 'World'}
<div id="worldless{if $page.field_anchor} {$page.field_anchor}{/if}" class="col-sm-12">
  {if strip_tags($page.field_titleoff) == ''}<h2 class="text-center {if strip_tags($page.field_uppercase) == ''}{else:}uppercase {/if}mb30{if strip_tags($page.field_bigh) == 'Monster'} giant{/if}{if strip_tags($page.field_bigh) == 'Big'} bigh{/if}{if strip_tags($page.field_bigh) == 'Middle'} middle{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:}{strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="1.00s" style="visibility: visible; animation-delay: 1.00s; animation-name:{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if}"{/if}>{$page.title}</h2>{/if} </div>
  <div class="col-sm-12 col-md-6 text-center">
    <!-- Основное фото -->
    {if $page.field_pagephoto}
    {if strip_tags($page.field_imgmask) == 'Rectangle'}
    <img class="{strip_tags($page.field_imgsize)}" src="{$page.field_pagephoto}" alt="{$page.field_alt}" />
    {else:}
    {if strip_tags($page.field_imgmask) == 'Circle'}
    <div class="img-crop {strip_tags($page.field_imgsize)}">
     <div class="img-mask {strip_tags($page.field_imgsize)}" style="background-image:url({$page.field_pagephoto})"> 
       {if $page.field_alt}
       <span>
         {$page.field_alt}  
       </span> {/if}
     </div>
   </div>
   {/if}
   {if strip_tags($page.field_imgmask) == 'Rounded'}
   <div class="img-crop {strip_tags($page.field_imgsize)}">
     <div class="img-round {strip_tags($page.field_imgsize)}" style="background-image:url({$page.field_pagephoto})"> 
       {if $page.field_alt}
       <span>
         {$page.field_alt}  
       </span> {/if}
     </div>
   </div>
   {/if}
   {/if}
   {/if}<!-- /Основное фото -->
 </div>
 <div class="col-sm-12 col-md-6">
  <div class="row">
    <div class="col-sm-6 col-md-6">
      <div class="list">
        {$page.prev_text}
      </div>
    </div>
    <div class="col-sm-6 col-md-6">
      <div class="list">
        {$page.full_text}
      </div>
    </div>
  </div>
</div>

{/if} <!--/ World -->

<!-- Стиль блока «Centered» -->
{if strip_tags($page.field_lanpage) == 'Centered'}
<div{if $page.field_anchor} id="{$page.field_anchor}"{/if} class="{if strip_tags($page.field_colwidth) == 'Wide'}col-sm-12{/if}{if strip_tags($page.field_colwidth) == 'Default'}col-sm-offset-1 col-sm-10{/if}{if strip_tags($page.field_colwidth) == 'Middle'}col-sm-offset-2 col-sm-8{/if}{if strip_tags($page.field_colwidth) == 'Tight'}col-sm-offset-4 col-sm-4{/if}">

<!-- Основное фото -->
{if $page.field_pagephoto}
{if strip_tags($page.field_imgmask) == 'Rectangle'}
<img class="{strip_tags($page.field_imgsize)}" src="{$page.field_pagephoto}" alt="{$page.field_alt}" />
{else:}
{if strip_tags($page.field_imgmask) == 'Circle'}
<div class="img-crop {strip_tags($page.field_imgsize)}">
 <div class="img-mask {strip_tags($page.field_imgsize)}" style="background-image:url({$page.field_pagephoto})"> 
   {if $page.field_alt}
   <span>
     {$page.field_alt}  
   </span> {/if}
 </div>
</div>
{/if}
{if strip_tags($page.field_imgmask) == 'Rounded'}
<div class="img-crop {strip_tags($page.field_imgsize)}">
 <div class="img-round {strip_tags($page.field_imgsize)}" style="background-image:url({$page.field_pagephoto})"> 
   {if $page.field_alt}
   <span>
     {$page.field_alt}  
   </span> {/if}
 </div>
</div>
{/if}
{/if}
{/if}<!-- /Основное фото -->
<!-- Заголовок, предварительное и полное содержимое -->
{if strip_tags($page.field_titleoff) == ''}<div class="{if strip_tags($page.field_uppercase) == ''}{else:}uppercase {/if}h2{if strip_tags($page.field_bigh) == 'Monster'} giant{/if}{if strip_tags($page.field_bigh) == 'Big'} bigh{/if}{if strip_tags($page.field_bigh) == 'Middle'} middle{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.1s"{/if} style="{if strip_tags($page.field_textcolor) == 'Black'}color: #333{/if}{if strip_tags($page.field_textcolor) == 'White'}color: #fff{/if}{if strip_tags($page.field_textcolor) == 'Gray'}color: #666{/if}{if strip_tags($page.field_textcolor) == 'Color 1'}color:{echo siteinfo('siteinfo_color')}{/if}{if strip_tags($page.field_textcolor) == 'Color 2'}color:{echo siteinfo('siteinfo_color2')}{/if}">{$page.title}</div>
{else:}
{/if}

<div class="table-wrapper">
  <div class="prev {strip_tags($page.field_hight)}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.2s"{/if}>{$page.prev_text}
{if strip_tags($page.field_typeAccent) == 'OFF'}
<!-- Button «Подробнее» (8) -->
<div class="text-center"> 
  {if $page.field_link}
  <a href="{$page.field_link}" class="btn btn-primary{if strip_tags($page.field_textcolor) == 'White'}  btn-inverted{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.65s"{/if}>{strip_tags($page.field_btname)}</a>
  {/if} 
  {if $page.field_getlink}
  <a href="{$page.field_getlink}" class="btn btn-primary{if strip_tags($page.field_textcolor) == 'White'}  btn-inverted{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.75s"{/if}>{strip_tags($page.field_gettext)}</a>
  {/if} 
</div> <!-- /Button «Подробнее» -->
{else:}
{if $page.field_getlink}
  <a href="{$page.field_getlink}" class="btn btn-primary{if strip_tags($page.field_textcolor) == 'White'}  btn-inverted{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.75s"{/if}>{strip_tags($page.field_gettext)}</a>
  {/if} 
{/if}</div>
</div>

<div class="full">{$page.full_text}</div>

</div> <!-- /Стиль блока «Centered» -->

<!--/ Centered -->{/if} 


{if strip_tags($page.field_lanpage) == 'Default'}<!-- Стиль блока «Default» -->
<div{if $page.field_anchor} id="{$page.field_anchor}"{/if} class="{if strip_tags($page.field_colwidth) == 'Wide'}col-sm-12{/if}{if strip_tags($page.field_colwidth) == 'Default'}col-sm-offset-1 col-sm-10{/if}{if strip_tags($page.field_colwidth) == 'Middle'}col-sm-offset-2 col-sm-8{/if}{if strip_tags($page.field_colwidth) == 'Tight'}col-sm-offset-4 col-sm-4{/if}">


<!-- Заголовок, предварительное и полное содержимое -->
{if strip_tags($page.field_titleoff) == ''}<div class="{if strip_tags($page.field_uppercase) == ''}{else:}uppercase {/if}h2{if strip_tags($page.field_bigh) == 'Monster'} giant{/if}{if strip_tags($page.field_bigh) == 'Big'} bigh{/if}{if strip_tags($page.field_bigh) == 'Middle'} middle{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.1s"{/if} style="{if strip_tags($page.field_textcolor) == 'Black'}color: #333{/if}{if strip_tags($page.field_textcolor) == 'White'}color: #fff{/if}{if strip_tags($page.field_textcolor) == 'Gray'}color: #666{/if}{if strip_tags($page.field_textcolor) == 'Color 1'}color:{echo siteinfo('siteinfo_color')}{/if}{if strip_tags($page.field_textcolor) == 'Color 2'}color:{echo siteinfo('siteinfo_color2')}{/if}">{$page.title}</div>
{else:}<!--<div class="margin"></div> -->
{/if}

<div class="table-wrapper">
  <div class="prev {strip_tags($page.field_hight)}">{$page.prev_text}</div>
</div>

<div class="full">

  
  {if $page.field_pagephoto}<!-- Основное фото -->
  {if strip_tags($page.field_imgmask) == 'Rectangle'}
  <img class="{strip_tags($page.field_imgsize)}" src="{$page.field_pagephoto}" alt="{$page.field_alt}" />
  {else:}
  {if strip_tags($page.field_imgmask) == 'Circle'}
  <div class="img-crop {strip_tags($page.field_imgsize)}">
   <div class="img-mask {strip_tags($page.field_imgsize)}" style="background-image:url({$page.field_pagephoto})"> 
     {if $page.field_alt}
     <span>
       {$page.field_alt}  
     </span> {/if}
   </div>
 </div>
 {/if}
 {if strip_tags($page.field_imgmask) == 'Rounded'}
 <div class="img-crop {strip_tags($page.field_imgsize)}">
   <div class="img-round {strip_tags($page.field_imgsize)}" style="background-image:url({$page.field_pagephoto})"> 
     {if $page.field_alt}
     <span>
       {$page.field_alt}  
     </span> {/if}
   </div>
 </div>
 {/if}
 {/if}
 <!-- /Основное фото -->{/if}
 {$page.full_text}</div>
 {if strip_tags($page.field_typeAccent) == 'OFF'}
 
 {if $page.field_link}<!-- Button «Подробнее» (9) -->
 <a href="{$page.field_link}" class="btn btn-default{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay=".75s"{/if} style="color:{echo siteinfo('siteinfo_color')};border-color:{echo siteinfo('siteinfo_color')}">{strip_tags($page.field_btname)}</a>
 <!-- /Button «Подробнее» -->{/if} 
 {/if}
</div> <!-- /Стиль блока «Default» -->
{/if}
</div><!-- /row -->


{if strip_tags($page.field_typeAccent) == 'Pictures'}<!-- Blocks-акценты -->
<div id="accent-pictures" class="row m-top70">
  <div class="col-sm-12 text-center">

    {if $page.field_accent1}
    <div class="{if $page.field_accent4}col-md-3 col-sm-6{else:}{if $page.field_accent3}col-md-4{else:}{if $page.field_accent2}col-md-6{else:}col-md-12{/if}{/if}{/if}">
      <div class="accent-img{if strip_tags($page.field_imgmask) == 'Rectangle'} accent-rectangle{/if}{if strip_tags($page.field_imgmask) == 'Circle'} accent-mask {strip_tags($page.field_imgsize)}{/if}{if strip_tags($page.field_cover) == 'Fill'} cover{/if}{if strip_tags($page.field_cover) == 'Fit'} contain{/if}{if strip_tags($page.field_cover) == 'Original'} origin{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.1s"{/if} style="background-image:url({$page.field_accent1})"></div>
      <div class="{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.2s"{/if}>{$page.field_accent1text}</div>
    </div>
    {/if}<!-- /accent 1 -->

    {if $page.field_accent2}
    <div class="{if $page.field_accent4}col-md-3 col-sm-6{else:}{if $page.field_accent3}col-md-4{else:}col-md-6{/if}{/if}">
      <div class="accent-img{if strip_tags($page.field_imgmask) == 'Rectangle'} accent-rectangle{/if}{if strip_tags($page.field_imgmask) == 'Circle'} accent-mask {strip_tags($page.field_imgsize)}{/if}{if strip_tags($page.field_cover) == 'Fill'} cover{/if}{if strip_tags($page.field_cover) == 'Fit'} contain{/if}{if strip_tags($page.field_cover) == 'Original'} origin{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.2s"{/if} style="background-image:url({$page.field_accent2})"></div>
      <div class="{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.3s"{/if}>{$page.field_accent2text}</div>
    </div>
    {/if}<!-- /accent 2 -->

    {if $page.field_accent3}
    <div class="{if $page.field_accent4}col-md-3 col-sm-6{else:}col-md-4{/if}">
      <div class="accent-img{if strip_tags($page.field_imgmask) == 'Rectangle'} accent-rectangle{/if}{if strip_tags($page.field_imgmask) == 'Circle'} accent-mask {strip_tags($page.field_imgsize)}{/if}{if strip_tags($page.field_cover) == 'Fill'} cover{/if}{if strip_tags($page.field_cover) == 'Fit'} contain{/if}{if strip_tags($page.field_cover) == 'Original'} origin{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.3s"{/if} style="background-image:url({$page.field_accent3})"></div>
      <div class="{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.4s"{/if}>{$page.field_accent3text}</div>
    </div>
    {/if}<!-- /accent 3 -->

    {if $page.field_accent4}
    <div class="col-md-3 col-sm-6">
      <div class="accent-img{if strip_tags($page.field_imgmask) == 'Rectangle'} accent-rectangle{/if}{if strip_tags($page.field_imgmask) == 'Circle'} accent-mask {strip_tags($page.field_imgsize)}{/if}{if strip_tags($page.field_cover) == 'Fill'} cover{/if}{if strip_tags($page.field_cover) == 'Fit'} contain{/if}{if strip_tags($page.field_cover) == 'Original'} origin{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.4s"{/if} style="background-image:url({$page.field_accent4})"></div>
      <div class="{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.5s"{/if}>{$page.field_accent4text}</div>
    </div>
    {/if}<!-- /accent 4 -->

  </div>
</div>
<!-- /row (Blocks-акценты) -->
{/if}

{if strip_tags($page.field_typeAccent) == 'Icons'}
<div class="row m-top70">
  <div class="col-sm-12 text-center">

    {if $page.field_accent1}
    <div class="service">
      <div class="icon-wrapper fadeInUp wow" data-wow-delay="0.4s">
        <div class="icon-box"> 
          <div class="accent-img" style="background-image:url({$page.field_accent1})"></div>
        </div>
      </div>
      <div class="title fadeInUp wow" data-wow-delay="0.1s">{$page.field_accent1text}</div>
    </div>
    {/if}<!-- /accent 1 -->

    {if $page.field_accent2}
    <div class="service">
      <div class="icon-wrapper fadeInUp wow">
        <div class="icon-box"> 
          <div class="accent-img" style="background-image:url({$page.field_accent2})"></div>
        </div>
      </div>
      <div class="title fadeInUp wow" data-wow-delay="0.1s">{$page.field_accent2text}</div>
    </div>
    {/if}<!-- /accent 2 -->

    {if $page.field_accent3}
    <div class="service">
      <div class="icon-wrapper fadeInUp wow">
        <div class="icon-box"> 
          <div class="accent-img" style="background-image:url({$page.field_accent3})"></div>
        </div>
      </div>
      <div class="title fadeInUp wow" data-wow-delay="0.1s">{$page.field_accent3text}</div>
    </div>
    {/if}<!-- /accent 3 -->

    {if $page.field_accent4}
    <div class="service">
      <div class="icon-wrapper fadeInUp wow">
        <div class="icon-box"> 
          <div class="accent-img" style="background-image:url({$page.field_accent4})"></div>
        </div>
      </div>
      <div class="title fadeInUp wow" data-wow-delay="0.1s">{$page.field_accent4text}</div>
    </div>
    {/if}<!-- /accent 4 -->                        

  </div>
</div>
<!-- /row (Blocks-акценты) -->
{/if}

{if strip_tags($page.field_typeAccent) == 'Three columns'} 
<article id="col_3" class="row">

  <div class="col-sm-4">
    {$page.field_accent1text}
  </div>

  <div class="col-sm-5">
    {$page.field_accent2text}
  </div>
  <div class="col-sm-3">
    {$page.field_accent3text}
  </div>

</article>
<!-- /row (Blocks-акценты) -->
{/if}

{if strip_tags($page.field_typeAccent) == 'OFF'}
{else:}

{if $page.field_link}<!-- Button «Подробнее» (10) -->
<a href="{$page.field_link}" class="btn btn-primary{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay=".75s" style="visibility: visible; animation-delay: 0.75s; animation-name:{if strip_tags($page.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($page.field_animation)}{/if}"{/if}>{strip_tags($page.field_btname)}</a>
{/if} 
<!-- /Button «Подробнее» -->{/if}


{if strip_tags($page.field_widget) == 'Non' or strip_tags($page.field_widget) == 'Feedback'}
{else:}<!-- Виджет --> 
<div id="widget" class="row{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay=".55s"{/if}>
  {if strip_tags($page.field_widget) == 'Actions'}
  {widget('sale')} 
  {/if} 
  {if strip_tags($page.field_widget) == 'Comments'}
  {widget('comments')} 
  {/if} 
  {if strip_tags($page.field_widget) == 'Price'}
  {widget('komplex')} 
  {/if}
  {if strip_tags($page.field_widget) == 'Columns'}
  {widget('lenta-two-col')} 
  {/if}
  {if strip_tags($page.field_widget) == 'Ecwid'}
  {include_tpl('store')} 
  {/if}
  {if strip_tags($page.field_widget) == 'Specification'}
  {widget('lenta-for-col')} 
  {/if}
  {if strip_tags($page.field_widget) == 'Articles'}
  {widget('articles')}
  {/if}
</div>
<!-- /row (виджет) -->{/if}
</div> <!-- /container -->{/if}
{if strip_tags($page.field_widget) == 'Video carousel'}
  {widget('video-carousel')} 
{/if} 
 {if strip_tags($page.field_widget) == 'Feedback'}
  <!-- contact_form.tpl -->
  {include_tpl('contact_form')}
  {/if}
{if strip_tags($page.field_typeAccent) == 'Blocks'} <!-- Акцент: Blocks -->
<article id="accent-block">

  <div class="col-sm-6 accent-block" style="background-color:{$page.field_bgcolor}">
    <div class="accent-block-img" data-background="{$page.field_accent1}?v=1.0.0"></div>
    <div class="col-sm-12 accent-block-text">{$page.field_accent1text}</div>
  </div>

  <div class="col-sm-6 accent-block" style="background-color:{$page.field_bgcolor}">
    <div class="accent-block-img" data-background="{$page.field_accent2}?v=1.0.0"></div>
    <div class="col-sm-12 accent-block-text">{$page.field_accent2text}</div>
  </div>   
  <div class="clearing"></div>
</article>
<!-- /Акцент: Blocks -->{/if}



{if $page.field_albumID}<!--Вставка альбома галереи на странице -->
{if strip_tags($page.field_gallery) == 'Photo grid'}
<ul class="portfolio-list four-column list-unstyled popup-gallery">
  <li class="grid-sizer"></li>
  {$img = $CI->load->module('gallery')->gallery_m->get_album_images($page.field_albumID, NULL, NULL, current_language())}
  {$count=0}
  {foreach $img as $image}
  <li class="portfolio-item branding work-ajax-link{if $count > 4} hide6{/if}{if $count > 2} hide3{/if}">
    <a class="{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.1s"{/if} href="{media_url('uploads/gallery')}/{$image.album_id}/{$image.file_name}{$image.file_ext}" data-title="{$image.description}" rel="group"> <img src="{media_url('uploads/gallery')}/{$image.album_id}/_thumbs/{$image.file_name}{$image.file_ext}?v=1.0.0" alt="{$image.description}" width="400" height="320">
      <div class="info-container">
        <div class="title">{$image.title}</div>
        <div class="category">{strip_tags($image.description)}</div>
      </div> 
    </a>
  </li><!-- .portfolio-item -->
  {$count++}
  {if $count==64}{break}{/if}
  {/foreach} 
</ul>
{/if}<!--/Photo grid -->

{if strip_tags($page.field_gallery) == 'Logos 3' or strip_tags($page.field_gallery) == 'Logos 3 (white)'}
<div id="clients" class="{if strip_tags($page.field_gallery) == 'Logos 3 (white)'}inverted{/if}{if strip_tags($page.field_animation) == 'OFF'}{else:}{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if} wow{/if}"{if strip_tags($page.field_animation) == 'OFF'}{else:} data-wow-delay="0.75s" style="visibility: visible; animation-delay: 0.75s; animation-name:{if strip_tags($page.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if}"{/if} {if $page.field_bgcolor}data-overlay-color="{if $page.field_bgcolor}{strip_tags($page.field_bgcolor)}{else:}#000{/if}"{/if}>
  <div class="container">
    <div class="row">
      <div class="col-sm-12 mb60">
        <div class="owl-carousel default-carousel no-dots client-carousel">
          {$img = $CI->load->module('gallery')->gallery_m->get_album_images($page.field_albumID, NULL, NULL, current_language())}
          {$count=0}
          {foreach $img as $image}
          <a class="carousel-item" data-merge="2"><img src="{site_url('uploads/gallery')}/{$image.album_id}/{$image.file_name}{$image.file_ext}" alt=""> </a>
          {$count++}
          {/foreach}
        </div>
      </div>
    </div>
  </div>
</div>
{/if}<!--/Logos 3 -->
<!--/вставка альбома -->{/if}


{if strip_tags($page.field_typeAccent) == 'Statistics'}<!-- Акцент: Инфографика цифр -->
<div id="block-stat" class="pos-relative">
  <div class="container">

    <div class="row">

      <div class="col-xs-6 col-sm-3">
        <div class="couner-item" data-counter-animation="{$page.field_accent1number}">
        <div class="count-info">
            <div class="count"></div>{if $page.field_accent1plus}<div class="count-plus fadeIn wow" data-wow-delay="0.9s">{$page.field_accent1plus}</div>{/if}
            <div class="title">{$page.field_accent1text}</div>
          </div>
        </div>
      </div>

      <div class="col-xs-6 col-sm-3">
        <div class="couner-item" data-counter-animation="{$page.field_accent2number}">
          <div class="count-info">
            <div class="count"></div>{if $page.field_accent2plus}<div class="count-plus fadeIn wow" data-wow-delay="1.2s">{$page.field_accent2plus}</div>{/if}
            <div class="title">{$page.field_accent2text}</div>
          </div>
        </div>
      </div>

      <div class="col-xs-6 col-sm-3">
        <div class="couner-item" data-counter-animation="{$page.field_accent3number}">
          <div class="count-info">
            <div class="count"></div>{if $page.field_accent3plus}<div class="count-plus fadeIn wow" data-wow-delay="1.4s">{$page.field_accent3plus}</div>{/if}
            <div class="title">{$page.field_accent3text}</div>
          </div>
        </div>
      </div>

      <div class="col-xs-6 col-sm-3">
        <div class="couner-item" data-counter-animation="{$page.field_accent4number}">
          <div class="count-info">
            <div class="count"></div>{if $page.field_accent4plus}<div class="count-plus fadeIn wow" data-wow-delay="1.7s">{$page.field_accent4plus}</div>{/if}
            <div class="title">{$page.field_accent4text}</div>
          </div>
        </div>
      </div>
    </div>
                                
                                
                              </div>
                              <!-- .page-section -->
                            </div>
                            <!-- /Акценты: Statistics -->{/if}    

                          <!-- /block... --></div> 
                          
                          {if $page.field_fullimg}<!-- Фото на всю ширину -->
                          <div class="fullimg{if strip_tags($page.field_bgfixed) == 'ON'} fixed{/if}{if strip_tags($page.field_cover) == 'Fill'} cover{/if}{if strip_tags($page.field_cover) == 'Fit'} contain{/if}{if strip_tags($page.field_cover) == 'Original'} origin{/if}{if strip_tags($page.field_botspace) == 'ON'} b100{/if} {strip_tags($page.field_hight2)}" style="background-image:url({$page.field_fullimg});"></div>
                          <!-- /Фото на всю ширину -->{/if}
                          
                          {if $page.field_gps}<!-- Map на всю ширину -->
                          <div class="embed-container map maps"> 
                           <!--Подключение карты Яндекс 2.1-->
                           <script src="http://api-maps.yandex.ru/2.1/?lang={strip_tags($page.field_maplang)}" type="text/javascript">
                            {literal}

                            var myMap,
                            myPlacemark;
                            var init =  function(){
                              if(typeof  YMaps != "undefined" ){
                                myMap = new YMaps.Map("y-maps", {
                                  center: [{/literal}{$page.field_gps}{literal}],
                                  zoom: 16,
                                  controls: [
                                  'zoomControl',
                                  'fullscreenControl',
                                  'typeSelector',
                                  'rulerControl',
                                  'trafficControl'
                                  ]
                                });
                                // Если картинка загружена, то:
                                {/literal}{if $page.field_point}{literal}
                                myPlacemark = new YMaps.Placemark(myMap.getCenter(), {
                                  hintContent: '{/literal}{$page.field_hint}{literal}',
                                  balloonContent: '{/literal}{$page.field_pointdesc}{literal}'
                                }, {

                                  iconLayout: 'default#image',
                                  iconImageHref: '{/literal}{$page.field_point}{literal}',
                                  iconImageSize: [45, 45],
                                  iconImageOffset: [-30, -30]
                                });
            // Если Pictures OFF, то подгружается Default метка
            {/literal}{else:}{literal}
            myPlacemark = new YMaps.Placemark([{/literal}{$page.field_gps}{literal}], {
              hintContent: '{/literal}{$page.field_hint}{literal}',
              balloonContent: '{/literal}{$page.field_pointdesc}{literal}'
            });
            {/literal}{/if}{literal}
            myMap.geoObjects.add(myPlacemark);
          }
        };
        $(document).ready(function() {
          if(typeof YMaps != "undefined"){
            console.log(typeof  YMaps);
            YMaps.ready(init);
          }
        });
      </script>
      {/literal}
      <div id="y-maps"></div>
    </div>
    <!-- //map -->
    {literal} 
    <script>
  // Disable scroll zooming and bind back the click event
  var onMapMouseleaveHandler = function (event) {
    var that = $(this);

    that.on('click', onMapClickHandler);
    that.off('mouseleave', onMapMouseleaveHandler);
    that.find('ymaps').css("pointer-events", "none");
  }

  var onMapClickHandler = function (event) {
    var that = $(this);

    // Disable the click handler until the user leaves the map area
    that.off('click', onMapClickHandler);

    // Enable scrolling zoom
    that.find('ymaps').css("pointer-events", "auto");

    // Handle the mouse leave event
    that.on('mouseleave', onMapMouseleaveHandler);
  }

  // Enable map zooming with mouse scroll when the user clicks the map
  $('.maps.embed-container').on('click', onMapClickHandler);
</script> 
{/literal}
<!--/field_gps-->{/if}
<!-- /if field_video -->{/if}
{/foreach}