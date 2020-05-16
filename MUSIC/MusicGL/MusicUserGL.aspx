<%@ Page Title="" Language="C#" MasterPageFile="~/HouTai.Master" AutoEventWireup="true" CodeBehind="MusicUserGL.aspx.cs" Inherits="MUSIC.MusicGL.MusicUserGL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table tr td,table tr th{
            border:1px solid black;
            text-align:center;
            height:40px;
        }
        table{
            border-collapse:collapse;
            padding:0;
        }
        table tr th{
            background-color:lightslategray;
        }
        .drop{
            width:65px;
            height:20px;
            border-radius:4px;
        }
        .roleupd{
            width:55px;
            height:20px;
            background-color:dodgerblue;
            border-radius:4px;
            border:0;
            color:white;
        }
        .statu{
            width:100px;
            height:25px;
            color:black;
            background-color:darkgray;
            border-radius:5px;
            text-align:center;
            margin-left:5%;
        }
        .bbbbb{
            color:black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="paneltypes" runat="server">
        <div>
            <div style="margin-top:15px;">
                <span>后台管理》用户管理</span>
            </div>
            <br />
            <hr />
            <br />
            <table>
                <thead>
                    <tr>
                        <th style="width:70px;height:40px">编号</th>
                        <th style="width:140px;height:40px">登录账号</th>
                        <th style="width:140px;height:40px">用户姓名</th>
                        <th style="width:140px;height:40px">联系电话</th>
                        <th style="width:140px;height:40px">用户状态</th>
                        <th style="width:140px;height:40px">注册日期</th>
                        <th style="width:140px;height:40px">所属角色</th>
                        <th style="width:140px;height:40px">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server" >
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("UserId")%></td>
                                <td><%# Eval("LoginId")%></td>
                                <td><%# Eval("UserName")%></td>
                                <td><%# Eval("Phone")%></td>
                                <td>
                                    <%# Convert.ToInt32(Eval("UserStatus"))==1?"启用":"禁用" %>
                                </td>
                                <td><%# Eval("DateCreated","{0:D}")%></td>
                                <td>
                                    <asp:DropDownList ID="droprole" runat="server" CssClass="drop" ></asp:DropDownList>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="roleupd" CommandArgument='<%# Eval("UserId")%>' OnCommand="LinkButton1_Command">更改</asp:LinkButton>
                                </td>
                                <td>
                                    <div class="statu">
                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="bbbbb" CommandArgument='<%# Eval("UserId")%>' Visible='<%# Convert.ToInt32(Eval("RoleId")) == 1 ? false : true %>' OnCommand="LinkButton2_Command"><%# Convert.ToInt32(Eval("UserStatus")) == 1 ? "禁用":"启用" %></asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>          
        </div>
    </asp:Panel>
</asp:Content>
