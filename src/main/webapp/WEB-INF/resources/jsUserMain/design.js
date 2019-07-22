$(document).ready(function(){
    /* nav */
    $(".btn_menu, .nav_mask, .btn_leftMenu_close").click(function(){
        $(".nav_wrap").toggleClass("on");
        return false;
    });
});

function popClose(){
    parent.$.fancybox.close();
}