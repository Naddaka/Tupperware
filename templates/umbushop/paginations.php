<?php

/**
 * |----------------------------------------|
 * |PAGINATION VARIABLES AND DEFAULT VALUES:|
 * |----------------------------------------|
 *
 * ['base_url'] = ''; // The page we are linking to
 * ['prefix'] = ''; // A custom prefix added to the path.
 * ['suffix'] = ''; // A custom suffix added to the path.
 * ['total_rows'] = 0; // Total number of items (database results)
 * ['per_page'] = 10; // Max number of items you want shown per page
 * ['num_links'] = 3; // Number of "digit" links to show before/after the currently viewed page
 * ['cur_page'] = 0; // The current page being viewed
 * ['use_page_numbers'] = FALSE; // Use page number for segment instead of offset
 * ['first_link'] = '<span class="first-page">&laquo;</span>';
 * ['next_link'] = '<span class="next-page">Следующая страница</span> <span class="text-el">→</span>';
 * ['prev_link'] = '<span class="text-el">←</span> <span class="prev-page">Предыдущая страница</span>';
 * ['last_link'] = '<span class="last-page">&raquo;</span>';
 * ['uri_segment'] = 3;
 * ['full_tag_open'] = '<div class="pagination"><ul class="f-s_0">';
 * ['full_tag_close'] = '</ul></div>';
 * ['first_tag_open'] = '<li>';
 * ['first_tag_close'] = '<li class="clear-pag-item">...</li></li>';
 * ['first_tag_close_no_dots'] = '</li>';
 * ['last_tag_open'] = '<li class="clear-pag-item">...</li><li>';
 * ['last_tag_open_no_dots'] = '<li>';
 * ['last_tag_close'] = '</li>';
 * ['first_url'] = ''; // Alternative URL for the First Page.
 * ['cur_tag_open'] = '<li class="active"><span>';
 * ['cur_tag_close'] = '</span></li>';
 * ['next_tag_open'] = '<li class="next-page">';
 * ['next_tag_close'] = '</li>';
 * ['prev_tag_open'] = '<li class="prev-page">';
 * ['prev_tag_close'] = '</li>';
 * ['num_tag_open'] = '<li>';
 * ['num_tag_close'] = '</li>';
 * ['page_query_string'] = FALSE;
 * ['query_string_segment'] = 'per_page';
 * ['display_pages'] = TRUE;
 * ['anchor_class'] = '';
 * ['controls_tag_open'] = '';
 * ['controls_tag_close'] = '';
 * ['separate_controls'] = FALSE;
 */

/**
 *Config pagination
 */

/* Pagination wrapper */
$paginationConfig['full_tag_open'] = '<nav><ul class="pagination">';
$paginationConfig['full_tag_close'] = '</ul></nav>';

/* First page */
$paginationConfig['first_tag_open'] = '<li><a>';
$paginationConfig['first_link'] = '1...';
$paginationConfig['first_tag_close'] = '</a></li>';

/* Previous page */
$paginationConfig['prev_tag_open'] = '<li>';
$paginationConfig['prev_link'] = '<span aria-hidden="true"><i class="fa fa-angle-left"></i></span>';
$paginationConfig['prev_tag_close'] = '</li>';

/* Page number */
$paginationConfig['num_tag_open'] = '<li>';
$paginationConfig['num_tag_close'] = '</li>';

/* Page number active */
$paginationConfig['cur_tag_open'] = '<li class="active"><a>';
$paginationConfig['cur_tag_close'] = '</a></li>';

/* Next page */
$paginationConfig['next_tag_open'] = '<li>';
$paginationConfig['next_link'] = '<span aria-hidden="true"><i class="fa fa-angle-right"></i></span>';
$paginationConfig['next_tag_close'] = '</li>';

/* Last page */
$paginationConfig['last_tag_open'] = '<li>';
$paginationConfig['last_link'] = '... '.ceil($paginationConfig['total_rows']/$paginationConfig['per_page']);
$paginationConfig['last_tag_close'] = '</li>';


/* Configuration */
$paginationConfig['num_links'] = 2;
$paginationConfig['page_query_string'] = true;