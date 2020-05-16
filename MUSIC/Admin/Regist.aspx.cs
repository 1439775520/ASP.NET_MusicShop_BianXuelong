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

namespace MUSIC.Admin
{
    public partial class Regist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if(this.txtusername.Text==""|| this.txtuserpwd.Text == "" || this.txtpwdagin.Text == "" || this.txtphone.Text == "" || this.txtname.Text == "")
            {
                Response.Write("<script>alert('登录账号，登录密码，确认密码，电话，用户名均不能为空！');</script>");
                return;
            }
            if(this.txtuserpwd.Text != this.txtpwdagin.Text)
            {
                Response.Write("<script>alert('俩次密码输入不一致！');</script>");
                return;
            }
            if (this.txtphone.Text.Length != 11)
            {
                Response.Write("<script>alert('电话号格式不正确！');</script>");
                return;
            }
            string pwd = PasswordEncrytion(this.txtuserpwd.Text);
            Users user = new Users() { LoginId=this.txtusername.Text,LoginPwd=pwd,Phone=this.txtphone.Text,UserName=this.txtname.Text};
            if (UsersManager.UserRegist(user))
            {
                Response.Write("<script>alert('注册成功，返回登录！');window.location.href='Login.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('注册失败！');</script>");
                return;
            }
        }

        protected void btnregist_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
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