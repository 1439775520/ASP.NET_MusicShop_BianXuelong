using MUSIC.BLL;
using MUSIC.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MUSIC.MusicGL
{
    public partial class MusicUserGL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Repeater1.DataSource = UsersManager.GetAllUser();
                this.Repeater1.DataBind();
                for (int i = 0; i < Repeater1.Items.Count; i++)
                {
                    DropDownList ddl = (DropDownList)Repeater1.Items[i].FindControl("droprole");
                    ddl.DataSource = RolesManager.GetAllRole();
                    ddl.DataTextField = "Name";
                    ddl.DataValueField = "RoleId";
                    ddl.DataBind();
                    ddl.SelectedValue = UsersManager.GetAllUser()[i].RoleId.ToString();                    
                }
            }
        }
        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            ((HyperLink)Master.FindControl("hlinkmuisctypegl")).NavigateUrl = "~/MusicGL/MusicTypeGL.aspx";
            ((HyperLink)Master.FindControl("hlinkmuiscgl")).NavigateUrl = "~/MusicGL/MusicSongGL.aspx";
            ((HyperLink)Master.FindControl("hlinkrolegl")).NavigateUrl = "~/MusicGL/MusicRoleGL.aspx";
            ((HyperLink)Master.FindControl("hlinkordergl")).NavigateUrl = "~/MusicGL/MusicOrderGL.aspx";
            ((HyperLink)Master.FindControl("hlinktype")).Text = Session["username"].ToString();
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            int uindex = 0;
            for (int i = 0; i < UsersManager.GetAllUser().Count; i++)
            {
                if (UsersManager.GetAllUser()[i].UserId == int.Parse(e.CommandArgument.ToString()))
                {
                    uindex = i;
                }
            }
            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                if (i == uindex)
                {
                    DropDownList ddl = this.Repeater1.Items[i].FindControl("droprole") as DropDownList;
                    if (UsersManager.UpdUser(int.Parse(ddl.SelectedItem.Value), int.Parse(e.CommandArgument.ToString())))
                    {
                        Response.Write("<script>alert('修改成功');window.location.href='MusicUserGL.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('修改失败');window.location.href='MusicUserGL.aspx';</script>");
                    }
                }
            }           
        }

        protected void LinkButton2_Command(object sender, CommandEventArgs e)
        {
            int uindex = 0;
            for (int i = 0; i < UsersManager.GetAllUser().Count; i++)
            {
                if (UsersManager.GetAllUser()[i].UserId == int.Parse(e.CommandArgument.ToString()))
                {
                    uindex = i;
                }
            }
            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                if (i == uindex)
                {                    
                    if (UsersManager.GetById(int.Parse(e.CommandArgument.ToString())).UserStatus==0)
                    {
                        if (UsersManager.UpdUserStatu(1, int.Parse(e.CommandArgument.ToString())))
                        {
                            Response.Write("<script>alert('启用成功');window.location.href='MusicUserGL.aspx';</script>");
                            return;
                        }
                        else
                        {
                            Response.Write("<script>alert('启用失败');window.location.href='MusicUserGL.aspx';</script>");
                            return;
                        }
                    }
                    else
                    {
                        if (UsersManager.UpdUserStatu(0, int.Parse(e.CommandArgument.ToString())))
                        {
                            Response.Write("<script>alert('禁用成功');window.location.href='MusicUserGL.aspx';</script>");
                            return;
                        }
                        else
                        {
                            Response.Write("<script>alert('禁用失败');window.location.href='MusicUserGL.aspx';</script>");
                            return;
                        }
                    }
                }
            }
        }
    }
}