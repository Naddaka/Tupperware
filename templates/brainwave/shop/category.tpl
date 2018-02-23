<!-- Шаблон shop/category.tpl -->
	<!-- header.tpl -->{include_tpl('../header')}

   

<div class="container">
    <div class="row">
<!-- Left sidebar -->
        <div class="col-sm-3 left-sidebar page-section">
            <aside class="widget widget_product_search">
                <form role="search" method="get" class="woocommerce-product-search" action="#">
                    <input type="search" class="search-field form-control" placeholder="Search Products…" value="" name="s">
                    <input type="submit" value="Search" class="btn btn-primary hidden-xs hidden-sm hidden-md hidden-lg"> </form>
            </aside>
            <aside class="widget widget_shopping_cart">
                <h2 class="widget-title">Cart</h2>
                <div class="widget_shopping_cart_content">
                    <ul class="cart_list product_list_widget">
                        <li class="mini_cart_item"> <a href="#" class="remove">×</a>
                            <a href="single-product.html"> <img width="180" height="180" src="../img/content/products/product-9.jpg" class="attachment-shop_thumbnail">Suspendisse sed magna&nbsp; </a> <span class="quantity">1 × <span class="amount">$12.00</span></span>
                        </li>
                        <li class="mini_cart_item"> <a href="#" class="remove">×</a>
                            <a href="single-product.html"> <img width="180" height="180" src="../img/content/products/product-10.jpg" class="attachment-shop_thumbnail">Vestibulum bibendum&nbsp; </a> <span class="quantity">2 × <span class="amount">$35.00</span></span>
                        </li>
                    </ul>
                    <!-- end product list -->
                    <p class="total"><strong>Subtotal:</strong> <span class="amount">$82.00</span></p>
                    <p class="buttons"> <a href="cart.html" class="btn btn-default pull-right"><i aria-hidden="true" class="et-icon-basket"></i>&nbsp;&nbsp;View Cart</a>
                        <div class="clearfix"></div>
                    </p>
                </div>
            </aside>
            <aside class="widget widget_product_categories">
                <h2 class="widget-title">Product Categories</h2>
                <ul class="product-categories">
                    <li class="cat-item current-cat cat-parent"> <a href="#">Nam vehicula fermentum&nbsp;&nbsp;<span class="count">12</span></a>
                        <ul class="children">
                            <li class="cat-item"> <a href="#">Cras ac cursus&nbsp;&nbsp;<span class="count">32</span></a> </li>
                            <li class="cat-item"> <a href="#">Maecenas in &nbsp;&nbsp;<span class="count">10</span></a> </li>
                        </ul>
                    </li>
                    <li class="cat-item cat-parent"> <a href="#">Nullam sed&nbsp;&nbsp;<span class="count">25</span></a>
                        <ul class="children">
                            <li class="cat-item"> <a href="#">Lorem ipsum&nbsp;&nbsp;<span class="count">43</span></a> </li>
                            <li class="cat-item"> <a href="#">Aenean at libero&nbsp;&nbsp;<span class="count">87</span></a> </li>
                        </ul>
                    </li>
                    <li class="cat-item"> <a href="#">Donec ultricies arcu&nbsp;&nbsp;<span class="count">5</span></a> </li>
                </ul>
            </aside>
            <aside class="widget widget_top_rated_products">
                <h2 class="widget-title">Top Rated Products</h2>
                <ul class="product_list_widget">
                    <li>
                        <div class="pull-left left">
                            <a href="single-product.html"> <img width="180" height="180" src="../img/content/products/product-4.jpg" class="attachment-shop_thumbnail"> </a>
                        </div>
                        <div class="pull-right right">
                            <a href="single-product.html"> <span class="product-title">Curabitur convallis</span> </a>
                            <div class="star-rating" title="Rated 5.00 out of 5"> <span style="width:80%">
                        </div>
                        <span class="amount">$199</span> </div>
                            <div class="clearfix"></div>
                    </li>
                    <li>
                        <div class="pull-left left">
                            <a href="single-product.html"> <img width="180" height="180" src="../img/content/products/product-7.jpg" class="attachment-shop_thumbnail"> </a>
                        </div>
                        <div class="pull-right right">
                            <a href="single-product.html"> <span class="product-title">Curabitur convallis</span> </a>
                            <div class="star-rating" title="Rated 5.00 out of 5"> <span style="width:70%">
                        </div>
                        <span class="amount">$50</span> </div>
                            <div class="clearfix"></div>
                    </li>
                    <li>
                        <div class="pull-left left">
                            <a href="single-product.html"> <img width="180" height="180" src="../img/content/products/product-8.jpg" class="attachment-shop_thumbnail"> </a>
                        </div>
                        <div class="pull-right right">
                            <a href="single-product.html"> <span class="product-title">Suspendisse sed magna</span> </a>
                            <div class="star-rating" title="Rated 5.00 out of 5"> <span style="width:80%">
                        </div>
                        <span class="amount">$237</span> </div>
                            <div class="clearfix"></div>
                    </li>
                </ul>
            </aside>
            <div class="sidebar-bg"></div>
        </div>
<!-- Products -->
        <div class="col-sm-9">
            <div class="top-nav style-2">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="col-sm-7 select-sorting dark">
                            <div class="active"><span>Default sorting</span><i class="fa fa-angle-down"></i></div>
                            <ul class="list">
                                <li value="menu_order" selected="selected">Default sorting</li>
                                <li value="popularity">Sort by popularity</li>
                                <li value="rating">Sort by average rating</li>
                                <li value="date">Sort by newness</li>
                                <li value="price">Sort by price: low to high</li>
                                <li value="price-desc">Sort by price: high to low</li>
                            </ul>
                        </div>
                        <div class="col-sm-1 text-right price-title dark">Price: </div>
                        <div class="col-sm-4 creative dark">
                            <div id="price-range"></div>
                            <div class="price_range_amount" data-min="26" data-max="350" data-current-min="60" data-current-max="280"> </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <ul class="row products style-2">
            	
                <li class="col-sm-4 product">
                    <a href="single-product.html"> <img width="450" height="450" src="../img/content/products/product-1.jpg" alt="">
                        <h3>Sed ultricies molestie</h3> <span class="price">$57</span> </a> <a href="cart.html" class="add_to_cart_button"><span class="icon_cart_alt"></span>Add to cart</a> </li>
                <!-- .product -->

                <li class="col-sm-4 product">
                    <a href="single-product.html">
                        <div class="onsale">Sale!</div> <img width="450" height="450" src="../img/content/products/product-5.jpg" alt="">
                        <h3>Maecenas a neque</h3> <span class="price">
                    <del><span class="amount">$200.00</span></del> <ins><span class="amount">$150.00</span></ins> </span>
                    </a> <a href="cart.html" class="add_to_cart_button"><span class="icon_cart_alt"></span>Add to cart</a> </li>
                <!-- .product -->
                <li class="col-sm-4 product">
                    <a href="single-product.html"> <img width="450" height="450" src="../img/content/products/product-6.jpg" alt="">
                        <h3>Suspendisse sit amet</h3> <span class="price">$507</span> </a> <a href="cart.html" class="add_to_cart_button"><span class="icon_cart_alt"></span>Add to cart</a> </li>
                <!-- .product -->
                <li class="col-sm-4 product">
                    <a href="single-product.html"> <img width="450" height="450" src="../img/content/products/product-13.jpg" alt="">
                        <h3>Cras nec pulvinar</h3> <span class="price">$387</span> </a> <a href="cart.html" class="add_to_cart_button"><span class="icon_cart_alt"></span>Add to cart</a> </li>
                <!-- .product -->
                <li class="col-sm-4 product">
                    <a href="single-product.html"> <img width="450" height="450" src="../img/content/products/product-2.jpg" alt="">
                        <h3>Suspendisse dignissim</h3> <span class="price">$250</span> </a> <a href="cart.html" class="add_to_cart_button"><span class="icon_cart_alt"></span>Add to cart</a> </li>
                <!-- .product -->
                <li class="col-sm-4 product">
                    <a href="single-product.html"> <img width="450" height="450" src="../img/content/products/product-3.jpg" alt="">
                        <h3>Quisque sollicitudin dui</h3> <span class="price">$57</span> </a> <a href="cart.html" class="add_to_cart_button"><span class="icon_cart_alt"></span>Add to cart</a> </li>
                <!-- .product -->
                <li class="col-sm-4 product">
                    <a href="single-product.html"> <img width="450" height="450" src="../img/content/products/product-4.jpg" alt="">
                        <h3>Curabitur convallis</h3> <span class="price">$135</span> </a> <a href="cart.html" class="add_to_cart_button"><span class="icon_cart_alt"></span>Add to cart</a> </li>
                <!-- .product -->
                <li class="col-sm-4 product">
                    <a href="single-product.html"> <img width="450" height="450" src="../img/content/products/product-7.jpg" alt="">
                        <h3>In mattis molestie</h3> <span class="price">$987</span> </a> <a href="cart.html" class="add_to_cart_button"><span class="icon_cart_alt"></span>Add to cart</a> </li>
                <!-- .product -->
                <li class="col-sm-4 product">
                    <a href="single-product.html"> <img width="450" height="450" src="../img/content/products/product-8.jpg" alt="">
                        <h3>Suspendisse sed magna</h3> <span class="price">$157</span> </a> <a href="cart.html" class="add_to_cart_button"><span class="icon_cart_alt"></span>Add to cart</a> </li>
                <!-- .product -->
                <li class="col-sm-4 product">
                    <a href="single-product.html"> <img width="450" height="450" src="../img/content/products/product-9.jpg" alt="">
                        <h3>Vestibulum bibendum</h3> <span class="price">$237</span> </a> <a href="cart.html" class="add_to_cart_button"><span class="icon_cart_alt"></span>Add to cart</a> </li>
                <!-- .product -->
                <li class="col-sm-4 product">
                    <a href="single-product.html"> <img width="450" height="450" src="../img/content/products/product-10.jpg" alt="">
                        <h3>Morbi pharetra consequat</h3> <span class="price">$123</span> </a> <a href="cart.html" class="add_to_cart_button"><span class="icon_cart_alt"></span>Add to cart</a> </li>
                <!-- .product -->
                <li class="col-sm-4 product">
                    <a href="single-product.html">
                        <div class="onsale">Sale!</div> <img width="450" height="450" src="../img/content/products/product-11.jpg" alt="">
                        <h3>Phasellus eget faucibus</h3> <span class="price">
                    <del><span class="amount">$350.00</span></del> <ins><span class="amount">$199.00</span></ins> </span>
                    </a> <a href="cart.html" class="add_to_cart_button"><span class="icon_cart_alt"></span>Add to cart</a> </li>
                <!-- .product -->
            </ul>
            <div class="mt30 mb40">
                <nav class="pull-left">
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous"> <span aria-hidden="true"><i class="fa fa-angle-left"></i></span> </a>
                        </li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next"> <span aria-hidden="true"><i class="fa fa-angle-right"></i></span> </a>
                        </li>
                    </ul>
                </nav>
                <p class="woocommerce-result-count pull-right dark"> Showing 1–12 of 24 </p>
                <div class="clearfix"></div>
            </div>
        </div>

    </div>
</div>