
$(document).ready(function () {
    var eco = (function(){
        var inited = false;
        var auto_class = { $small : 0, $middle : 0, $high : 0 , $micro_bus : 0};
        var selected = '';
        var services = { $handmade : 0 , $first_complex: 0 , $second_complex : 0 , $third_complex : 0 };
        var $choice_checkbox = {};
        var elements_count = '';
        var $elements_count = {};
        var choice_opt = '';
        var eco_opt = '';
        var prices = '';
        var $eco_option = {};
        var $prices = {};
        var total = {total_price: 0, $total_price: 0};
        var $is_client = {};
        var complexes = {   $complex1 : 0., $complex2  : 0 , $complex3: 0  };
        var complexes_selectors = { complex1 : '', complex2 : '' , complex3: '' };
        var complexes_buttons  =  { $complex1 : 0., $complex2  : 0 , $complex3: 0 };
        var complexes_buttons_selectors = {complex1 : '', complex2 : '' , complex3: ''};
        var selected_complex = '';
        var handmade = "";
        var $handmade = 0;
        var get_properity = "";
        var blocker = "";
        var $blocker = 0;

        function init()
        {
            //blocker

            blocker = "blocker";
            $blocker = $("."+blocker);
            //complexes

            complexes_selectors.complex1 = ".first-complex";
            complexes_selectors.complex2 = ".second-complex";
            complexes_selectors.complex3 = ".third-complex";

            complexes.$complex1 = $(complexes_selectors.complex1);
            complexes.$complex2 = $(complexes_selectors.complex2);
            complexes.$complex3 = $(complexes_selectors.complex3);

            complexes_buttons_selectors.complex1 = "#first-complex";
            complexes_buttons_selectors.complex2 = "#second-complex";
            complexes_buttons_selectors.complex3 = "#third-complex";

            complexes_buttons.$complex1 = $(complexes_buttons_selectors.complex1);
            complexes_buttons.$complex2 = $(complexes_buttons_selectors.complex2);
            complexes_buttons.$complex3 = $(complexes_buttons_selectors.complex3);
            handmade = "#handmade";
            $handmade = $(handmade);

            get_properity = "complex";
            choice_opt = ".choice-opt";
            eco_opt = ".eco-opt";
            prices = ".price_container";
            elements_count = ".elements_count";
            //auto_class init
            auto_class.$small = $("#small");
            auto_class.$middle = $("#middle");
            auto_class.$high = $("#high");
            auto_class.$micro_bus = $("#micro-bus");

            //services init
            services.$handmade = $("#handmade");
            services.$first_complex = $("#first-complex");
            services.$second_complex = $("#second-complex");
            services.$third_complex = $("#third-complex");

            //checkbox init
            $choice_checkbox = $(choice_opt);
            $elements_count = $(elements_count);
            //eco_option init
            $eco_option = $(eco_opt);
            $prices = $(prices);
            total.$total_price = $("#total");
            selected = auto_class.$small.attr("id");
            $is_client = $("#is_client");
            inited = true;
            auto_class.$small.click();
            services.$handmade.click();
            redraw_prices();
        }

        function events(){
            for( var key in auto_class ){
                if(auto_class.hasOwnProperty(key)) {
                    auto_class[key].on("click", function (event) {
                        selected = event.target.id;
                        redraw_prices();
                        if(selected_complex == ""){
                            $elements_count.each(function(){
                                redraw_by_element_count($(this), Number($(this).parent().parent().find(prices).text()));
                            });
                            reinit_total();
                        } else {
                            total.total_price = $("."+selected_complex).find("#" + selected).val();
                            draw_total_price();
                            console.log(total.total_price);
                        }
                    });
                }
            }

            for( var key in services ){
                if(services.hasOwnProperty(key)) {
                    services[key].on("click", function (event) {

                    });
                }
            }

            $choice_checkbox.on("click", function(event){
                reinit_total();
            });


            $eco_option.on("click", function(event){
                if($(this).find("input[type=checkbox]").prop("checked"))
                    redraw($(this).parent().find(prices), selected + "_eco");
                 else
                    redraw($(this).parent().find(prices), selected);
                redraw_by_element_count($(this).parent().find(elements_count), $(this).parent().find(prices).text());
                if($(this).parent().find(choice_opt).find("input[type=checkbox]").prop("checked"))
                    reinit_total();
            });

            var previous = 0;
            $elements_count.on("focus", function(){
               previous = Number( $(this).val() );
            }).on("change", function(){
                change_element_count($(this), previous);
                previous = Number($(this).val());
                if($(this).parent().parent().find(choice_opt).find("input[type=checkbox]").prop("checked"))
                    reinit_total();

            });

            $is_client.on("click", function(event) {
                draw_total_price();
            });

            $.each(complexes_buttons, function(key, element){
                element.on("click", function (event) {
                    var id = $(this).attr("id");
                    selected_complex = id;
                    display_blocker();
                    check_all_from_complex();
                    var $complex = '' ;
                    $.each(complexes , function(key, el){
                        if(  el.attr("class") == id ) {
                            $complex  = el;
                            return false;
                        }
                    });
                    if(typeof $complex !== "undefined" ) {
                        total.total_price = $complex.find("#" + selected).val();
                        draw_total_price();
                    }
                });
            });
            $handmade.on("click", function(){
                selected_complex = "";
                check_all_from_complex();
                reinit_total();
                hide_blocker();
            });


        }

        function check_all_from_complex(){
            if(selected_complex != "")
                $choice_checkbox.each(function(){
                    if($(this).find("input").attr(selected_complex) != undefined){
                        $(this).find("input").prop("checked", true);
                    } else {
                        $(this).find("input").prop("checked", false );
                    }
                });
            else
                $choice_checkbox.each(function(){
                    $(this).find("input").prop("checked", false );
                });
        }

        function redraw_prices(){
            $prices.each(function(){
                if($(this).parent().find(eco_opt).find("input[type=checkbox]").prop("checked"))
                    redraw($(this), selected+"_eco" );
                else
                    redraw($(this), selected );
            });
            reinit_total();
        }

        function redraw($selector, selected_val){
            var cache = $selector.children();
            $selector.text($selector.parent().find("."+selected_val+"_price").val()).append(cache);
        }

        function redraw_by_count($selector, price){
            var cache = $selector.children();
         //   console.log(cache);
            $selector.text(price).append(cache);
        }


        function count_total_price(){
            var total_price = 0;
            $prices.each(function(){
                if($(this).parent().find(choice_opt).find("input[type=checkbox]").prop("checked"))
                    total_price += Number($(this).parent().find(prices).text());
            });
            total.total_price = total_price;
        }

        function draw_total_price (){
            if($is_client.prop("checked")) {
                total.$total_price.text(total.total_price  * 0.8);
            } else {
                total.$total_price.text(total.total_price);
            }
        }

        function getGetParam(q){
            return (window.location.search.match(new RegExp('[?&]' + q + '=([^&]+)')) || [, null])[1];
        }

        function selectComplex(selector)
        {
            selected_complex = selector;
            $("#"+selector).click();
        }
        function reinit_total(){
            count_total_price();
            draw_total_price();
        }

        function display_blocker(){
            $blocker.css("display", "block");
        }

        function hide_blocker(){
            $blocker.css("display", "none");
        }

        function change_element_count($selector, previous_elements_count){
            var elements_count = Number($selector.val());
            var previous_price = Number($selector.parent().parent().find(prices).text());
            var price_per_one = previous_price / previous_elements_count ;
            redraw_by_count($selector.parent().parent().find(prices), elements_count * price_per_one );
        }

        function redraw_by_element_count($selector, price_per_one){
            var elements_count = Number($selector.val());
            redraw_by_count($selector.parent().parent().find(prices), elements_count * price_per_one );
        }
        return {
            init: function()
            {
                init();
                if(inited){
                    events();
                    selectComplex(getGetParam(get_properity));
                }
            }

        };
    }());
    eco.init();
});