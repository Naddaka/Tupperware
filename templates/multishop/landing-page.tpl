<!-- landing-page.tpl -->
{if $page.field_video}
<div class="video{if strip_tags($page.field_botspace) == 'ON'} b100{/if}" style="background-color:{$page.field_bgcolor}">
  <div class="container">
    <section class="row">
      <article class="col-sm-12">
        {echo $page.field_video}
      </article>
    </section>
  </div>
</div>
<!-- //video --> 
  {else:}
  <!-- Главный контейнер (стили блоков / настройки фона, цвета текста и другие) -->
<div id="{if strip_tags($page.field_lanpage) == 'Default'}page-standart{/if}{if strip_tags($page.field_lanpage) == 'Воздушный'}block-light{/if}{if strip_tags($page.field_lanpage) == 'Centered'}block-center{/if}{if strip_tags($page.field_lanpage) == 'Centered с фоном'}block-bg-center{/if}{if strip_tags($page.field_lanpage) == 'Текст влево'}block-bg-left{/if}{if strip_tags($page.field_lanpage) == 'Picture alignment to bottom'}block-img-right-bottom{/if}{if strip_tags($page.field_lanpage) == 'Only the photo as a background'}only-img-bg{/if}{if strip_tags($page.field_lanpage) == 'Two columns'}two-collum{/if}" class="page-section bg-section {if strip_tags($page.field_bgfixed) == 'ON'}fixed{/if}{if strip_tags($page.field_cover) == 'Fill'} cover{/if}{if strip_tags($page.field_cover) == 'Fit'} contain{/if}{if strip_tags($page.field_cover) == 'Original'} origin{/if}{if strip_tags($page.field_botspace) == 'ON'} b100{/if}{if strip_tags($page.field_textcolor) == 'Black'} text-black{/if}{if strip_tags($page.field_textcolor) == 'White'} text-white{/if}{if strip_tags($page.field_textcolor) == 'Gray'} text-gray{/if}" data-background="{$page.field_bgimage}?v=1.0.0" style="background-color:{$page.field_bgcolor}" {if strip_tags($page.field_overlay) == 'OFF'}{else:}data-overlay-color="{if $page.field_bgcolor}{strip_tags($page.field_bgcolor)}{else:}#000{/if}" data-overlay-opacity="{strip_tags($page.field_overlay)}"{/if}>
  <div class="container" style="{if $page.field_martopbot}padding: {$page.field_martopbot}px 15px;{/if}">
  <div class="row">
  
   {if strip_tags($page.field_lanpage) == 'Two columns'}      
          <div class="col-sm-6">
              {$page.prev_text}
          </div>
          
    <div class="col-sm-6">
             {$page.full_text}
          </div>   
    <div class="clearing"></div>
    
   {else:}
   {if strip_tags($page.field_lanpage) == 'World'}
   <div id="worldless" class="col-sm-12">
                                <h2 class="text-center mb-xs20 mb50">{$page.title}</h2> </div>
   <div class="col-sm-12 col-md-6 text-center">
                                <div id="WorldMap">
                                    <div class="plane"></div>
                                </div>
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
   {else:}
    <div class="{if strip_tags($page.field_colwidth) == 'Wide'}col-sm-12{/if}{if strip_tags($page.field_colwidth) == 'СтанONртная'}col-sm-offset-1 col-sm-10{/if}{if strip_tags($page.field_colwidth) == 'Middle'}col-sm-offset-2 col-sm-8{/if}{if strip_tags($page.field_colwidth) == 'Tight'}col-sm-offset-4 col-sm-4{/if}">
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
    {if strip_tags($page.field_titleoff) == ''}<div class="{if strip_tags($page.field_bigh) == 'Uppercase'}all-caps{else:}h2 {if strip_tags($page.field_bigh) == 'Monster'}giant{/if}{if strip_tags($page.field_bigh) == 'Big'}bigh{/if}{if strip_tags($page.field_bigh) == 'Middle'}middle{/if}{/if}">{$page.title}</div>
    {else:}<!--<div class="margin"></div> -->
    {/if}
      
        <div class="table-wrapper">
        <div class="prev {strip_tags($page.field_hight)}">{$page.prev_text}</div>
      </div>
      
      <div class="full">{$page.full_text}</div>
        
    </div> <!-- /col-sm-... -->
    {/if}{/if}
  </div><!-- /row -->
  
  <!-- Blocks-акценты -->
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
  {/if}
  <!-- /row (Blocks-акценты) -->
  <!-- Акценты: Blocks -->
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
  {/if}<!-- /Акценты: Blocks -->
    
    <div class="row">
      <!-- Виджет --> 
  <div class="col-sm-12">
{if strip_tags($page.field_widget) == 'Отзывы'}
{widget('reviews')} 
{/if}
      {if $page.field_link}<a class="more" href="{$page.field_link}">{strip_tags($page.field_btname)}</a>{/if}
    
    </div>
 	</div><!-- /row (виджет) -->
</div> <!-- /container -->
 <!--Вставка альбома галереи на странице -->
 <!-- Акценты: Blocks -->
 {if strip_tags($page.field_typeAccent) == 'Blocks'} 
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
  {/if}<!-- /Акценты: Blocks -->
  
   <!--Инфографика цифр -->
   {if strip_tags($page.field_typeAccent) == 'Statistics'}
            <div id="block-stat" class="pos-relative">
                    <div class="container">
                        <div class="row">
                        
                            <div class="col-xs-6 col-sm-3">
                                <div class="couner-item" data-counter-animation="{$page.field_accent1number}">
                                    <div class="display-tc">
                                        <div class="icon-box"> <i class="fa fa-suitcase"></i> </div>
                                    </div>
                                    <div class="display-tc count-info">
                                        <div class="count"></div>
                                        <div class="title">{$page.field_accent1text}</div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-6 col-sm-3">
                                <div class="couner-item" data-counter-animation="{$page.field_accent2number}">
                                    <div class="display-tc">
                                        <div class="icon-box"> <i class="fa fa-heart"></i> </div>
                                    </div>
                                    <div class="display-tc count-info">
                                        <div class="count"></div>
                                        <div class="title">{$page.field_accent2text}</div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-6 col-sm-3">
                                <div class="couner-item" data-counter-animation="{$page.field_accent3number}">
                                    <div class="display-tc">
                                        <div class="icon-box"> <i class="fa fa-send"></i> </div>
                                    </div>
                                    <div class="display-tc count-info">
                                        <div class="count"></div>
                                        <div class="title">{$page.field_accent3text}</div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-6 col-sm-3">
                                <div class="couner-item" data-counter-animation="{$page.field_accent4number}">
                                    <div class="display-tc">
                                        <div class="icon-box"> <i class="fa fa-coffee"></i> </div>
                                    </div>
                                    <div class="display-tc count-info">
                                        <div class="count"></div>
                                        <div class="title">{$page.field_accent4text}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- .page-section -->
            </div>
   {/if}  <!-- /Акценты: Statistics -->  
   
 <!--Вставка альбома галереи на странице -->
   {if $page.field_albumID}
    	<ul class="portfolio-list four-column list-unstyled popup-gallery">
     	  <li class="grid-sizer"></li>
    {$img = $CI->load->module('gallery')->gallery_m->get_album_images($page.field_albumID, NULL, NULL, current_language())}
      {$count=0}
      {foreach $img as $image}
  
      <li class="portfolio-item branding work-ajax-link">
                            <a href="{media_url('uploads/gallery')}/{$image.album_id}/{$image.file_name}{$image.file_ext}" data-title="{$image.description}" rel="group"> <img src="{media_url('uploads/gallery')}/{$image.album_id}/{$image.file_name}{$image.file_ext}?v=1.0.0" alt="{$image.description}" width="400" height="320">
                                
                                <div class="info-container">
                                    <div class="title">{$image.title}</div>
                                    <div class="category">{strip_tags($image.description)}</div>
                                </div> 
                            </a>
                        </li><!-- .portfolio-item -->
      {$count++}
      {if $count==24}{break}{/if}
      {/foreach} 
      </ul>
  {/if}<!--/вставка альбома -->
  
</div> <!-- /block... -->

<!-- Фото на всю ширину -->
 {if $page.field_fullimg}
<div class="fullimg{if strip_tags($page.field_bgfixed) == 'ON'} fixed{/if}{if strip_tags($page.field_cover) == 'Fill'} cover{/if}{if strip_tags($page.field_cover) == 'Fit'} contain{/if}{if strip_tags($page.field_cover) == 'Original'} origin{/if}{if strip_tags($page.field_botspace) == 'ON'} b100{/if} {strip_tags($page.field_hight2)}" style="background-image:url({$page.field_fullimg});"></div>
{/if}<!-- /Фото на всю ширину -->

<!-- Map на всю ширину -->
   {if $page.field_gps}
   <div class="embed-container map maps"> 
        <!--Подключение карты Яндекс 2.1-->
       <script src="{$THEME}js/jquery.min.js?v=1.11.2"></script>
        <script src="http://api-maps.yandex.ru/2.1/?lang={strip_tags($page.field_maplang)}" type="text/javascript"></script>
    {literal}
<script type="text/javascript">

    var myMap,
            myPlacemark;
    var init =  function(){
        if(typeof  ymaps != "undefined" ){
            myMap = new ymaps.Map("y-maps", {
                center: [{/literal}{$item.field_gps}{literal}],
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
            {/literal}{if $item.field_point}{literal}
            myPlacemark = new ymaps.Placemark(myMap.getCenter(), {
                hintContent: '{/literal}{$item.field_hint}{literal}',
                balloonContent: '{/literal}{$item.field_pointdesc}{literal}'
            }, {

                iconLayout: 'default#image',
                iconImageHref: '{/literal}{$item.field_point}{literal}',
                iconImageSize: [45, 45],
                iconImageOffset: [-30, -30]
            });
            // Если Pictures OFF, то подгружается станONртная метка
            {/literal}{else:}{literal}
            myPlacemark = new ymaps.Placemark([{/literal}{$item.field_gps}{literal}], {
                hintContent: '{/literal}{$item.field_hint}{literal}',
                balloonContent: '{/literal}{$item.field_pointdesc}{literal}'
            });
            {/literal}{/if}{literal}
            myMap.geoObjects.add(myPlacemark);
        }
    };
    $(document).ready(function() {
        if(typeof ymaps != "undefined"){
            console.log(typeof  ymaps);
            ymaps.ready(init);
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
   {/if}<!--field_gps-->
     
{/if}<!-- if field_video -->