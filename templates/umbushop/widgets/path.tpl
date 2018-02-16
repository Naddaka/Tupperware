<!-- widget/path.tpl -->
{$i=0}
<div class="container">
	<div class="row"> 
		<ol class="breadcrumb mt30 no-bg mb0">
			<li><a rel="v:url" property="v:title" href="{site_url()}">{echo siteinfo('siteinfo_transl-main')}</a></li>
			{foreach $navi_cats as $item}         
			{$i++}
			{if $i < count($navi_cats)}
			<li><a href="{site_url($item.path_url)}">{$item.name}</a></li>
			{else: // Make last element as plain text}
			<li class="active">{$item.name}</li>
			{/if}
			{/foreach}
		</ol>
	</div>
</div>