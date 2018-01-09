<!-- widget/lanswitch.tpl -->
<!-- Условие: показывать переключатель языков, только если их больше чем один -->
{if count($languages) > 1}
<div id="langs" class="container">
  <div class="row">
    <div class="col-sm-12">
      <div class="langswitch">

            <select class="lang-sel" onchange="top.location=this.value">
            {foreach $languages as $lang}
               {if $lang['current'] == 1}
                  <option selected="" value="/{echo $lang.identif . $current_address}">{$lang.lang_name}</option>
                {else:}
                  <option value="/{echo $lang.identif . $current_address}">{$lang.lang_name}</option>
               {/if}
           {/foreach}

            </select>
      </div>
    </div>
  </div>
</div>
{/if}