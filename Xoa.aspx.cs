using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTLWEB2
{
    public partial class Xoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string makh = Request.QueryString["data"];
            string masp = Request.QueryString["sp"];
            SqlConnection con = connect("cthd");
            con.Open();
            SqlCommand cmd = new SqlCommand($"Delete from GioHang where MaKhach='{makh}'and MaSP='{masp}'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Trangchu.aspx");
        }

        private SqlConnection connect(string database)
        {
            string constring = WebConfigurationManager.ConnectionStrings[database].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            return con;
        }
    }
}