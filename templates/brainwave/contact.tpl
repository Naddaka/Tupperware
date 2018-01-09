<!-- Шаблон category.tpl -->
 			<!-- header.tpl -->
            {include_tpl('header')}
            
{foreach $pages as $page}
{$page = $CI->load->module('cfcm')->connect_fields($page, 'page')}
<div id="contacts" class="page-section">
        <div class="container">
             
            <div class="row">
            {if strip_tags($page.field_titleoff) == ''}
             <div class="col-sm-12">
                 <h1>{$page.title}</h1>
              </div>
             {/if}
              <div class="col-sm-3 fadeInUp wow" data-wow-delay="0.3s">
                  {$page.prev_text}
                </div>
              <div class="col-sm-3 col-sm-offset-1 fadeInUp wow" data-wow-delay="0.2s">
                    {$page.full_text}
                </div>
              <div class="col-sm-4 col-sm-offset-1 fadeInUp wow" data-wow-delay="0.1s">
                    {$page.field_accent1text}
                    {$category.field_accent1text}
              </div>
            </div>
            
        </div>
    </div><!-- .page-section -->
 {/foreach}             
         
            <!-- contact_form.tpl -->
            <div id="formdiv">{include_tpl('contact_form')}</div>
         