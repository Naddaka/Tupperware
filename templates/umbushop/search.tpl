<!-- Шаблон search.tpl -->
<!-- header.tpl -->
{include_tpl('header')}

{$loc_items_num = count($items)}
<!-- Главный контейнер (стили блоков / настройки фона, цвета текста и другие) -->
<div id="page-standart" style="padding: 130px 0 100px;">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">


    <h1>
        {echo siteinfo('siteinfo_transl-results')}
    </h1>

        <p>{echo siteinfo('siteinfo_transl-searchfor')} <q>{$search_title}</q></p>
        <p>{echo siteinfo('siteinfo_transl-result')} {$loc_items_num}</p>


        {if $loc_items_num > 0}
           
            {foreach $items as $item}
                {$loc_page_category_name = get_category_name($item.category)}
             
                    <h2>
                        <a href="{site_url($item.full_url)}">{$item.title}</a>
                    </h2>
                    {if $loc_page_category_name}
                    <p>
                        <span>{echo siteinfo('siteinfo_transl-cat')}</span>
                        <a href="{site_url($item.cat_url)}" class="">{$loc_page_category_name}</a>
                    </p>
                    {/if}
                    <div>
                        {if $item.parsedText}
                            {$item.parsedText}
                        {else:}
                            {$item.prev_text}
                        {/if}
                    </div>
              
            {/foreach}
           
        {else:}
            <p>
                {echo siteinfo('siteinfo_transl-nofind')}
            </p>
        {/if}

        {if $pagination}
        
            {$pagination}
       
        {/if}
                </div>
            </div>
        </div>
    </div>