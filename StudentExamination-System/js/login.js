$(function () {
    //点击选择面板
    var i = 0;
    $(".select_btn").each(function () {
        this.panel = i;
        i++;
    })
    $(".select_btn").click(function () {
        $(".select_btn").each(function () {
            $(this).removeClass("selected_btn");
        });
        $(this).addClass("selected_btn");
        $(".panel").each(function () {
            $(this).css("display", "none");
        })
        $(".panel")[this.panel].style.display = "block";
    })

    //注册选择注册身份
    var i = 0;
    $(".register_indentity_btn").each(function () {
        this.index = i;
        i++;
    })
    $(".register_indentity_btn").click(function () {
        $(".register_indentity_btn").each(function () {
            $(this).removeClass("register_indentity_btn_selected");
        })
        $(this).addClass("register_indentity_btn_selected");
        $(".information").each(function () {
            $(this).css("display", "none");
        })
        $(".information")[this.index].style.display = "block";
    })

    //验证信息
    
})