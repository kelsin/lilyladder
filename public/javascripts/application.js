// Init
$(function() {
    $('.preferences p.edit').show();
    $('.preferences p.edit').click(function() {
        $('.preferences p.bnet_name').hide();
        $('.preferences p.bnet_code').hide();
        $('.preferences p.race').hide();
        $('.preferences form').show();
        $('.preferences p.edit').hide();
        return false;
    });

    $('#cancel_account_preferences').click(function() {
        $('.preferences p.bnet_name').show();
        $('.preferences p.bnet_code').show();
        $('.preferences p.race').show();
        $('.preferences form').hide();
        $('.preferences p.edit').show();
        return false;
    });

    $('.preferences form').hide();
});
