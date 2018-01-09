<!-- Шаблон category.tpl -->

<!-- header.tpl -->
{include_tpl('header')}

<div class="page-section" data-background-color="#fff">
	<div class="container page-section">
		<div class="post-list col-sm-9">
		{foreach $pages as $page}
			{$page = $CI->load->module('cfcm')->connect_fields($page, 'page')}
			<article class="post">
				<header>
					<h2 class="entry-title"><a href="{site_url($page.full_url)}" class="page-load" data-title="{$page.title}" title="{$page.title}">{$page.title}</a></h2>
					<div class="meta-data">
						<time class="b-blog-w__date" datetime="{date('Y-m-d', $item.publish_date)}">{locale_date('d F Y', $item.publish_date)}</time> – <i class="b-addinfo__item-icon fa fa-eye" title="{tlang('Number of views')}"></i>
			<span class="b-addinfo__item-text">{$page.showed}</span></div>
					</header>
					 <div class="thumbnail"> <img src="{$page.field_pagephoto}" alt="{$page.title}" width="1200" height="600"> </div>
					<div class="entry-summary">
						{$page.prev_text}
						 <a href="{site_url($page.full_url)}" class="btn btn-default btn-sm page-load" data-title="{$page.title}">{echo siteinfo('siteinfo_transl-readmore')} <i class="fa fa-angle-right"></i></a> </div>
</article>
		{/foreach}
		{$pagination}
		</div>
		<!-- .post-list -->
		<aside class="sidebar col-sm-3">

                    <div class="widget widget_search">
                        <form action="{site_url('search')}" method="post" class="search-form form-inline">
                            <div class="input-group">
                                <input class="search-field form-control" type="search" name="text" value="{$search_title}" placeholder="{echo siteinfo('siteinfo_transl-search')}" required> <span class="input-group-btn">
                                <button class="search-submit btn btn-default"><span class="icon-magnifier"></span></button>
                                </span>
                            </div>
                                {form_csrf()}
                        </form>
                    </div>
                    <!-- .widget_search -->


			{widget('blog-last')}
			{widget('news')}
		</aside>
	</div>
</div>
 <!--  include follow_soc -->{include_tpl('follow_soc')}
{if strip_tags($category.field_contactform) == 'ON'}
 <!--  include contact_order -->{include_tpl('contact_order')}
{/if} 