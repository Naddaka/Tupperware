<!-- widget/blog-last.tpl -->
<section class="widget widget_recent_entries">
<h3>Recent Posts</h3>
	<ul>
		{foreach $recent_news as $item}
		{$item = $CI->load->module('cfcm')->connect_fields($item, 'page')}
		<li class="clearfix">
			<a href="{site_url($item.full_url)}" class="pull-left">
				<img src="{$item.field_pagephoto}" alt="{$item.title}" width="70" height="70">
			</a>
			<div class="widget-posts-descr"> <a href="#" title="">{$item.title}</a> {date('d-m-Y',$item.publish_date)}</div>
		</li>
		{/foreach}
	</ul>
</section>