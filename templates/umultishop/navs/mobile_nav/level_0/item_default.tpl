<li class="mobile-nav__item" data-mobile-nav-item data-nav-setactive-item>
	<a class="mobile-nav__link" href="{$link}" {if $wrapper} data-mobile-nav-link{/if} {$target} data-nav-setactive-link>
    {$title}
    {if $wrapper}<span class="mobile-nav__has-children"><svg class="svg-icon"><use xlink:href="{$THEME}_img/sprite.svg#svg-icon__angle-right"></use></svg></span>{/if}
  </a>
	{$wrapper}
</li>