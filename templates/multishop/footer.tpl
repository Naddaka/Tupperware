<!-- footer.tpl подключен --> 
<footer>
    {$page = get_page(160)}
{$page = $CI->load->module('cfcm')->connect_fields($page, 'page')}
    
    <div class="site-footer display-h pos-relative{if strip_tags($page.field_textcolor) == 'Black'} text-black{/if}{if strip_tags($page.field_textcolor) == 'White'} text-white{/if}{if strip_tags($page.field_textcolor) == 'Gray'} text-gray{/if}" style="{if $page.field_bgcolor}background-color:{$page.field_bgcolor};{/if}{if strip_tags($page.field_textcolor) == 'Color 1'}color:{echo siteinfo('siteinfo_color')}{/if}{if strip_tags($page.field_textcolor) == 'Color 2'}color:{echo siteinfo('siteinfo_color2')}{/if}">
       
       <div class="text-center socials"> 

         {if $page.field_facebook}<a class="soc fadeInUp wow" data-wow-delay="0.1s" style="background-image:url('{$page.field_facebookIcon}');" href="{$page.field_facebook}" target="_blank">&nbsp;</a>{/if}

        {if $page.field_vk}<a class="soc fadeInUp wow" data-wow-delay="0.2s" style="background-image:url('{$page.field_vkIcon}');" href="{$page.field_vk}" target="_blank">&nbsp;</a>{/if}

         {if $page.field_gp}<a class="soc fadeInUp wow" data-wow-delay="0.3s" style="background-image:url('{$page.field_gpIcon}');" href="{$page.field_gp}" target="_blank">&nbsp;</a>{/if}
         
         {if $page.field_youtube}<a class="soc fadeInUp wow" data-wow-delay="0.3s" style="background-image:url('{$page.field_youtubeIcon}');" href="{$page.field_youtube}" target="_blank">&nbsp;</a>{/if}

         {if $page.field_twitter}<a class="soc fadeInUp wow" data-wow-delay="0.4s" style="background-image:url('{$page.field_twitterIcon}');" href="{$page.field_twitter}" target="_blank">&nbsp;</a>{/if}

         {if $page.field_instagram}<a class="soc fadeInUp wow" data-wow-delay="0.5s" style="background-image:url('{$page.field_instagramIcon}');" href="{$page.field_instagram}" target="_blank">&nbsp;</a>{/if}
         </div>
            <div class="copyright">
                <div class="company text-center text-uppercase">{$page.prev_text}</div>
                <div class="text-center">{$page.full_text}</div>
            </div>
        </div>
        
   </footer>
<!--/site-footer -->