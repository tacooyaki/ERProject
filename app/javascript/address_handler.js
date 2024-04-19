$(document).on('turbolinks:load', function() {
    $('#order_shipping_address_id').change(function() {
        var addressId = $(this).val();
        $.ajax({
            url: `/orders/${addressId}/update_financials`,
            type: 'POST',
            dataType: 'json',  // Expecting JSON response
            data: { order: { shipping_address_id: addressId } },
            headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
            success: function(response) {
                // Assuming response contains fields like { subtotal: ..., tax: ..., total: ... }
                $('#subtotal').text(`$${response.subtotal.toFixed(2)}`);
                $('#tax').text(`$${response.tax.toFixed(2)}`);
                $('#total').text(`$${response.total.toFixed(2)}`);
            },
            error: function(error) {
                console.error('Failed to update financials:', error);
            }
        });
    });
});
