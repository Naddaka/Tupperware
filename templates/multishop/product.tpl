<!-- Шаблон category.tpl -->

 			<!-- header.tpl -->
            {include_tpl('header')}
{foreach $pages as $page}
{$page = $CI->load->module('cfcm')->connect_fields($page, 'page')}
<div id="product" class="page-section">
        <div class="container">
            
            <div class="row">
                <div class="col-sm-12">
                    <h4 class="text-uppercase">{$page.title}</h4>
                </div>
                <div class="col-sm-4">
                  <div class="prod-prev">{$page.prev_text}</div>
                </div>
                <div class="col-sm-2 col-sm-offset-1">
                    <div class="icon-wrapper fadeInUp wow service">
          <div class="icon-box"> 
              <div class="accent-img" style="background-image:url({$page.field_pagephoto})"></div>
          </div>
       </div>
                </div>
                <div class="col-sm-4 col-sm-offset-1">
                    <div class="prod-fulltext">{$page.full_text}</div>
                </div>
            </div>
            
        </div>
    </div><!-- .page-section -->
    <!--Вставка альбома галереи на странице -->
   {if $page.field_albumID}
    	<ul class="portfolio-list four-column list-unstyled popup-gallery">
     	  <li class="grid-sizer"></li>
    {$img = $CI->load->module('gallery')->gallery_m->get_album_images($page.field_albumID, NULL, NULL, current_language())}
      {$count=0}
      {foreach $img as $image}
  
      <li class="portfolio-item branding work-ajax-link">
                            <a href="{media_url('uploads/gallery')}/{$image.album_id}/{$image.file_name}{$image.file_ext}" data-title="{$image.description}" rel="group"> <img src="{media_url('uploads/gallery')}/{$image.album_id}/{$image.file_name}{$image.file_ext}?v=1.0.0" alt="{$image.description}" width="400" height="320">
                                <!-- Доработать вывод описания
                                <div class="info-container">
                                    <div class="title">{$image.title}</div>
                                    <div class="category">Branding</div>
                                </div> -->
                            </a>
                        </li><!-- .portfolio-item -->
      {$count++}
      {if $count==4}{break}{/if}
      {/foreach} 
      </ul>
  {/if}<!--/вставка альбома -->
            
 {/foreach}      
 <!--Вывод страниц сторонней категории -->
 
    {include_tpl('landing_cat')}   
                           
            <!-- contact_form.tpl -->
            {include_tpl('contact_form')}