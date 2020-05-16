using MUSIC.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MUSIC.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string pwd = PasswordEncrytion(this.txtuserpwd.Text);
            if(this.txtusername.Text.Trim()==""|| this.txtuserpwd.Text.Trim() == "" || this.txtvalidcode.Text.Trim() == "")
            {
                Response.Write("<script>alert('登录账号，登录密码，验证码均不能为空');</script>");
                return;
            }
            var user = UsersManager.UserLogin(this.txtusername.Text, pwd);
            if (this.txtvalidcode.Text != Session["sn"].ToString())
            {
                Response.Write("<script>alert('验证码错误');</script>");
                return;
            }
            else
            {
                if (user == null)
                {
                    Response.Write("<script>alert('登录账号或登录密码有误');</script>");
                    return;
                }
                else
                {
                    Session["username"] = user.UserName;
                    Response.Redirect("~/MusicGL/MusicSongGL.aspx");
                }
            }

        }

        protected void btnregist_Click(object sender, EventArgs e)
        {
            Response.Redirect("Regist.aspx");
        }
        //使用SHA1加密密码
        private static string PasswordEncrytion(string pwd)
        {
            //创建SHA1加密算法对象
            SHA1 sha1 = SHA1.Create();
            //将原始密码转换为字节数组
            byte[] origPwd = Encoding.UTF8.GetBytes(pwd);
            //执行加密
            byte[] encryPwd = sha1.ComputeHash(origPwd);
            //将加密后的字节数组转换为大写字符串
            return string.Join("", encryPwd.Select(b => string.Format("{0:x2}", b)).ToArray()).ToUpper();
        }
    }
}