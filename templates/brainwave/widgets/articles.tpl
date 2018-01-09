<div id="wid-articles">
	{foreach $recent_news as $item}
	{$item = $CI->load->module('cfcm')->connect_fields($item, 'page')}
	<div class="col-sm-4 latest-post">
		<div class="post-img"> 
			<div class="img-news" style="background-image:url({$item.field_pagephoto})">
			</div>
		</div>
		<h3 class="text-uppercase mb5">{$item.title}</h3>
		<div class="post-meta mb17">{date('Y', $item.publish_date)} |
			{date('d.m', $item.publish_date)}
		</div>
		<p class="excerpt">{strip_tags($item.prev_text)}</p> 
		<a href="{site_url($item.full_url)}" class="btn btn-primary btn-xs">{echo siteinfo('siteinfo_transl-readmore')} <i class="fa fa-angle-right"></i></a>
	</div>
	<!-- .latest-post -->
	{/foreach}  
</div>