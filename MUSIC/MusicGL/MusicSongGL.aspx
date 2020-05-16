<%@ Page Title="" Language="C#" MasterPageFile="~/HouTai.Master" AutoEventWireup="true" CodeBehind="MusicSongGL.aspx.cs" Inherits="MUSIC.MusicGL.MusicSongGL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../JS/jquery-3.4.1.min.js"></script>
    <style>
        .btndel{
            width:60px;
            height:30px;
            border-radius:5px;
            background-color:lightgray;
            color:black;
            border:0;
            text-align:center;
        }
        .btnupd{
            width:60px;
            height:30px;
            border-radius:5px;
            background-color:dodgerblue;
            color:white;
            border:0;
            text-align:center;
        }
        .btnadd{
            width:120px;
            height:30px;
            background-color:dodgerblue;
            border-radius:5px;
            color:white;
            border:0;
            text-align:center;margin-left:50%;
        }
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
        .lbtn1css{
            color:white;
            margin-top:10px;
        }
        .lbtn2css{
            color:black;
            margin-top:10px;
        }
        .txtmes{
            width:300px;
            height:40px;
            border-radius:10px;
        }
        .juli{
            margin-left:50%;
        }
        .big{
            display:flex;
            justify-content:space-around;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="paneltypes" runat="server">
        <div>
            <div style="margin-top:15px;">
                <span>后台管理》音乐管理</span>
                <asp:Button ID="btnadd" runat="server" Text="添加音乐类型" CssClass="btnadd" OnClick="btnadd_Click" />
            </div>
            <br />
            <hr />
            <br />
            <table>
                <thead>
                    <tr>
                        <th style="width:70px;height:40px">编号</th>
                        <th style="width:140px;height:40px">音乐名称</th>
                        <th style="width:140px;height:40px">类型名称</th>
                        <th style="width:140px;height:40px">歌手名称</th>
                        <th style="width:140px;height:40px">音乐价格</th>
                        <th style="width:140px;height:40px">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("AlbumId")%></td>
                                <td><%# Eval("Title")%></td>
                                <td><%# Eval("Artists.Name")%></td>
                                <td><%# Eval("Genres.Name")%></td>
                                <td>￥<%# Eval("Price")%></td>
                            <td>
                                <div style="display:flex;justify-content:space-around;">
                                    <div class="btnupd">
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="lbtn1css" OnCommand="LinkButton1_Command" CommandArgument='<%# Eval("AlbumId")%>'>编辑</asp:LinkButton>
                                    </div>
                                    <div class="btndel">
                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="lbtn2css" CommandArgument='<%# Eval("AlbumId")%>' OnClientClick="return confirm('确定删除吗？')" OnCommand="LinkButton2_Command">删除</asp:LinkButton>
                                    </div> 
                                </div>                                                             
                            </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="6">
                            每页<asp:Label ID="lblone" runat="server" Text=""></asp:Label>条/共<asp:Label ID="lblsum" runat="server" Text=""></asp:Label>条  
                            第<asp:Label ID="lblpage" runat="server" Text=""></asp:Label>页/共<asp:Label ID="lblpages" runat="server" Text=""></asp:Label>页
                            <asp:HyperLink ID="hlfirst" runat="server" CssClass="btndel">首页</asp:HyperLink>
                            <asp:HyperLink ID="hlprev" runat="server" CssClass="btndel">上页</asp:HyperLink>
                            <asp:HyperLink ID="hlnext" runat="server" CssClass="btndel">下页</asp:HyperLink>
                            <asp:HyperLink ID="hllast" runat="server" CssClass="btndel">末页</asp:HyperLink>
                        </td>
                    </tr>
                </tfoot>
            </table>          
        </div>
    </asp:Panel>
    <asp:Panel ID="paneladd" runat="server" Visible="false">
        <div>
            <div style="margin-top:15px;">
                <span>音乐管理》添加音乐</span>
                <asp:Button ID="btnreturn" runat="server" Text="返回" CssClass="btnupd juli" OnClick="btnreturn_Click" />
                <asp:Button ID="btnyes" runat="server" Text="保存" CssClass="btndel" OnClick="btnyes_Click" />
            </div>
            <br />
            <hr />
            <br />
            <div class="big">
                <div>
                    <asp:Label ID="Label1" runat="server" Text="音乐名称："></asp:Label> 
                    <br />
                    <asp:TextBox ID="txtalbumname" runat="server" CssClass="txtmes"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="歌手名称："></asp:Label> 
                    <br />
                    <asp:DropDownList ID="dropgenre" runat="server" CssClass="txtmes"></asp:DropDownList>
                </div>
                <div>
                    <asp:Label ID="Label4" runat="server" Text="类型名称："></asp:Label> 
                    <br />
                    <asp:DropDownList ID="droptype" runat="server" CssClass="txtmes"></asp:DropDownList>
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="价格："></asp:Label> 
                    <br />
                    <asp:TextBox ID="txtprice" runat="server" CssClass="txtmes"></asp:TextBox>
                </div>
            </div>
            <div style="margin-left:10%">
            <asp:Label ID="Label6" runat="server" Text="音乐图片："></asp:Label> 
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="Button1" runat="server" Text="预览" OnClick="Button1_Click" />
            <br />
            <asp:Image ID="Image1" runat="server" Width="600" Height="250" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="panelupd" runat="server" Visible="false">
        <div>
            <div style="margin-top:15px;">
                <span>音乐管理》编辑音乐</span>
                <asp:Button ID="btnupdreturn" runat="server" Text="返回" CssClass="btnupd juli" OnClick="btnupdreturn_Click" />
                <asp:Button ID="btnupdyes" runat="server" Text="保存" CssClass="btndel" OnClick="btnupdyes_Click" />
            </div>
            <br />
            <hr />
            <br />
            <div class="big">
                <div>
                    <asp:Label ID="Label2" runat="server" Text="音乐名称："></asp:Label> 
                    <br />
                    <asp:TextBox ID="txtmusicname" runat="server" CssClass="txtmes"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="歌手名称："></asp:Label> 
                    <br />
                    <asp:DropDownList ID="dropsingername" runat="server" CssClass="txtmes"></asp:DropDownList>
                </div>
                <div>
                    <asp:Label ID="Label8" runat="server" Text="类型名称："></asp:Label> 
                    <br />
                    <asp:DropDownList ID="dropsongtype" runat="server" CssClass="txtmes"></asp:DropDownList>
                    <br />
                    <asp:Label ID="Label9" runat="server" Text="价格："></asp:Label> 
                    <br />
                    <asp:TextBox ID="txtsongprice" runat="server" CssClass="txtmes"></asp:TextBox>
                </div>
            </div>
            <div style="margin-left:10%">
            <asp:Label ID="Label10" runat="server" Text="音乐图片："></asp:Label> 
            <br />
            <asp:FileUpload ID="FileUpload2" runat="server" />
            <asp:Button ID="Button2" runat="server" Text="预览" OnClick="Button2_Click" />
            <br />
            <asp:Image ID="Image2" runat="server" Width="600" Height="250" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
