<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/login.css"/>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
    <script type="text/javascript" src="js/login.js" ></script>
    <script>
        //登录信息验证
        var login_verify = function () {
            $(".login_verify").click(function () {
                var return_val = true;
                $(this).siblings("input").each(function () {
                    $(this).css("border", "2px solid rgba(0,0,0,0.2)");
                    if ($(this).val() == "") {
                        $(this).css("border", "2px solid red");
                        return_val = false;
                    }
                })
                return return_val;
            })
        }

        //注册信息验证
        var register_verify = function () {
            $(".register_btn").click(function () {
                var return_val = true;
                var wrong = 0;
                var psw = $(this).siblings(".information_box").children(".psw");
                if (psw.eq(0).val() != psw.eq(1).val()) {
                    psw.css("border-color", "red");
                    wrong = 2;
                    return_val = false;
                }
                else {
                    $(this).siblings(".information_box").children("input").each(function () {
                        $(this).css("border-color", "initial");
                        if ($(this).val() == "") {
                            $(this).css("border-color", "red");
                            wrong = 1;
                            return_val = false;
                        }
                    })
                }
                switch (wrong) {
                    case 0:
                        break;
                    case 1:
                        alert("信息填写不完整！");
                        break;
                    case 2:
                        alert("两次输入的密码不一致！");
                        break;
                }
                return return_val;
            })
        }
    </script>
</head>
<body>
<form id="form1" runat="server">
    <div id="main_box">
        <img id="banner" src="img/login_banner.jpg"/>
        <div id="panel_box">
            <!--学生登录窗体-->
            <div id="student" class="panel" style="display: block">
                <span class="title" style="margin-top: 45px">学生学号</span>
                <asp:TextBox ID="stu_id" CssClass="textbox" runat="server"></asp:TextBox>
                <span class="title"> 密码</span>
                <asp:TextBox ID="stu_psw" CssClass="textbox" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                <asp:Button ID="stu_login" CssClass="login_btn login_verify" runat="server" Text="登录" OnClick="stu_login_Click" />
            </div>
            <!--教师登录窗体-->
            <div id="teacher" class="panel">
                <span class="title" style="margin-top: 45px">教师工号</span>
                <asp:TextBox ID="teacher_id" CssClass="textbox" runat="server"></asp:TextBox>
                <span class="title"> 密码</span>
                <asp:TextBox ID="teacher_psw" CssClass="textbox" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                <asp:Button ID="teacher_login" CssClass="login_btn login_verify" runat="server" Text="登录" OnClick="teacher_login_Click" />
            </div>
            <!--管理员登录窗体-->
            <div id="admin" class="panel">
                <span class="title" style="margin-top: 45px">管理员账号</span>
                <asp:TextBox ID="admin_id" CssClass="textbox" runat="server"></asp:TextBox>
                <span class="title"> 密码</span>
                <asp:TextBox ID="admin_psw" CssClass="textbox" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                <asp:Button ID="admin_login" CssClass="login_btn login_verify" runat="server" Text="登录" OnClick="admin_login_Click" />
            </div>
            <!--注册窗体-->
            <div id="register" class="panel">
                <div id="register_indentiy" class="clear">
                    <span>请 选 择 注 册 身 份</span>
                    <div class="register_indentity_btn register_indentity_btn_selected">学生</div>
                    <div class="register_indentity_btn">教师</div>
                    <div class="register_indentity_btn">管理员</div>
                </div>
                <div id="stu_register" class="information" style="display: block;">
                    <div class="information_box clear">
                        <span class="re_title">学生学号</span>
                        <asp:TextBox ID="re_stu_id" CssClass="re_textbox" runat="server"></asp:TextBox>
                        <span class="re_title">密 码</span>
                        <asp:TextBox ID="re_stu_psw" CssClass="re_textbox psw" runat="server"></asp:TextBox>

                        <span class="re_title">确认密码</span>
                        <asp:TextBox ID="re_stu_repsw" CssClass="re_textbox psw" runat="server"></asp:TextBox>

                        <span class="re_title">名 字</span>
                        <asp:TextBox ID="re_stu_name" CssClass="re_textbox" runat="server"></asp:TextBox>

                        <span class="re_title">性 别</span>
                        <asp:TextBox ID="re_stu_sex" CssClass="re_textbox" runat="server"></asp:TextBox>

                        <span class="re_title">手机号</span>
                        <asp:TextBox ID="re_stu_phone" CssClass="re_textbox" runat="server"></asp:TextBox>

                        <span class="re_title">入学时间</span>
                        <asp:TextBox ID="re_stu_time" CssClass="re_textbox" runat="server"></asp:TextBox>

                        <span class="re_title">所在班级</span>
                        <asp:TextBox ID="re_stu_class" CssClass="re_textbox" runat="server"></asp:TextBox>
                    </div>
                    <asp:Button ID="re_stu_btn" CssClass="login_btn register_btn" runat="server" Text="注册" OnClick="re_stu_btn_Click" />
                </div>

                <div id="teacher_register" class="information">
                    <div class="information_box clear">
                        <span class="re_title">教师工号</span>
                        <asp:TextBox ID="re_teacher_id" CssClass="re_textbox" runat="server"></asp:TextBox>
                        <span class="re_title">密 码</span>
                        <asp:TextBox ID="re_teacher_psw" CssClass="re_textbox psw" runat="server"></asp:TextBox>

                        <span class="re_title">确认密码</span>
                        <asp:TextBox ID="re_teacher_repsw" CssClass="re_textbox psw" runat="server"></asp:TextBox>

                        <span class="re_title">名 字</span>
                        <asp:TextBox ID="re_teacher_name" CssClass="re_textbox" runat="server"></asp:TextBox>

                        <span class="re_title">性 别</span>
                        <asp:TextBox ID="re_teacher_sex" CssClass="re_textbox" runat="server"></asp:TextBox>

                        <span class="re_title">手机号</span>
                        <asp:TextBox ID="re_teacher_phone" CssClass="re_textbox" runat="server"></asp:TextBox>

                        <span class="re_title">入教时间</span>
                        <asp:TextBox ID="re_teacher_time" CssClass="re_textbox" runat="server"></asp:TextBox>
                    </div>
                    <asp:Button ID="re_teacher_btn" CssClass="login_btn register_btn" runat="server" Text="注册" OnClick="re_teacher_btn_Click" />
                </div>

                <div id="admin_register" class="information">
                    <div class="information_box clear">
                        <span class="re_title">管理员账号</span>
                        <asp:TextBox ID="re_admin_id" CssClass="re_textbox" runat="server"></asp:TextBox>
                        <span class="re_title">密 码</span>
                        <asp:TextBox ID="re_admin_psw" CssClass="re_textbox psw" runat="server"></asp:TextBox>

                        <span class="re_title">确认密码</span>
                        <asp:TextBox ID="re_admin_repsw" CssClass="re_textbox psw" runat="server"></asp:TextBox>

                        <span class="re_title">名 字</span>
                        <asp:TextBox ID="re_admin_name" CssClass="re_textbox" runat="server"></asp:TextBox>

                        <span class="re_title">性 别</span>
                        <asp:TextBox ID="re_admin_sex" CssClass="re_textbox" runat="server"></asp:TextBox>

                        <span class="re_title">手机号</span>
                        <asp:TextBox ID="re_admin_phone" CssClass="re_textbox" runat="server"></asp:TextBox>

                    </div>
                    <asp:Button ID="re_admin_btn" CssClass="login_btn register_btn" runat="server" Text="注册" OnClick="re_admin_btn_Click" />
                </div>

            </div>
            
        </div>
        <div id="select_btn_box">
            <div id="s_stu" class="select_btn selected_btn">学生登录</div>
            <div id="s_teacher" class="select_btn">教师登录</div>
            <div id="s_admin" class="select_btn">管理员登录</div>
            <div id="s_register" style="border:none; width: 200px;" class="select_btn">注 &nbsp 册</div>
        </div>
    </div>
</form>
</body>
</html>
