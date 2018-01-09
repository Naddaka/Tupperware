{tpl_register_asset('nova_poshta/css/select2.min.css', 'before')}
{tpl_register_asset('nova_poshta/css/style.css', 'before')}

{tpl_register_asset('nova_poshta/js/select2.min.js', 'after')}
{tpl_register_asset('nova_poshta/js/nova_poshta.js', 'after')}


<!-- Get cities array -->
{$loc_cities = json_decode(module('nova_poshta')->getCitiesJSON(), true);}
<div class="delivery-radio__spoiler-row">
  <label class="delivery-radio__spoiler-col" for="nova_poshta_city">
    {tlang('City')}:
  </label>
  <div class="delivery-radio__spoiler-col delivery-radio__spoiler-col--wide">
    <select class="form-control input-sm" name="nova_poshta_city" id="nova_poshta_city"
            data-select2-select
            data-nposhta--city
            data-nposhta--warehouses-url="{site_url('nova_poshta/getwarehousesjson')}">

      <option>-- {tlang('Select your city')} --</option>

      {foreach $loc_cities as $city}
        <option value="{$city.Ref}">{$city.Description}</option>
      {/foreach}
    </select>
  </div>
</div>


<!-- Get warehouses array -->
<div class="delivery-radio__spoiler-row hidden"
     data-nposhta--warehouses>

  <label class="delivery-radio__spoiler-col" for="nova_poshta_warehouse">
    {tlang('Warehouse')}:
  </label>
  <div class="delivery-radio__spoiler-col">
    <div class="form-input">
      <select class="form-input__control form-input__control--sm" name="nova_poshta_warehouse" id="nova_poshta_warehouse"
              data-select2-select
              data-nposhta--warehouses-select>
        <!-- options are inserted via Javascript -->
      </select>
      <div class="form-input__info">
        <button class="form-input__link form-input__link--js" type="button" data-nposhta--map>{tlang('View on the map')}</button>
      </div>
    </div>
  </div>

</div>