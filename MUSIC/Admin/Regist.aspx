<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Regist.aspx.cs" Inherits="MUSIC.Admin.Regist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../CSS/login.css" rel="stylesheet" />
    <link href="../CSS/input.css" rel="stylesheet" />
    <style>
        .btnl{
            border:0;
            background-color:blueviolet;
            border-radius:7px;
            color:white;
            width:80px;
            height:35px;
        }
        .btnr{
            border:0;
            background-color:lightgray;
            border-radius:7px;
            color:black;
            width:80px;
            height:35px;
            margin-left:20px;
        }
        .h1{
            color:purple
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
                <div class="login" style="margin-left:65%" >          
                <h1 class="h1">在线音乐商店</h1>
                <br />
                <asp:Label ID="Label1" runat="server" Text="登录账号："></asp:Label>
                <br />
                <asp:TextBox ID="txtusername" runat="server" CssClass="label-input"></asp:TextBox>
                <br />
                <asp:Label ID="Label2" runat="server" Text="登录密码："></asp:Label>
                <br />
                <asp:TextBox ID="txtuserpwd" runat="server" CssClass="label-input" TextMode="Password"></asp:TextBox>
                <br />
                <asp:Label ID="Label3" runat="server" Text="确认密码："></asp:Label>
                <br />
                <asp:TextBox ID="txtpwdagin" runat="server" CssClass="label-input" TextMode="Password"></asp:TextBox>
                <br />
                <asp:Label ID="Label4" runat="server" Text="用户姓名："></asp:Label>
                <br />
                <asp:TextBox ID="txtname" runat="server" CssClass="label-input"></asp:TextBox>
                <br />
                <asp:Label ID="Label5" runat="server" Text="联系电话："></asp:Label>
                <br />
                <asp:TextBox ID="txtphone" runat="server" CssClass="label-input"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnlogin" runat="server" Text="注册" CssClass="btnl" OnClick="btnlogin_Click"/>
                <asp:Button ID="btnregist" runat="server" Text="返回"  CssClass="btnr" OnClick="btnregist_Click"/>
                </div>
            </div>
    </form>
</body>
</html>
