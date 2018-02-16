<!--Шаблон главной страницы (homepage.tpl) подключен (родитель: main.tpl) -->
{$category = $CI->load->module('cfcm')->connect_fields($category, 'category')}

{if strip_tags($category.field_slider) == 'Fullscreen'}
<!-- include slider.tpl -->
  {include_tpl('slider')}
{/if}

<!-- Подключение главного контента в виде landing.tpl на странице Main -->
            {include_tpl('landing')}

{if strip_tags($category.field_contactform) == 'ON'}
       <!-- contact_form.tpl -->
            {include_tpl('contact_form')}
{/if}