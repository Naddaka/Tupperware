<!-- main_menu/level_0/item_default.tpl -->
{$category = get_category(76)}
{$item = $CI->load->module('cfcm')->connect_fields($category, 'category')}
	<li><a href="{$link}" class="page-load" {$target} data-title="{$title}" data-color="{if strip_tags($item.field_menutextcolor) == 'Black'}#000{/if}{if strip_tags($item.field_menutextcolor) == 'White'}#fff{/if}{if strip_tags($item.field_menutextcolor) == 'Gray'}#555{/if}{if strip_tags($item.field_menutextcolor) == 'Color 1'}color:{echo siteinfo('siteinfo_color')}{/if}{if strip_tags($item.field_menutextcolor) == 'Color 2'}color:{echo siteinfo('siteinfo_color2')}{/if}">{$title} <!-- Реализовать появление стрелок, при условии, что есть подменю
    <i class="fa fa-angle-down"></i> --></a>{$wrapper}</li>