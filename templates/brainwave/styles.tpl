<!--Шаблон для подключение стилей (styles.tpl), которые настраиваются в main.tpl -->
{$category = get_category(76)}
{$item = $CI->load->module('cfcm')->connect_fields($category, 'category')}

{literal}
<style>
body {
  {/literal}{if $category.field_menucolor}{literal}background: {/literal}{strip_tags($category.field_bgcolor)}{literal};{/literal}{/if}{literal}
  {/literal}{if $category.field_textcolor}{literal}color: {/literal}{if strip_tags($category.field_textcolor) == 'Black'}#000{/if}{if strip_tags($category.field_textcolor) == 'White'}#fff{/if}{if strip_tags($category.field_textcolor) == 'Gray'}#444{/if}{if strip_tags($category.field_textcolor) == 'Color 1'}color:{echo siteinfo('siteinfo_color')}{/if}{if strip_tags($category.field_textcolor) == 'Color 2'}color:{echo siteinfo('siteinfo_color2')}{/if}{literal};{/literal}{/if}{literal}
}
</style>
{/literal}