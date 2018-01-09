<!-- showroom1.tpl -->
<!-- header.tpl -->{include_tpl('header')}

<div id="showroom">
	<div class="container">
	<div class="row">
		<div class="col-sm-3">
			<div class="portfolio-filter">
				{$sub_cats = get_sub_categories($category.id)}
		        {foreach $sub_cats as $sub_cat}
		          <a class="btn btn-default btn-xs" href="{site_url($sub_cat.path_url)}">{$sub_cat.name}</a>
		        {/foreach}
			</div>
			</div>
			<div class="col-sm-9">
				<ul class="portfolio-list three-column list-unstyled">
					<li class="grid-sizer"></li>
					       {foreach $pages as $page}
        {$item = $CI->load->module('cfcm')->connect_fields($page, 'page')}
        {$c = explode("/", rtrim($page.cat_url, "/"))}

					<li class="portfolio-item">
						<a href="{site_url($page.full_url)}" class="page-load" data-title="{$page.title}"> 
						<img src="{$item.field_pagephoto}" alt="" width="400" height="320">
							<div class="info-container">
								<div class="title">{$page.title}</div>
								<div class="category">{$page.prev_text}</div>
							</div>
						</a>
					</li>
					<!-- .portfolio-item -->
		{/foreach}
				</ul>
			</div>
		</div>
		<!-- Пагинатор -->
		<div class="row mt100">
			<div class="col-sm-12 text-center">{$pagination}</div>
		</div>
	</div>
</div>

{if strip_tags($category.field_contactform) == 'ON'}
 <!--  include contact_order -->{include_tpl('contact_order')}
{/if} 