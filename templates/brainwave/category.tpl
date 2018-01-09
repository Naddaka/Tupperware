<!-- Шаблон category.tpl -->
	
<!-- header.tpl -->{include_tpl('header')}
<!-- landing.tpl -->{include_tpl('landing')}
    {$content}

{if strip_tags($category.field_contactform) == 'ON'}
<!-- contact_form.tpl -->{include_tpl('contact_form')}
{/if} 