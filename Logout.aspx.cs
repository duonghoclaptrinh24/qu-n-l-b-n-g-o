using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTLWEB2
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra nếu có session "Username"
            if (Session["Username"] != null)
            {
                // Xóa cookie nếu có
                HttpCookie ck = Request.Cookies["tendangnhap"];
                if (ck != null)
                {
                    ck.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(ck);
                }

                // Hủy bỏ session
                Session.Abandon();

                Response.Redirect("Trangchu.aspx");
            }
            else
            {
                Response.Write("Bạn chưa đăng nhập. Không thể đăng xuất.");
            }
        }
    }
}