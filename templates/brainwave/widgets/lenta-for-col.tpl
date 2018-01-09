<div id="columns" data-columns>
	{foreach $recent_news as $item}
	{$item = $CI->load->module('cfcm')->connect_fields($item, 'page')}
	<div class="lenta-col">
		{if strip_tags($item.field_titleoff) == ''}<div class="{if strip_tags($item.field_bigh) == 'Uppercase'}all-caps{/if}{if strip_tags($item.field_bigh) == 'Normal'}h3{/if}{if strip_tags($item.field_bigh) == 'Monster'}giant{/if}{if strip_tags($item.field_bigh) == 'Big'}bigh{/if}{if strip_tags($item.field_bigh) == 'Middle'}middle{/if}" style="{if strip_tags($item.field_textcolor) == 'Color 1'}color:{echo siteinfo('siteinfo_color')}{/if}{if strip_tags($item.field_textcolor) == 'Color 2'}color:{echo siteinfo('siteinfo_color2')}{/if}">{$item.title}</div>
		{/if}
		{$item.prev_text}
		<!-- Button «Подробнее» -->
{if $item.field_btname}
<a href="{if $item.field_link}{$item.field_link}{else:}{site_url($item.full_url)}{/if}" class="btn btn-default{if strip_tags($item.field_animation) == 'OFF'}{else:}{if strip_tags($item.field_animation) == 'По-умолчанию'} fadeInUp{else:} {strip_tags($item.field_animation)}{/if} wow{/if}"{if strip_tags($item.field_animation) == 'OFF'}{else:} data-wow-delay=".75s"{/if} style="color:{echo siteinfo('siteinfo_color')};border-color:{echo siteinfo('siteinfo_color')}">{strip_tags($item.field_btname)}</a>
{/if} <!-- /Button «Подробнее» -->
		{if $item.field_pagephoto}
		<div class="lenta-img{if strip_tags($item.field_cover) == 'Fill'} cover{/if}{if strip_tags($item.field_cover) == 'Fit'} contain{/if}{if strip_tags($item.field_cover) == 'Original'} origin{/if}" style="background-image:url({$item.field_pagephoto})"></div>
		{/if}
	</div>
	{/foreach}
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