<%@ Page Title="" Language="C#" MasterPageFile="~/HouTai.Master" AutoEventWireup="true" CodeBehind="MusicOrderGL.aspx.cs" Inherits="MUSIC.MusicGL.MusicOrderGL" %>
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
        .statu2{
            width:100px;
            height:25px;
            color:black;
            background-color:dodgerblue;
            border-radius:5px;
            text-align:center;
            margin-left:5%;
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
        .bbbb{
            color:white;
        }
        .btnblue{
            width:120px;
            height:25px;
            color:white;
            border:0;
            background-color:dodgerblue;
            border-radius:5px;
            text-align:center;
        }
        .btngray{
            width:120px;
            height:25px;
            color:black;
            border:0;
            background-color:darkgray;
            border-radius:5px;
            text-align:center;
        }
        .btncss{
            display:flex;
            justify-content:space-between;
        }
        .mes{
            width:250px;
            height:30px;
            border-radius:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="panlnobuy" runat="server">
        <div>
            <div style="margin-top:15px;">
                <span>后台管理》订单管理</span>
            </div>
            <br />
            <hr />
            <br />
            <div class="btncss">
                <div class="btnblue">
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="bbbb" CommandName="one" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="bbbbb" CommandName="two" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="bbbbb" CommandName="three" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="bbbbb" CommandName="four" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton5" runat="server" CssClass="bbbbb" CommandName="five" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
            </div>
            <br />
            <table>
                <thead>
                    <tr>
                        <th style="width:70px;height:40px">编号</th>
                        <th style="width:140px;height:40px">收货人</th>
                        <th style="width:140px;height:40px">电话</th>
                        <th style="width:140px;height:40px">下单日期</th>
                        <th style="width:140px;height:40px">金额</th>
                        <th style="width:140px;height:40px">状态</th>
                        <th style="width:140px;height:40px">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repeaternobuy" runat="server" >
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("OrderId")%></td>
                                <td><%# Eval("UserName")%></td>
                                <td><%# Eval("Phone")%></td>
                                <td><%# Eval("OrderDate","{0:D}")%></td>
                                <td>￥<%# Eval("Total") %>元</td>
                                <td><%# this.InitStatu((int)Eval("OrderStatus")) %></td>
                                <td>
                                    <div style="display:flex;">
                                    <div class="statu2">
                                        <asp:LinkButton ID="lbtnnobuyxq" runat="server" CssClass="bbbb" CommandArgument='<%# Eval("OrderId")%>' OnCommand="lbtnnobuyxq_Command" >订单详情</asp:LinkButton>
                                    </div>
                                    <div class="statu">
                                        <asp:LinkButton ID="lbtnnobuyzf" runat="server" CssClass="bbbbb" CommandArgument='<%# Eval("OrderId")%>' OnCommand="lbtnnobuyzf_Command" >确认支付</asp:LinkButton>
                                    </div>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>          
        </div>
    </asp:Panel>
    <asp:Panel ID="panlnogive" runat="server" Visible="false">
        <div>
            <div style="margin-top:15px;">
                <span>后台管理》订单管理</span>
            </div>
            <br />
            <hr />
            <br />
            <div class="btncss">
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton6" runat="server" CssClass="bbbbb" CommandName="one" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btnblue">
                    <asp:LinkButton ID="LinkButton7" runat="server" CssClass="bbbb" CommandName="two" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton8" runat="server" CssClass="bbbbb" CommandName="three" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton9" runat="server" CssClass="bbbbb" CommandName="four" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton10" runat="server" CssClass="bbbbb" CommandName="five" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
            </div>
            <br />
            <table>
                <thead>
                    <tr>
                        <th style="width:70px;height:40px">编号</th>
                        <th style="width:140px;height:40px">收货人</th>
                        <th style="width:140px;height:40px">电话</th>
                        <th style="width:140px;height:40px">下单日期</th>
                        <th style="width:140px;height:40px">金额</th>
                        <th style="width:140px;height:40px">状态</th>
                        <th style="width:140px;height:40px">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repeaternogive" runat="server" >
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("OrderId")%></td>
                                <td><%# Eval("UserName")%></td>
                                <td><%# Eval("Phone")%></td>
                                <td><%# Eval("OrderDate","{0:D}")%></td>
                                <td>￥<%# Eval("Total") %>元</td>
                                <td><%# this.InitStatu((int)Eval("OrderStatus")) %></td>
                                <td>
                                    <div style="display:flex;">
                                    <div class="statu2">
                                        <asp:LinkButton ID="lbtnnogivexq" runat="server" CssClass="bbbb" CommandArgument='<%# Eval("OrderId")%>' OnCommand="lbtnnobuyxq_Command">订单详情</asp:LinkButton>
                                    </div>
                                    <div class="statu">
                                        <asp:LinkButton ID="lbtnnogivefh" runat="server" CssClass="bbbbb" CommandArgument='<%# Eval("OrderId")%>' OnCommand="lbtnnogivefh_Command" >确认发货</asp:LinkButton>
                                    </div>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>          
        </div>
    </asp:Panel>
    <asp:Panel ID="panlwait" runat="server" Visible="false">
        <div>
            <div style="margin-top:15px;">
                <span>后台管理》订单管理</span>
            </div>
            <br />
            <hr />
            <br />
            <div class="btncss">
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton11" runat="server" CssClass="bbbbb" CommandName="one" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton12" runat="server" CssClass="bbbbb" CommandName="two" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btnblue">
                    <asp:LinkButton ID="LinkButton13" runat="server" CssClass="bbbb" CommandName="three" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton14" runat="server" CssClass="bbbbb" CommandName="four" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton15" runat="server" CssClass="bbbbb" CommandName="five" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
            </div>
            <br />
            <table>
                <thead>
                    <tr>
                        <th style="width:70px;height:40px">编号</th>
                        <th style="width:140px;height:40px">收货人</th>
                        <th style="width:140px;height:40px">电话</th>
                        <th style="width:140px;height:40px">下单日期</th>
                        <th style="width:140px;height:40px">金额</th>
                        <th style="width:140px;height:40px">状态</th>
                        <th style="width:140px;height:40px">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repeaterwait" runat="server" >
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("OrderId")%></td>
                                <td><%# Eval("UserName")%></td>
                                <td><%# Eval("Phone")%></td>
                                <td><%# Eval("OrderDate","{0:D}")%></td>
                                <td>￥<%# Eval("Total") %>元</td>
                                <td><%# this.InitStatu((int)Eval("OrderStatus")) %></td>
                                <td>
                                    <div class="statu2">
                                        <asp:LinkButton ID="lbtwaitxq" runat="server" CssClass="bbbb" CommandArgument='<%# Eval("OrderId")%>' OnCommand="lbtnnobuyxq_Command">订单详情</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>          
        </div>
    </asp:Panel>
    <asp:Panel ID="panlhave" runat="server" Visible="false">
        <div>
            <div style="margin-top:15px;">
                <span>后台管理》订单管理</span>
            </div>
            <br />
            <hr />
            <br />
            <div class="btncss">
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton16" runat="server" CssClass="bbbbb" CommandName="one" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton17" runat="server" CssClass="bbbbb" CommandName="two" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton18" runat="server" CssClass="bbbbb" CommandName="three" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btnblue">
                    <asp:LinkButton ID="LinkButton19" runat="server" CssClass="bbbb" CommandName="four" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton20" runat="server" CssClass="bbbbb" CommandName="five" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
            </div>
            <br />
            <table>
                <thead>
                    <tr>
                        <th style="width:70px;height:40px">编号</th>
                        <th style="width:140px;height:40px">收货人</th>
                        <th style="width:140px;height:40px">电话</th>
                        <th style="width:140px;height:40px">下单日期</th>
                        <th style="width:140px;height:40px">金额</th>
                        <th style="width:140px;height:40px">状态</th>
                        <th style="width:140px;height:40px">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repeaterhave" runat="server" >
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("OrderId")%></td>
                                <td><%# Eval("UserName")%></td>
                                <td><%# Eval("Phone")%></td>
                                <td><%# Eval("OrderDate","{0:D}")%></td>
                                <td>￥<%# Eval("Total") %>元</td>
                                <td><%# this.InitStatu((int)Eval("OrderStatus")) %></td>
                                <td>
                                    <div class="statu2">
                                        <asp:LinkButton ID="lbthavexq" runat="server" CssClass="bbbb" CommandArgument='<%# Eval("OrderId")%>' OnCommand="lbtnnobuyxq_Command">订单详情</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>          
        </div>
    </asp:Panel>
    <asp:Panel ID="panlremove" runat="server" Visible="false">
        <div>
            <div style="margin-top:15px;">
                <span>后台管理》订单管理</span>
            </div>
            <br />
            <hr />
            <br />
            <div class="btncss">
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton21" runat="server" CssClass="bbbbb" CommandName="one" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton22" runat="server" CssClass="bbbbb" CommandName="two" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton23" runat="server" CssClass="bbbbb" CommandName="three" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btngray">
                    <asp:LinkButton ID="LinkButton24" runat="server" CssClass="bbbbb" CommandName="four" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
                <div class="btnblue">
                    <asp:LinkButton ID="LinkButton25" runat="server" CssClass="bbbb" CommandName="five" OnCommand="LinkButton25_Command"></asp:LinkButton>
                </div>
            </div>
            <br />
            <table>
                <thead>
                    <tr>
                        <th style="width:70px;height:40px">编号</th>
                        <th style="width:140px;height:40px">收货人</th>
                        <th style="width:140px;height:40px">电话</th>
                        <th style="width:140px;height:40px">下单日期</th>
                        <th style="width:140px;height:40px">金额</th>
                        <th style="width:140px;height:40px">状态</th>
                        <th style="width:140px;height:40px">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repeaterremove" runat="server" >
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("OrderId")%></td>
                                <td><%# Eval("UserName")%></td>
                                <td><%# Eval("Phone")%></td>
                                <td><%# Eval("OrderDate","{0:D}")%></td>
                                <td>￥<%# Eval("Total") %>元</td>
                                <td><%# this.InitStatu((int)Eval("OrderStatus")) %></td>
                                <td>
                                    <div class="statu2">
                                        <asp:LinkButton ID="lbtremovexq" runat="server" CssClass="bbbb" CommandArgument='<%# Eval("OrderId")%>' OnCommand="lbtnnobuyxq_Command">订单详情</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>          
        </div>
    </asp:Panel>
    <asp:Panel ID="panlOrderXQ" runat="server" Visible="false">
        <div>
            <div style="margin-top:15px;display:flex;justify-content:space-between;">
                <div>
                    <span>订单管理》订单信息</span>
                </div>
                <div class="btnblue">
                    <asp:LinkButton ID="LinkButton26" runat="server" CssClass="bbbb" OnCommand="LinkButton26_Command">返回</asp:LinkButton>
                </div>
            </div>
            <br />
            <hr />
            <br />
            <asp:TextBox ID="txtdate" runat="server" ReadOnly="true" CssClass="mes"></asp:TextBox>
            <asp:TextBox ID="txtname" runat="server" ReadOnly="true" CssClass="mes"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtaddress" runat="server" ReadOnly="true" CssClass="mes"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtcode" runat="server" ReadOnly="true" CssClass="mes"></asp:TextBox>
            <asp:TextBox ID="txtphone" runat="server" ReadOnly="true" CssClass="mes"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtemail" runat="server" ReadOnly="true" CssClass="mes"></asp:TextBox>
            <br />
            <br />
            <table>
                <thead>
                    <tr>
                        <th style="width:70px;height:40px">音乐</th>
                        <th style="width:140px;height:40px">歌手</th>
                        <th style="width:140px;height:40px">单价</th>
                        <th style="width:140px;height:40px">数量</th>
                        <th style="width:140px;height:40px">小计</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repeater1" runat="server" >
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Albums.Title")%></td>
                                <td><%# this.GetGenreById((int)Eval("Albums.GenreId"))%></td>
                                <td><%# Eval("Albums.Price")%></td>
                                <td><%# Eval("Quantity")%></td>
                                <td>￥<%# this.GetPrice((decimal)Eval("Albums.Price"),(int)Eval("Quantity"))%>元</td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5" style="text-align:right;">订单金额：￥<asp:Label ID="lblsum" runat="server" Text=""></asp:Label></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </asp:Panel>
</asp:Content>
