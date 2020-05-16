using MUSIC.BLL;
using MUSIC.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MUSIC.MusicGL
{
    public partial class MusicTypeGL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RepeaterData();                
            }
        }
        private int pages = (int)Math.Ceiling((decimal)ArtistsManager.GetSumCount() / 7);
        private void RepeaterData()
        {
            int nowpage = 1;
            if (Request.QueryString["nowpage"] != null)
            {
                nowpage = int.Parse(Request.QueryString["nowpage"]);
            }
            if (nowpage==1)
            {
                hlfirst.Enabled = false;
                hlprev.Enabled = false;
            }
            if (nowpage == pages)
            {
                hllast.Enabled = false;
                hlnext.Enabled = false;
            }
            this.Repeater1.DataSource = ArtistsManager.GetAll(nowpage);
            this.Repeater1.DataBind();
            this.lblsum.Text = ArtistsManager.GetSumCount().ToString();
            this.lblpage.Text = nowpage.ToString();
            this.lblpages.Text = pages.ToString();
            if (nowpage != pages)
            {
                this.lblone.Text = "7";
            }
            else
            {
                this.lblone.Text = (ArtistsManager.GetSumCount() - 7 * (nowpage - 1)).ToString();
            }
            hlfirst.NavigateUrl = "~/MusicGL/MusicTypeGL.aspx?nowpage=" + 1;
            hlnext.NavigateUrl = "~/MusicGL/MusicTypeGL.aspx?nowpage=" + (nowpage + 1).ToString();
            hlprev.NavigateUrl = "~/MusicGL/MusicTypeGL.aspx?nowpage=" + (nowpage - 1).ToString();
            hllast.NavigateUrl= "~/MusicGL/MusicTypeGL.aspx?nowpage=" + (pages);
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            ((HyperLink)Master.FindControl("hlinkusergl")).NavigateUrl = "~/MusicGL/MusicUserGL.aspx";
            ((HyperLink)Master.FindControl("hlinkmuiscgl")).NavigateUrl = "~/MusicGL/MusicSongGL.aspx";
            ((HyperLink)Master.FindControl("hlinkrolegl")).NavigateUrl = "~/MusicGL/MusicRoleGL.aspx";
            ((HyperLink)Master.FindControl("hlinkordergl")).NavigateUrl = "~/MusicGL/MusicOrderGL.aspx";
            ((HyperLink)Master.FindControl("hlinktype")).Text = Session["username"].ToString();
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            this.paneladd.Visible = true;
            this.panelupd.Visible = false;
            this.paneltypes.Visible = false;
        }
        private Artists artist;
        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            this.paneladd.Visible = false;
            this.panelupd.Visible = true;
            this.paneltypes.Visible = false;
            int artistid = int.Parse(e.CommandArgument.ToString());
            artist = ArtistsManager.GetById(artistid);
            this.txtupdtypename.Text = artist.Name;
            ViewState["artistid"] = int.Parse(e.CommandArgument.ToString());
        }

        protected void btnupdreturn_Click(object sender, EventArgs e)
        {
            this.paneladd.Visible = false;
            this.panelupd.Visible = false;
            this.paneltypes.Visible = true;
        }

        protected void btnreturn_Click(object sender, EventArgs e)
        {
            this.paneladd.Visible = false;
            this.panelupd.Visible = false;
            this.paneltypes.Visible = true;
        }

        protected void btnyes_Click(object sender, EventArgs e)
        {
            if (this.txttypename.Text == "")
            {
                Response.Write("<script>alert('类型名称不能为空！');</script>");
                return;
            }
            Artists artist = new Artists() { Name = this.txttypename.Text };
            if (ArtistsManager.AddArtist(artist))
            {
                Response.Write("<script>alert('添加成功！');window.location.href='MusicTypeGL.aspx?nowpage=" + Request.QueryString["nowpage"] == null ? "1" : Request.QueryString["nowpage"] + "';</script>");
                this.paneladd.Visible = false;
                this.panelupd.Visible = false;
                this.paneltypes.Visible = true;
                RepeaterData();
            }
            else
            {
                Response.Write("<script>alert('添加失败！');</script>");
                return;
            }
        }

        protected void btnupdyes_Click(object sender, EventArgs e)
        {                        
            if (this.txtupdtypename.Text == "")
            {
                Response.Write("<script>alert('类型名称不能为空！');</script>");
                return;
            }
            Artists artist1 = new Artists() { Name=this.txtupdtypename.Text};
            if (ArtistsManager.UpdArtist(artist1,(int)ViewState["artistid"]))
            {
                Response.Write("<script>alert('修改成功！');</script>");
                this.paneladd.Visible = false;
                this.panelupd.Visible = false;
                this.paneltypes.Visible = true;
                RepeaterData();
                return;
            }
            else
            {
                Response.Write("<script>alert('修改失败！');</script>");
                return;
            }
        }

        protected void LinkButton2_Command(object sender, CommandEventArgs e)
        {
            if (ArtistsManager.RemoveArtist(int.Parse(e.CommandArgument.ToString())))
            {
                Response.Write("<script>alert('删除成功！');</script>");
                RepeaterData();
                return;
            }
            else
            {
                Response.Write("<script>alert('删除失败！');</script>");
                return;
            }
        }
    }
}