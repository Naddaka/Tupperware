<!-- Шаблон page_full.tpl -->

<!-- Главный контейнер (стили блоков / настройки фона, цвета текста и другие) -->
<div id="page-full">
	<div class="container page-typo">
		<div class="row">
			<div class="col-sm-12">

				<!-- Заголовок, предварительное и полное содержимое -->
				{if strip_tags($page.field_titleoff) == ''}<div class="{if strip_tags($page.field_uppercase) == ''}{else:}uppercase {/if}h1{if strip_tags($page.field_bigh) == 'Monster'} giant{/if}{if strip_tags($page.field_bigh) == 'Big'} bigh{/if}{if strip_tags($page.field_bigh) == 'Middle'} middle{/if}" style="{if strip_tags($page.field_textcolor) == 'Color 1'}color:{echo siteinfo('siteinfo_color')}{/if}{if strip_tags($page.field_textcolor) == 'Color 2'}color:{echo siteinfo('siteinfo_color2')}{/if}">{strip_tags($page.title)}</div>
				{else:}<!--<div class="margin"></div> -->
				{/if}
				
				<div class="full">

					<!-- Основное фото -->
					{if $page.field_video}
					{else:}
					{if strip_tags($page.field_imgoff) == ''}
					{if $page.field_pagephoto}
					{if strip_tags($page.field_imgmask) == 'Rectangle'}
					<img class="{strip_tags($page.field_imgsize)}" src="{$page.field_pagephoto}" alt="{$page.field_alt}" />
					{else:}
					{if strip_tags($page.field_imgmask) == 'Circle'}
					<div class="img-crop {strip_tags($page.field_imgsize)}">
						<div class="img-mask {strip_tags($page.field_imgsize)}" style="background-image:url({$page.field_pagephoto})"> 
							{if $page.field_alt}
							<span>
								{$page.field_alt}  
							</span> {/if}
						</div>
					</div>
					{/if}
					{if strip_tags($page.field_imgmask) == 'Rounded'}
					<div class="img-crop {strip_tags($page.field_imgsize)}">
						<div class="img-round {strip_tags($page.field_imgsize)}" style="background-image:url({$page.field_pagephoto})"> 
							{if $page.field_alt}
							<span>
								{$page.field_alt}  
							</span> {/if}
						</div>
					</div>
					{/if}
					{/if}
					{/if}
					{/if}
					{/if}<!-- /Основное фото -->
					{$page.full_text}</div>
				</div>
			</div>
		</div>
	</div>
	{if $page.field_video}
	<div class="page-section bg-section" data-background="{$page.field_pagephoto}?v=1.0.0" data-overlay-color="#000" data-overlay-opacity="0.5">
		<div class="text-center">
			<a href="{$page.field_video}" class="popup-youtube big-icon white"><div class="circle pulse"></div><i class="fa fa-play"></i></a>
			<div>
				<h2 class="text-uppercase title-3 white mt50">{echo siteinfo('siteinfo_transl-watch')}</h2>
			</div>
		</div>
	</div>
	<!-- //video --> 
	{/if}