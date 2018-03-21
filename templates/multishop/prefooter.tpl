<!-- prefooter.tpl --> 

    {$pages = category_pages('4')}
    {foreach $pages as $item}
    {$item = $CI->load->module('cfcm')->connect_fields($item, 'page')}
        {if $category.id == '1' or $category.id == '10'}
        {if strip_tags($item.field_foter) == 'Map'}
          <article>
                <div class="page-section map-section style-2 map" data-background-color="#ffffff">
                        <div id="map-canvas" data-map-lon="{$item.field_lon}" data-map-lat="{$item.field_lat}" data-map-marker-lon="{$item.field_lon}" data-map-marker-lat="{$item.field_lat}" data-map-marker-title="Psychologue"></div>
                </div><!-- .page-section -->
            </article>

    {literal}
<script type="text/javascript">

function mapInit() {
    if ( $( "#map-canvas" ).length > 0 ) {

        mapInitialize();

        $(window).resize( mapInitialize );
    }
}

function mapInitialize() {

    var mapLon = $( "#map-canvas" ).data( "map-lon" );  // Longitude
    var mapLat = $( "#map-canvas" ).data( "map-lat" );  // Latitude

    // Marker
    var mapMarkerLon = $( "#map-canvas" ).data( "map-marker-lon" );  // Longitude
    var mapMarkerLat = $( "#map-canvas" ).data( "map-marker-lat" );  // Latitude
    var mapMarkerTitle = $( "#map-canvas" ).data( "map-marker-title" );  // Latitude

    //Default
    if ( mapLon === undefined ) { mapLon = -34.697; }
    if ( mapLat === undefined ) { mapLat = 151.22; }

    if ( mapMarkerLon === undefined ) { mapMarkerLon = ""; }
    if ( mapMarkerLat === undefined ) { mapMarkerLat = ""; }
    if ( mapMarkerTitle === undefined ) { mapMarkerTitle = ""; }

    if ( $( "#map-canvas" ).length > 0 ) {
        var center = new google.maps.LatLng( mapLon, mapLat );
    }

    var roadAtlasStyles = [{"featureType":"administrative","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"visibility":"simplified"},{"color":"#fcfcfc"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"visibility":"simplified"},{"color":"#fcfcfc"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"visibility":"simplified"},{"color":"#dddddd"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"visibility":"simplified"},{"color":"#dddddd"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"visibility":"simplified"},{"color":"#eeeeee"}]},{"featureType":"water","elementType":"geometry","stylers":[{"visibility":"simplified"},{"color":"#dddddd"}]}];

    var mapOptions = {
        zoom: 13,
        center: center,
        draggable: true,
        disableDefaultUI: false,
        disableDoubleClickZoom: true,
        scrollwheel: false,
        mapTypeControlOptions: {
            mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'usroadatlas']
        }
    };

    var map = new google.maps.Map(document.getElementById( 'map-canvas' ), mapOptions);

    var marker = new google.maps.Marker({
        position: new google.maps.LatLng( mapMarkerLon, mapMarkerLat ),
        map: map,
        title: mapMarkerTitle
    });

    var styledMapOptions = {
        name: 'US Road Atlas'
    };

    var usRoadMapType = new google.maps.StyledMapType( roadAtlasStyles, styledMapOptions );

    map.mapTypes.set( 'usroadatlas', usRoadMapType );
    map.setMapTypeId( 'usroadatlas' );
}

</script>
{/literal}
            {/if}
            {else:}
   <!--  Подвал на Two columns -->
                {if strip_tags($item.field_foter) == 'Two columns'}
                            <article class="prefoot">
                <div class="page-section map-section style-2 foot-two-col{if strip_tags($item.field_textcolor) == 'Black'} text-black{/if}{if strip_tags($item.field_textcolor) == 'White'} text-white{/if}{if strip_tags($item.field_textcolor) == 'Gray'} text-gray{/if}" style="{if $item.field_bgcolor}background-color:{$item.field_bgcolor};{/if}{if strip_tags($item.field_textcolor) == 'Color 1'}color:{echo siteinfo('siteinfo_color')}{/if}{if strip_tags($item.field_textcolor) == 'Color 2'}color:{echo siteinfo('siteinfo_color2')}{/if}">
                    <div class="col-sm-6 col-sm-offset-6 map-block">
                        <div id="map-canvas" data-map-lon="{$item.field_lon}" data-map-lat="{$item.field_lat}" data-map-marker-lon="{$item.field_lon}" data-map-marker-lat="{$item.field_lat}" data-map-marker-title="Hello :)"></div>
                    </div>
                    <div class="container" style="padding: {if $item.field_martop}{$item.field_martop}px{else:}30px{/if} 15px{if $item.field_marbot} {$item.field_marbot}px{else:} 10px{/if}">
                        <div class="col-sm-6">
                        {$item.prev_text}
                        </div>
                    </div>
                </div>
                <!-- .page-section -->
            </article>

    {literal}
<script type="text/javascript">

function mapInit() {
    if ( $( "#map-canvas" ).length > 0 ) {

        mapInitialize();

        $(window).resize( mapInitialize );
    }
}

function mapInitialize() {

    var mapLon = $( "#map-canvas" ).data( "map-lon" );  // Longitude
    var mapLat = $( "#map-canvas" ).data( "map-lat" );  // Latitude

    // Marker
    var mapMarkerLon = $( "#map-canvas" ).data( "map-marker-lon" );  // Longitude
    var mapMarkerLat = $( "#map-canvas" ).data( "map-marker-lat" );  // Latitude
    var mapMarkerTitle = $( "#map-canvas" ).data( "map-marker-title" );  // Latitude

    //Default
    if ( mapLon === undefined ) { mapLon = -34.697; }
    if ( mapLat === undefined ) { mapLat = 151.22; }

    if ( mapMarkerLon === undefined ) { mapMarkerLon = ""; }
    if ( mapMarkerLat === undefined ) { mapMarkerLat = ""; }
    if ( mapMarkerTitle === undefined ) { mapMarkerTitle = ""; }

    if ( $( "#map-canvas" ).length > 0 ) {
        var center = new google.maps.LatLng( mapLon, mapLat );
    }

    var roadAtlasStyles = [{"featureType":"administrative","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"visibility":"simplified"},{"color":"#fcfcfc"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"visibility":"simplified"},{"color":"#fcfcfc"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"visibility":"simplified"},{"color":"#dddddd"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"visibility":"simplified"},{"color":"#dddddd"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"visibility":"simplified"},{"color":"#eeeeee"}]},{"featureType":"water","elementType":"geometry","stylers":[{"visibility":"simplified"},{"color":"#dddddd"}]}];

    var mapOptions = {
        zoom: 17,
        center: center,
        draggable: true,
        disableDefaultUI: true,
        disableDoubleClickZoom: true,
        scrollwheel: false,
        mapTypeControlOptions: {
            mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'usroadatlas']
        }
    };

    var map = new google.maps.Map(document.getElementById( 'map-canvas' ), mapOptions);

    var marker = new google.maps.Marker({
        position: new google.maps.LatLng( mapMarkerLon, mapMarkerLat ),
        map: map,
        title: mapMarkerTitle
    });

    var styledMapOptions = {
        name: 'US Road Atlas'
    };

    var usRoadMapType = new google.maps.StyledMapType( roadAtlasStyles, styledMapOptions );

    map.mapTypes.set( 'usroadatlas', usRoadMapType );
    map.setMapTypeId( 'usroadatlas' );
}
</script>
{/literal}
     
               {/if}<!--/ Подвал на Two columns -->
          
           {/if}
       {/foreach}
  
<!--/site-footer -->