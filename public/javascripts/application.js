// Init
$(function() {
    $('.race_preference p.edit').show();
    $('.race_preference p.edit').click(function() {
        $('.race_preference p.race').hide();
        $('.race_preference form').show();
        $('.race_preference p.edit').hide();
        return false;
    });

    $('#cancel_account_race_preference').click(function() {
        $('.race_preference p.race').show();
        $('.race_preference form').hide();
        $('.race_preference p.edit').show();
        return false;
    });

    $('.race_preference select').change(function() {
        $('.race_preference form').submit();
    });

    $('.race_preference form').hide();
});
