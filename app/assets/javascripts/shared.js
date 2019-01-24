

$(document).on('turbolinks:load', function() {
    $('#modal-form').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var header = button.data('header');
        var size = button.data('size');
        var modal = $(this);
        modal.find('.modal-title').text(header);
        modal.find('.modal-dialog').addClass(size);
    })
});

$(document).on('ajax:success', function() {
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy',
        language: 'pt-BR',
        autoclose: true,
        todayHighlight: true
    });

    $('.cep').mask('00000-000');
    $('.phone').mask('(00) 00000-0000');
    $('.rg').mask('0.000.000-0', {reverse: true});
    $('.cpf').mask('000.000.000-00', {reverse: true});
    $('.cnpj').mask('00.000.000/0000-00', {reverse: true});
    $('.money').mask('000.000.000.000.000,00', {reverse: true});
    $('.pis').mask('000.00000.00-0', {reverse: true});
    $('.pis-number').mask('0000000', {reverse: true});
    $('.pis-series').mask('0000', {reverse: true});
    $('.uf').mask('AA');
    $('.address-number').mask('000000');

    $('#modal-form').modal('hide')
});


