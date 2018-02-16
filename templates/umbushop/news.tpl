<!-- Шаблон news.tpl -->

<!-- header.tpl -->
{include_tpl('header')}

{if count($pages) < 4} 
  <div class="page-section" data-background-color="#f8f8f8">
	<div class="container">
		<div class="row">
			{foreach $pages as $page}
			{$page = $CI->load->module('cfcm')->connect_fields($page, 'page')}

			<div class="col-sm-4 latest-post">
				<div class="post-img"> 
					<div class="img-news" style="background-image:url({$page.field_pagephoto})">
					</div>
				</div>
				<h3 class="text-uppercase mb5">{$page.title}</h3>
				<div class="post-meta mb17">{date('Y', $page.publish_date)} |
{date('d.m', $page.publish_date)}</div>
				<p class="excerpt">{strip_tags($page.prev_text)}</p> 
				<a href="{site_url($page.full_url)}" class="btn btn-primary btn-xs">{echo siteinfo('siteinfo_transl-readmore')} <i class="fa fa-angle-right"></i></a>
			</div>
			
			{/foreach}   
			<div class="col-sm-12">{$pagination}</div>
		</div>
	</div>
</div> 
{else:}
<div class="page-section" data-background-color="#f8f8f8">
	<div class="container">
		<div class="row">
			<div id="columns" data-columns>
			{foreach $pages as $page}
			{$page = $CI->load->module('cfcm')->connect_fields($page, 'page')}

			<div class="lenta-col latest-post">
				<div class="post-img"> 
					<div class="img-news" style="background-image:url({$page.field_pagephoto})">
					</div>
				</div>
				<h3 class="text-uppercase mb5">{$page.title}</h3>
				<div class="post-meta mb17">{date('Y', $page.publish_date)} |
{date('d.m', $page.publish_date)}</div>
				<p class="excerpt">{strip_tags($page.prev_text)}</p> 
				<a href="{site_url($page.full_url)}" class="btn btn-primary btn-xs">{echo siteinfo('siteinfo_transl-readmore')} <i class="fa fa-angle-right"></i></a>
			</div>
			<!-- .latest-post -->
			{/foreach}   
			<div class="col-sm-12">{$pagination}</div>
		</div>
	</div>
</div>
</div>

<script src="{$THEME}js/salvattore.js"></script>
{literal}
<script>
	function append(title, content){
		var grid = document.querySelector('#columns');
		var item = document.createElement('div');
		var h = '<div class="panel panel-primary">';
		h += '<div class="panel-heading">';
		h += title;
		h += '</div>';
		h += '<div class="panel-body">';
		h += content;
		h += '</div>';
		h += '</div>';
		salvattore['append_elements'](grid, [item])
		item.outerHTML = h;
	}
</script>
{/literal}
{/if}