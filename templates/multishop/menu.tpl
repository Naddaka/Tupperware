<!-- Подключение меню (menu.tpl) -->

{$category = get_category(76)}
{$item = $CI->load->module('cfcm')->connect_fields($category, 'category')}

{if strip_tags($item.field_menu) == 'Left-Right'}

<div class="navigation default leftright navbar-fixed-top" style="background-color: {if $item.field_menucolor}{strip_tags($item.field_menucolor)}{else:}#000{/if}">
        <button type="button" class="navbar-toggle collapsed"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="title">{echo siteinfo('siteinfo_transl-menu')}</span> </button>
    <nav>
    	<div class="container">
			<div class="row">
				<div class="col-sm-4 menu-l">
					<!-- Подключение шаблона верхнего меню (/main_menu/level_0/) --> 
    				{load_menu('top-menu')}
				</div>
	
				<div class="col-sm-4 menu-lr">
					<!-- Логотип
    				<a class="navbar-brand" href="{site_url()}"> <img class="logo-img" src="/uploads/images/boginsky-logo-svg-01.svg" alt=""> </a> --> 
				</div>
	
				<div class="col-sm-4 menu-r">
					<!-- Подключение шаблона верхнего меню (/main_menu/level_0/) --> 
    				{load_menu('top-menu-2')}
				</div>
			</div>
		</div>

	</nav>
</div>

{else:}
<!-- Подключение шаблона верхнего меню (/main_menu/level_0/) --> 
    {load_menu('top-menu')}
{/if}