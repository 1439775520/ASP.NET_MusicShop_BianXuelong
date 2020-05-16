using MUSIC.BLL;
using MUSIC.DAL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MUSIC.MusicGL
{
    public partial class MusicSongGL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RepeaterData();
                DropData();
            }
        }

        private void DropData()
        {
            this.droptype.DataSource = ArtistsManager.GetAllType();
            this.dropsongtype.DataSource = ArtistsManager.GetAllType();
            this.droptype.DataTextField = "Name";
            this.dropsongtype.DataTextField = "Name";
            this.droptype.DataValueField = "ArtistId";
            this.dropsongtype.DataValueField = "ArtistId";
            this.droptype.DataBind();
            this.dropsongtype.DataBind();
            this.dropgenre.DataSource = GenresManager.GetAllGenre();
            this.dropsingername.DataSource = GenresManager.GetAllGenre();
            this.dropgenre.DataTextField = "Name";
            this.dropsingername.DataTextField = "Name";
            this.dropgenre.DataValueField = "GenreId";
            this.dropsingername.DataValueField = "GenreId";
            this.dropgenre.DataBind();
            this.dropsingername.DataBind();
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            ((HyperLink)Master.FindControl("hlinkmuisctypegl")).NavigateUrl = "~/MusicGL/MusicTypeGL.aspx";
            ((HyperLink)Master.FindControl("hlinkusergl")).NavigateUrl = "~/MusicGL/MusicUserGL.aspx";
            ((HyperLink)Master.FindControl("hlinkrolegl")).NavigateUrl = "~/MusicGL/MusicRoleGL.aspx";
            ((HyperLink)Master.FindControl("hlinkordergl")).NavigateUrl = "~/MusicGL/MusicOrderGL.aspx";
            ((HyperLink)Master.FindControl("hlinktype")).Text = Session["username"].ToString();
        }
        private int pages = (int)Math.Ceiling((decimal)AlbumsManager.GetSumCount() / 7);
        private void RepeaterData()
        {
            int nowpage = 1;
            if (Request.QueryString["nowpage"] != null)
            {
                nowpage = int.Parse(Request.QueryString["nowpage"]);
            }
            if (nowpage == 1)
            {
                hlfirst.Enabled = false;
                hlprev.Enabled = false;
            }
            if (nowpage == pages)
            {
                hllast.Enabled = false;
                hlnext.Enabled = false;
            }
            this.Repeater1.DataSource = AlbumsManager.GetAll(nowpage);
            this.Repeater1.DataBind();
            this.lblsum.Text = AlbumsManager.GetSumCount().ToString();
            this.lblpage.Text = nowpage.ToString();
            this.lblpages.Text = pages.ToString();
            if (nowpage != pages)
            {
                this.lblone.Text = "7";
            }
            else
            {
                this.lblone.Text = (AlbumsManager.GetSumCount() - 7*(nowpage-1)).ToString();
            }
            hlfirst.NavigateUrl = "~/MusicGL/MusicSongGL.aspx?nowpage=" + 1;
            hlnext.NavigateUrl = "~/MusicGL/MusicSongGL.aspx?nowpage=" + (nowpage + 1).ToString();
            hlprev.NavigateUrl = "~/MusicGL/MusicSongGL.aspx?nowpage=" + (nowpage - 1).ToString();
            hllast.NavigateUrl = "~/MusicGL/MusicSongGL.aspx?nowpage=" + (pages);
        }
        protected void btnadd_Click(object sender, EventArgs e)
        {
            this.paneladd.Visible = true;
            this.panelupd.Visible = false;
            this.paneltypes.Visible = false;
        }
        private Albums album;
        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            this.paneladd.Visible = false;
            this.panelupd.Visible = true;
            this.paneltypes.Visible = false;
            int albumid = int.Parse(e.CommandArgument.ToString());
            album = AlbumsManager.GetById(albumid);
            this.txtmusicname.Text = album.Title;
            this.txtsongprice.Text = album.Price.ToString();
            this.dropsongtype.SelectedItem.Text = album.Artists.Name;
            this.dropsingername.SelectedItem.Text = album.Genres.Name;
            this.Image2.ImageUrl = "~"+album.AlbumArtUrl;
            ViewState["albumid"] = int.Parse(e.CommandArgument.ToString());
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
            if (this.txtalbumname.Text == ""||this.txtprice.Text==""||this.FileUpload1.FileName=="")
            {
                Response.Write("<script>alert('音乐名称或价格或音乐图片不能为空！');</script>");
                return;
            }
            Albums album = new Albums() { Title = this.txtalbumname.Text,
                GenreId = int.Parse(this.dropgenre.SelectedItem.Value),
                ArtistId = int.Parse(this.droptype.SelectedItem.Value),
                AlbumArtUrl = "/Content/Images/"+this.FileUpload1.FileName,
                Price=decimal.Parse(this.txtprice.Text)
            };
            if (this.FileUpload1.HasFile)
            {
                string filename = this.FileUpload1.FileName;
                string filefix = Path.GetExtension(filename).ToLower();
                if (filefix == ".jpg" || filefix == ".jpeg" || filefix == ".png" || filefix == ".gif")
                {
                    this.FileUpload1.SaveAs(Server.MapPath(filename));
                }
                else
                {
                    Response.Write("<script>alert('您选择的文件并非图片文件！');</script>");
                    return;
                }
            }
            if (AlbumsManager.AddAlbum(album))
            {
                Response.Write("<script>alert('添加成功！');window.location.href='MusicSongGL.aspx?nowpage="+Request.QueryString["nowpage"] == null ? "1" : Request.QueryString["nowpage"] + "';</script>");
                this.paneladd.Visible = false;
                this.panelupd.Visible = false;
                this.paneltypes.Visible = true;
                RepeaterData();
                DropData();
            }
            else
            {
                Response.Write("<script>alert('添加失败！');</script>");
                return;
            }
        }

        protected void btnupdyes_Click(object sender, EventArgs e)
        {
            if (this.txtmusicname.Text == ""||this.txtsongprice.Text==""||this.FileUpload2.FileName=="")
            {
                Response.Write("<script>alert('音乐名称或价格或音乐图片不能为空！');</script>");
                return;
            }
            if (this.FileUpload2.HasFile)
            {
                string filename = this.FileUpload2.FileName;
                string filefix = Path.GetExtension(filename).ToLower();
                if(filefix==".jpg"|| filefix == ".jpeg" || filefix == ".png"||filefix == ".gif")
                {
                    this.FileUpload2.SaveAs(Server.MapPath("~/Content/Images/"+filename));
                    this.Image2.ImageUrl = "~/Content/Images/"+filename;
                }
                else
                {
                    Response.Write("<script>alert('您选择的文件并非图片文件！');</script>");
                    return;
                }
            }
            Albums album = new Albums()
            {
                Title = this.txtmusicname.Text,
                GenreId = int.Parse(this.dropsingername.SelectedItem.Value),
                ArtistId = int.Parse(this.dropsongtype.SelectedItem.Value),
                AlbumArtUrl = "/Content/Images/" + this.FileUpload2.FileName,
                Price = decimal.Parse(this.txtsongprice.Text)
            };
            if (AlbumsManager.UpdAlbum(album, (int)ViewState["albumid"]))
            {
                Response.Write("<script>alert('修改成功！');</script>");
                this.paneladd.Visible = false;
                this.panelupd.Visible = false;
                this.paneltypes.Visible = true;
                RepeaterData();
                DropData();
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
            if (AlbumsManager.RemoveAlbum(int.Parse(e.CommandArgument.ToString())))
            {
                Response.Write("<script>alert('删除成功！');</script>");
                RepeaterData();
                DropData();
                return;
            }
            else
            {
                Response.Write("<script>alert('删除失败！');</script>");
                return;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.Image1.ImageUrl = "~/Content/Images/" + this.FileUpload1.FileName;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            this.Image2.ImageUrl = "~/Content/Images/" + this.FileUpload2.FileName;
        }
    }
}