<!-- Шаблон store.tpl -->
<div class="store">
<div id="my-store-6298164"></div>
<div>
  <script type="text/javascript" src="https://app.ecwid.com/script.js?6298164&amp;data_platform=code&amp;data_date=2016-04-26" charset="utf-8"></script>
{literal}
<script type="text/javascript">
// <![CDATA[
  xProductBrowser("categoriesPerRow=3","views=grid(3,3) list(10) table(20)","categoryView=grid","searchView=list","id=my-store-6298164");
// ]]></script>{/literal}
</div>
</div>
<script src="//code.jquery.com/jquery.min.js"></script>
{literal}
<script>
    Ecwid.OnPageLoaded.add(function(page) {
        if (page.type == 'CATEGORY') {           
          jQuery(".ecwid-productBrowser-categoryDescription, .ecwid-productBrowser-subcategories-mainTable").insertAfter(".ecwid-productBrowser-category");
        }
    });
</script>
{/literal}