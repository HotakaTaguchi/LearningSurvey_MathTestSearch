var flg = "close";
$(function() {
    $("#detail").click(function() {
        $("#search_box").slideToggle();
        document.getElementById('detail').remove();
    });
});
