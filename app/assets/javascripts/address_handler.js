$(document).on('turbolinks:load', function() {
    $('#order_shipping_address_id').change(function() {
        var addressId = $(this).val();
        $.ajax({
            url: `/orders/${addressId}/update_financials`,
            type: 'POST',
            dataType: 'script',
            data: { order: { shipping_address_id: addressId } },
            headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
        });
    });
});
