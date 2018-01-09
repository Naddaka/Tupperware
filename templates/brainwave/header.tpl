<!-- header.tpl -->

<div class="{if strip_tags($category.field_head_h) == 'Giant'}page-header-giant{else:}{if strip_tags($category.field_head_h) == 'Large'}page-header-large{else:}{if strip_tags($category.field_head_h) == 'Largest'}page-header-largest{else:}{if strip_tags($category.field_head_h) == 'Small'}page-header-small{else:}page-header{/if}{/if}{/if}{/if}{if strip_tags($category.field_bgfixed) == 'ON'} background-fixed{/if}{if strip_tags($category.field_cover) == 'Fill'} cover{/if}{if strip_tags($category.field_cover) == 'Fit'} contain{/if}{if strip_tags($category.field_cover) == 'Original'} origin{/if} {strip_tags($category.field_bgposition)}" data-background="{$category.image}" data-overlay-color="{if $category.field_bgcolor}{strip_tags($category.field_bgcolor)}{else:}#000{/if}" data-overlay-opacity="{if strip_tags($category.field_overlay) == 'OFF'}0{else:}{strip_tags($category.field_overlay)}{/if}">
	<div class="container">
		<div class="col-sm-offset-1 col-sm-10">
		  	{if strip_tags($category.field_titleoff) == ''}<h1 class="text-center mb30{if strip_tags($category.field_bigh) == 'Monster'} giant{/if}{if strip_tags($category.field_bigh) == 'Big'} bigh{/if}{if strip_tags($category.field_bigh) == 'Middle'} middle{/if}{if strip_tags($category.field_uppercase) == ''}{else:} uppercase{/if}{if strip_tags($category.field_animation) == 'OFF'}{else:}{if strip_tags($category.field_animation) == 'Default'} fadeIn{else:}{strip_tags($category.field_animation)}{/if} wow{/if}"{if strip_tags($category.field_animation) == 'OFF'}{else:} data-wow-delay="1.00s" style="visibility: visible; animation-delay: 1.00s; animation-name:{if strip_tags($category.field_animation) == 'Default'} fadeIn{else:} {strip_tags($page.field_animation)}{/if}"{/if} data-color="{if strip_tags($category.field_textcolor) == 'Black'}#000{/if}{if strip_tags($category.field_textcolor) == 'White'}#fff{/if}{if strip_tags($category.field_textcolor) == 'Gray'}#555{/if}{if strip_tags($category.field_textcolor) == 'Color 1'}color:{echo siteinfo('siteinfo_color')}{/if}{if strip_tags($category.field_textcolor) == 'Color 2'}color:{echo siteinfo('siteinfo_color2')}{/if}">{$category.name}</h1>{/if}
		  	<p class="text-center ls-010 mb0" data-color="{if strip_tags($category.field_textcolor) == 'Black'}#000{/if}{if strip_tags($category.field_textcolor) == 'White'}#fff{/if}{if strip_tags($category.field_textcolor) == 'Gray'}#555{/if}{if strip_tags($category.field_textcolor) == 'Color 1'}color:{echo siteinfo('siteinfo_color')}{/if}{if strip_tags($category.field_textcolor) == 'Color 2'}color:{echo siteinfo('siteinfo_color2')}{/if}">{$category.short_desc}</p>
		  	<div class="text-center"> 
    	  	    {if $category.field_link}
    	  	        <a href="{$category.field_link}" class="btn btn-primary btn-inverted scrollTo{if strip_tags($category.field_animation) == 'OFF'}{else:}{if strip_tags($category.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($category.field_animation)}{/if} wow{/if}"{if strip_tags($category.field_animation) == 'OFF'}{else:} data-wow-delay="0.65s"{/if}>{strip_tags($category.field_btname)}</a>
    	  	    {/if} 
    	  	    {if $category.field_getlink}
    	  	        <a href="{$category.field_getlink}" class="btn btn-default btn-inverted{if strip_tags($category.field_animation) == 'OFF'}{else:}{if strip_tags($category.field_animation) == 'Default'} fadeInUp{else:} {strip_tags($category.field_animation)}{/if} wow{/if}"{if strip_tags($category.field_animation) == 'OFF'}{else:} data-wow-delay="0.75s"{/if}>{strip_tags($category.field_gettext)}</a>
    	  	    {/if} 
    	  	</div>
		</div>
	</div>
</div>

{if $page}{if strip_tags($category.field_linker) == ''}{else:}<!-- Модуль Linker для вывода ссылок на следующую и предыдущую страницы -->
{echo $CI->load->module('linker')->get_links($page.id)}
{/if}{/if}
{if strip_tags($category.field_breadcrumb) == ''}{else:}<!-- Подключение хлебных крошек -->
{widget('path')}
{/if}
<!-- /header.tpl -->