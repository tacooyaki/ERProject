$(document).on('turbolinks:load', function() {
    $('#order_shipping_address_id').change(function() {
        var addressId = $(this).val();
        $.ajax({
            url: `/orders/update_financials`,
            type: 'POST',
            dataType: 'json',
            data: { order: { shipping_address_id: addressId } },
            headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
            success: function(data) {
                $('#subtotal').text(`$${data.subtotal}`);
                $('#tax').text(`$${data.tax}`);
                $('#total').text(`$${data.total}`);
            },
            error: function(xhr) {
                console.log('Error:', xhr.responseText);
            }
        });
    });
});