<!-- Шаблон page_portfolio.tpl -->
<div id="works-linker" class="mt90">
    {echo $CI->load->module('linker2')->get_links($page.id)}
</div>
<div id="page_portfolio" class="page-section">
    <div class="container mt-50">

        {if $page.field_albumID}<!--Вставка альбома галереи на странице -->
        {$img = $CI->load->module('gallery')->gallery_m->get_album_images($page.field_albumID, NULL, NULL, current_language())}
        {$count=0}
        <div class="row mb70">
            <div class="col-sm-12">
                <div class="owl-carousel default-carousel mb-xs40 popup-gallery">
                    {foreach $img as $image}
                    <div>
                        <a href="{media_url('uploads/gallery')}/{$image.album_id}/{$image.file_name}{$image.file_ext}?v=1.0.0"><img src="{media_url('uploads/gallery')}/{$image.album_id}/{$image.file_name}{$image.file_ext}?v=1.0.0" alt=""></a>
                    </div>
                    {$count++}
                    {/foreach}
                </div>
            </div>
        </div>

    {/if}
    <div class="row work-full-detail mb25">
        <div class="col-sm-10 col-sm-offset-1">
            <div class="row">
                {if $page.field_accent3plus}
                <div class="col-sm-4">
                    <p> <b>Дата:</b>
                        <br>{$page.field_accent1plus}</p>
                    </div>
                    <div class="col-sm-4">
                        <p> <b>Клиент:</b>
                            <br>{$page.field_accent2plus}</p>
                        </div>

                        <div class="col-sm-4">
                            <p> <b>Сайт:</b>
                                <br> <a href="{$page.field_accent3plus}" target="_blank">{$page.field_accent3plus}</a> </p>
                            </div>
                            {else:}
                            <div class="col-sm-6">
                                <p> <b>Дата:</b>
                                    <br>{$page.field_accent1plus}</p>
                                </div>
                                <div class="col-sm-6">
                                    <p> <b>Клиент:</b>
                                        <br>{$page.field_accent2plus}</p>
                                    </div>
                                    {/if}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-10 col-sm-offset-1">
                               {$page.full_text}

                           </div>
                       </div>
                       <div class="row mt50">
                        <div class="col-sm-12">
                           {echo $CI->load->module('linker2')->get_links($page.id)}
                       </div>
                   </div>
               </div>
           </div>
           <!--  include follow_soc -->{include_tpl('follow_soc')}
           <!--  include contact_order -->{include_tpl('contact_order')}