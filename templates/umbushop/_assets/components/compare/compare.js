/*
 * Make all compare product elements equal height
 */

(function () {
  $.mlsCompare.productsEqualHeight();
  var timeoutId = null;
  window.addEventListener("resize", function () {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(function () {
      $.mlsCompare.productsEqualHeight();
    }, 500);
  });
})();


/*
 * Add to compare button and change total items in compare
 */
$(document).on('click', '[data-compare-scope="add_to"] [data-compare-add]', function (e) {
  e.preventDefault();

  var target = $(this);
  var container = $(this).closest('[data-compare-scope]');
  var buttons = container.find('[data-compare-add], [data-compare-open]');
  var linkClass = $('[data-compare-removeclass]').data('compare-removeclass');

  $.ajax({
    url: target.attr('data-compare-add'),
    type: 'get',
    dataType: 'json',
    beforeSend: function () {
      $.mlsAjax.preloaderShow({
        type: 'text',
        frame: target
      });
    },
    success: function (data) {
      if (data.success) {
        // Switch visibility between add and open buttons
        buttons.toggleClass('hidden');

        // Change total amount of items
        $('[data-compare-total]').html(data.count);

        // Add page link if total items greater then 0
        if (data.count > 0)
          $('[data-compare-removeclass]').removeClass(linkClass);
      }
    }
  });

});