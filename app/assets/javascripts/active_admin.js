//= require active_admin/base
$( document ).ready(function() {
$('.has_many_container').on('change', "select[name*='order[order_details_attributes][']", function() {
  var currentValue = $(this).find('option:selected');
  var total_units = currentValue.text().match(/total units=\((.*?)\)/)[1]
  var per_price = currentValue.text().match(/MRP per unit=\((.*?)\)/)[1]

  $(this).closest('li').next('li').find('[name*="order[order_details_attributes]["]').val(total_units);
  $(this).closest('li').next('li').next('li').find('[name*="order[order_details_attributes]["]').val(per_price);
  $(this).closest('li').next('li').next('li').find('[name*="order[order_details_attributes]["]').val(per_price);
  var price = total_units * per_price
  $(this).closest('li').next('li').next('li').next('li').next('li').find('[name*="order[order_details_attributes]["]').val(price);
  calculateTotalPrice();
});

  $('.has_many_container').on('input', "input[name*='order[order_details_attributes][']", function() {
    var currentValue = parseFloat($(this).val());
    var per_price = parseFloat($(this).closest('li').prev('li').text().match(/MRP per unit=\((.*?)\)/)[1])
    var price = currentValue * per_price;
    $(this).closest('li').next('li').next('li').next('li').find('[name*="order[order_details_attributes]["]').val(price);
    calculateTotalPrice();
  });

  function calculateTotalPrice() {
    var medicines = $('.has_many_fields').length;
    var total = 0;
    for ( var i = 0; i < medicines; i++ ) {
      total = parseFloat(total) + parseFloat($('#order_order_details_attributes_'+i+'_price').val());
    }
    $('#order_total').val(total);
    }
});
