<!-- Виджет Комплесы -->
<div class="col-sm-12">
 <div id="complex" class="text-center">
      {foreach $recent_news as $item}
      {$item = $CI->load->module('cfcm')->connect_fields($item, 'page')}
      <div class="pricing-item style-1{if strip_tags($item.field_textcolor) == 'Black'} white{/if}{if strip_tags($item.field_textcolor) == 'White'} dark{/if}{if strip_tags($item.field_textcolor) == 'Gray'} white{/if}" style="background-color:{$item.field_bgcolor}">
            <div class="text-center">
                <div class="price-box">
                    <div class="price">{$item.field_price}</div>
                    <div class="per">{$item.field_pretitle}</div>
                </div>
            </div>
           <div class="title"><span style="color:{$item.field_titlecolor}">{$item.title}</span></div>
            <div class="text-center">
               {$item.prev_text} 
               {if $item.field_link}<a class="btn btn-primary{if strip_tags($item.field_textcolor) == 'White'} btn-inverted{/if}" href="{$item.field_link}">{strip_tags($item.field_btname)}</a>{/if}
               </div>
        </div>
	  {/foreach}                        
    </div>
</div>
<!--background-color:{if $item.field_bgcolor}{$item.field_bgcolor}{else:}#fff{/if} -->