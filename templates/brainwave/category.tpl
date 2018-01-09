<!-- Шаблон category.tpl -->
	
<!-- header.tpl -->{include_tpl('header')}
<!-- landing.tpl -->{include_tpl('landing')}
    {$content}
{$category = $CI->load->module('cfcm')->connect_fields($category, 'category')}
{if strip_tags($category.field_contactform) == 'ON'}
<!-- contact_form.tpl -->{include_tpl('contact_form')}
{/if} 