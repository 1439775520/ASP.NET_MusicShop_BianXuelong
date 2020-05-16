using MUSIC.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MUSIC.MusicGL
{
    public partial class MusicOrderGL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RepeaterData();
                BtnData();
            }
        }
        public decimal GetPrice(decimal danjia,int num)
        {
            return danjia * num;
        }

        private void BtnData()
        {
            this.LinkButton1.Text = "未付款("+OrdersManager.GetOrderCountByStatu(0)+")";
            this.LinkButton6.Text = "未付款(" + OrdersManager.GetOrderCountByStatu(0) + ")";
            this.LinkButton11.Text = "未付款(" + OrdersManager.GetOrderCountByStatu(0) + ")";
            this.LinkButton16.Text = "未付款(" + OrdersManager.GetOrderCountByStatu(0) + ")";
            this.LinkButton21.Text = "未付款(" + OrdersManager.GetOrderCountByStatu(0) + ")";

            this.LinkButton2.Text = "未发货(" + OrdersManager.GetOrderCountByStatu(1) + ")";
            this.LinkButton7.Text = "未发货(" + OrdersManager.GetOrderCountByStatu(1) + ")";
            this.LinkButton12.Text = "未发货(" + OrdersManager.GetOrderCountByStatu(1) + ")";
            this.LinkButton17.Text = "未发货(" + OrdersManager.GetOrderCountByStatu(1) + ")";
            this.LinkButton22.Text = "未发货(" + OrdersManager.GetOrderCountByStatu(1) + ")";

            this.LinkButton3.Text = "待收货(" + OrdersManager.GetOrderCountByStatu(2) + ")";
            this.LinkButton8.Text = "待收货(" + OrdersManager.GetOrderCountByStatu(2) + ")";
            this.LinkButton13.Text = "待收货(" + OrdersManager.GetOrderCountByStatu(2) + ")";
            this.LinkButton18.Text = "待收货(" + OrdersManager.GetOrderCountByStatu(2) + ")";
            this.LinkButton23.Text = "待收货(" + OrdersManager.GetOrderCountByStatu(2) + ")";

            this.LinkButton4.Text = "已收货(" + OrdersManager.GetOrderCountByStatu(3) + ")";
            this.LinkButton9.Text = "已收货(" + OrdersManager.GetOrderCountByStatu(3) + ")";
            this.LinkButton14.Text = "已收货(" + OrdersManager.GetOrderCountByStatu(3) + ")";
            this.LinkButton19.Text = "已收货(" + OrdersManager.GetOrderCountByStatu(3) + ")";
            this.LinkButton24.Text = "已收货(" + OrdersManager.GetOrderCountByStatu(3) + ")";

            this.LinkButton5.Text = "已退货(" + OrdersManager.GetOrderCountByStatu(4) + ")";
            this.LinkButton10.Text = "已退货(" + OrdersManager.GetOrderCountByStatu(4) + ")";
            this.LinkButton15.Text = "已退货(" + OrdersManager.GetOrderCountByStatu(4) + ")";
            this.LinkButton20.Text = "已退货(" + OrdersManager.GetOrderCountByStatu(4) + ")";
            this.LinkButton25.Text = "已退货(" + OrdersManager.GetOrderCountByStatu(4) + ")";
        }

        private void RepeaterData()
        {
            this.repeaternobuy.DataSource = OrdersManager.GetOrderByStatu(0);
            this.repeaternobuy.DataBind();
            this.repeaternogive.DataSource = OrdersManager.GetOrderByStatu(1);
            this.repeaternogive.DataBind();
            this.repeaterwait.DataSource = OrdersManager.GetOrderByStatu(2);
            this.repeaterwait.DataBind();
            this.repeaterhave.DataSource = OrdersManager.GetOrderByStatu(3);
            this.repeaterhave.DataBind();
            this.repeaterremove.DataSource = OrdersManager.GetOrderByStatu(4);
            this.repeaterremove.DataBind();
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            ((HyperLink)Master.FindControl("hlinkmuisctypegl")).NavigateUrl = "~/MusicGL/MusicTypeGL.aspx";
            ((HyperLink)Master.FindControl("hlinkmuiscgl")).NavigateUrl = "~/MusicGL/MusicSongGL.aspx";
            ((HyperLink)Master.FindControl("hlinkrolegl")).NavigateUrl = "~/MusicGL/MusicRoleGL.aspx";
            ((HyperLink)Master.FindControl("hlinkordergl")).NavigateUrl = "~/MusicGL/MusicOrderGL.aspx";
            //((HyperLink)Master.FindControl("hlinktype")).Text = Session["username"].ToString();
        }

        public void BtnNoBuyClick()
        {
            this.panlnobuy.Visible = true;
            this.panlnogive.Visible = false;
            this.panlwait.Visible = false;
            this.panlhave.Visible = false;
            this.panlremove.Visible = false;
        }
        public void BtnNoGiveClick()
        {
            this.panlnobuy.Visible = false;
            this.panlnogive.Visible = true;
            this.panlwait.Visible = false;
            this.panlhave.Visible = false;
            this.panlremove.Visible = false;
        }
        public void BtnWaitClick()
        {
            this.panlnobuy.Visible = false;
            this.panlnogive.Visible = false;
            this.panlwait.Visible = true;
            this.panlhave.Visible = false;
            this.panlremove.Visible = false;
        }
        public void BtnHaveClick()
        {
            this.panlnobuy.Visible = false;
            this.panlnogive.Visible = false;
            this.panlwait.Visible = false;
            this.panlhave.Visible = true;
            this.panlremove.Visible = false;
        }
        public void BtnRemoveClick()
        {
            this.panlnobuy.Visible = false;
            this.panlnogive.Visible = false;
            this.panlwait.Visible = false;
            this.panlhave.Visible = false;
            this.panlremove.Visible = true;
        }

        public void BtnOrderXQClick()
        {
            this.panlnobuy.Visible = false;
            this.panlnogive.Visible = false;
            this.panlwait.Visible = false;
            this.panlhave.Visible = false;
            this.panlremove.Visible = false;
            panlOrderXQ.Visible = true;
        }

        public string InitStatu(int id) 
        {
            string returnStr = "";
            switch (id)
            {
                case 0:
                    returnStr = "未付款";
                    break;
                case 1:
                    returnStr = "未发货";
                    break;
                case 2:
                    returnStr = "待收货";
                    break;
                case 3:
                    returnStr = "已收货";
                    break;
                case 4:
                    returnStr = "已退货";
                    break;
            }
            return returnStr;
        }

        protected void LinkButton25_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "one")
            {
                BtnNoBuyClick();
            }else if (e.CommandName == "two")
            {
                BtnNoGiveClick();
            }
            else if (e.CommandName == "three")
            {
                BtnWaitClick();
            }
            else if (e.CommandName == "four")
            {
                BtnHaveClick();
            }
            else
            {
                BtnRemoveClick();
            }
        }

        protected void lbtnnobuyzf_Command(object sender, CommandEventArgs e)
        {
            if (OrdersManager.UpdOrderStatuByOrderId(int.Parse(e.CommandArgument.ToString()), 1))
            {
                Response.Write("<script>alert('支付成功');</script>");
                RepeaterData();
                BtnData();
            }
            else
            {
                Response.Write("<script>alert('支付失败');</script>");
                RepeaterData();
                BtnData();
            }
        }

        protected void lbtnnogivefh_Command(object sender, CommandEventArgs e)
        {
            if (OrdersManager.UpdOrderStatuByOrderId(int.Parse(e.CommandArgument.ToString()), 2))
            {
                Response.Write("<script>alert('发货成功');</script>");
                RepeaterData();
                BtnData();
            }
            else
            {
                Response.Write("<script>alert('发货失败');</script>");
                RepeaterData();
                BtnData();
            }
        }
        
        protected void lbtnnobuyxq_Command(object sender, CommandEventArgs e)
        {
            BtnOrderXQClick();
            var detail = OrderDateilsManager.GetByOrderId(int.Parse(e.CommandArgument.ToString()));
            this.txtname.Text = "收货人：" + detail[0].Orders.Username;
            this.txtdate.Text = "下单日期："+detail[0].Orders.OrderDate;
            this.txtaddress.Text = "收货地址："+detail[0].Orders.Address;
            this.txtcode.Text = "邮政编码：" + detail[0].Orders.PostalCode;
            this.txtphone.Text = "联系电话："+detail[0].Orders.Phone;
            this.txtemail.Text = "电子邮件：" + detail[0].Orders.Email;
            this.repeater1.DataSource = detail;
            this.repeater1.DataBind();
            this.lblsum.Text = detail[0].Orders.Total.ToString();
        }

        protected void LinkButton26_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("MusicOrderGL.aspx");
        }
        public string GetGenreById(int id)
        {
            return GenresManager.GetGenreById(id).Name;
        }
    }
}