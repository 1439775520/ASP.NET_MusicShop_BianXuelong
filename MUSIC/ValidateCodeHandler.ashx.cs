using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MUSIC
{
    /// <summary>
    /// ValidateCodeHandler 的摘要说明
    /// </summary>
    public class ValidateCodeHandler : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            Color[] colors = new Color[] {Color.Red, Color.Green, Color.Yellow, Color.Blue, Color.AliceBlue, Color.Aqua, Color.Bisque, Color.Brown };
            Image img = new Bitmap(100,36);
            Graphics graphics = Graphics.FromImage(img);
            Random random = new Random(DateTime.Now.Millisecond);
            int charNum1 = random.Next(97,122);
            int charNum2 = random.Next(97, 122);
            int charNum3 = random.Next(97, 122);
            int charNum4 = random.Next(97, 122);
            string validCode = string.Format("{0}{1}{2}{3}",(char)charNum1, (char)charNum2, (char)charNum3, (char)charNum4);
            context.Session["sn"] = validCode;
            Font font = new Font("宋体",24);
            Brush brush1 = new SolidBrush(colors[random.Next(0, colors.Length - 1)]);
            graphics.DrawString(((char)charNum1).ToString(),font,brush1,7,-3);
            Brush brush2 = new SolidBrush(colors[random.Next(0, colors.Length - 1)]);
            graphics.DrawString(((char)charNum2).ToString(), font, brush2, 26, -9);
            Brush brush3 = new SolidBrush(colors[random.Next(0, colors.Length - 1)]);
            graphics.DrawString(((char)charNum3).ToString(), font, brush3, 50, 0);
            Brush brush4 = new SolidBrush(colors[random.Next(0, colors.Length - 1)]);
            graphics.DrawString(((char)charNum4).ToString(), font, brush4, 70, -7);
            context.Response.ContentType = "image/jpeg";
            img.Save(context.Response.OutputStream, ImageFormat.Jpeg);
            img.Dispose();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}