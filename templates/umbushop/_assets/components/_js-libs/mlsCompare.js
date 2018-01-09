;(function($){
  $.mlsCompare = {
    productsEqualHeight: function rowsEqualHeight () {
      var rows = Array.prototype.slice.call(document.querySelectorAll('[data-compare-category]'));
      rows.forEach(function (item) {
        var cols = Array.prototype.slice.call(item.querySelectorAll('[data-compare-product]'));
        var colsHeights = cols.map(function (item) {
          //reset element height after previous calculation
          item.style.height = 'auto';
          return item.getBoundingClientRect().height;
        });
        var maxHeight = colsHeights.reduce(function (prev, item) {
          return Math.max(prev, item);
        });
        cols.forEach(function (item) {
          item.style.height = maxHeight+"px";
        });
        $('[data-compare-category]').removeAttr('data-loader-frame').find('.spinner-circle').remove();
      }.bind(this));
    }
  }
})(jQuery);

