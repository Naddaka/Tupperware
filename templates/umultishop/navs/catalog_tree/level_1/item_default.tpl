<li class="tree-nav__item" {if $wrapper}data-global-doubletap{/if} data-nav-setactive-item>
  <a class="tree-nav__link" href="{$link}" data-nav-setactive-link>
    <span>{$title}</span>
    {if $wrapper}
      <i class="tree-nav__arrow">
        <svg class="svg-icon svg-icon--caret">
          <use xlink:href="{$THEME}_img/sprite.svg#svg-icon__caret-right"></use>
        </svg>
      </i>
    {/if}
  </a>
  {$wrapper}
</li>