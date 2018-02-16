<!-- Виджет Акции -->
<div class="col-sm-12 mb60 mt60">
  <div id="sale" class="owl-carousel default-carousel no-arrow client-carousel">
      {foreach $recent_news as $item}
      {$item = $CI->load->module('cfcm')->connect_fields($item, 'page')}
      <div class="carousel-item sale-item" data-merge="3"  style="background-color:{$item.field_bgcolor}">
      
      <div class="sale-img{if strip_tags($item.field_cover) == 'Fill'} cover{/if}{if strip_tags($item.field_cover) == 'Fit'} contain{/if}{if strip_tags($item.field_cover) == 'Original'} origin{/if}" style="background-image:url({$item.field_pagephoto})"></div>
      <div class="sale-text{if strip_tags($item.field_textcolor) == 'Black'} text-black{/if}{if strip_tags($item.field_textcolor) == 'White'} text-white{/if}{if strip_tags($item.field_textcolor) == 'Gray'} text-gray{/if}">{$item.prev_text}</div>
    </div><!-- .carousel-item -->
	  {/foreach}                        
    </div>
</div>
    
    <!-- Привязать вывод заголовка, если есть :
    <a href="">{$item.title}</a>
     -->
     