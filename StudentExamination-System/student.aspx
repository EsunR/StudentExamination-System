<%@ Page Language="C#" AutoEventWireup="true" CodeFile="student.aspx.cs" Inherits="student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>学生界面</title>
    <link rel="stylesheet" type="text/css" href="css/student.css"/>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
    <script type="text/javascript" src="js/student.js" ></script>
</head>
<body>
<form id="form1" runat="server">
    <!--顶部栏-->
    <div id="topbar">
        <span id="title">学生登录界面</span>
        <div id="user_box">
            <a href="manager.aspx"><img src="img/user.png"/></a>
            <a href="login.aspx"><span>登出</span></a>
        </div>
    </div>

    <!--主体-->
    <div id="main_box" class="clear">
        <div id="main_box_title">当前可用的试卷</div>
        <div class="test_box clear md">
            <div class="test_title">数据结构</div>
            <div class="test_label">难度：</div>
            <span class="test_nandu">中等</span>
            <div class="test_label">分数：</div>
            <span class="test_score">100</span>
        </div>
    </div>

</form>
</body>
</html>
