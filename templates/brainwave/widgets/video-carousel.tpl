<!-- widget/video-carousel.tpl -->
<div class="owl-carousel default-carousel">
	{foreach $recent_news as $item}
	{$item = $CI->load->module('cfcm')->connect_fields($item, 'page')}
	<div class="carousel-item">
		<div class="page-section bg-section {strip_tags($item.field_hight)} {strip_tags($item.field_bgposition)}{if strip_tags($item.field_textcolor) == 'Black'} text-black{/if}{if strip_tags($item.field_textcolor) == 'White'} text-white{/if}{if strip_tags($item.field_textcolor) == 'Gray'} text-gray{/if}" data-background="{$item.field_bgimage}?v=1.0.0" data-overlay-color="#191919" data-overlay-opacity="0.5">
			<div class="text-center">
				<a href="{$item.field_video}" class="popup-youtube big-icon white">
					<div class="circle pulse"></div><i class="fa fa-play"></i></a>
					<div>
						<h2 class="text-uppercase title-3 white mt29">{$item.title}</h2> </div> <span class="sub-header white opacity-50 text-uppercase ls-02">{$item.prev_text}</span> </div>
					</div>
				</div>
				<!-- .carousel-item -->
				{/foreach}
			</div>