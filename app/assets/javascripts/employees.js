// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ajax:success', function() {
    $('#employee-form [role="tab"]').on('click', function(event) {
        var before_tab = $('#employee-form .active');
        var inputs = before_tab.find('input[required], select[required]');

        inputs.each(function(index) {
            if ( $(this).val() === '' ) {
                event.preventDefault();
                event.stopPropagation();
                $(this).addClass('is-invalid');
            }
        });
    })

    $('#employee-form input').keyup(function() {
        if( $(this).hasClass('is-invalid') ) {
            $(this).removeClass('is-invalid');
        }
    });
});