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

    public partial class WebForm5 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
            string loaisp = Request.QueryString["loai"]; 
            string data = Request.QueryString["data"];
            this.Title = chiTiet(data);
            spLienQuan(loaisp);
            
        }

        private SqlConnection connect(string database)
        {
            string constring = WebConfigurationManager.ConnectionStrings[database].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            return con;
        }

        private string chiTiet(string data)
        {
            string sp="";
            SqlConnection con = connect("cthd");
            con.Open();
            SqlCommand cmd = new SqlCommand($"Select * from sanpham where MaSP='{data}'", con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                img1.Src = ResolveUrl( reader[9].ToString());
                nsanpham.InnerText = reader[2].ToString();
                gsanpham.InnerText = reader[7].ToString() + "đ";
                mota.InnerText = reader[10].ToString();
                motact.InnerText = mota.InnerText;
                bctensp.InnerText = reader[2].ToString();
                sp = nsanpham.InnerText;
            }
            return sp;
        }

        protected void mua_click(object sender, EventArgs e)
        {
            HttpCookie ck = Request.Cookies["tendangnhap"];
            if (ck != null)
            {
                themSPVG();
                Response.Redirect("ThanhToan.aspx");
            }
            else
            {
                themSP1("tt");
            }
        }

        protected void them_click(object sender, EventArgs e)
        {
            HttpCookie ck = Request.Cookies["tendangnhap"];
            if (ck != null)
            {
                themSPVG();
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                themSP1("ctt");
            }
        }

        protected void btnIncrease_Click(object sender, EventArgs e)
        {
            int currentQuantity;
            if (int.TryParse(SoSP.Text, out currentQuantity))
            {
                SoSP.Text = (currentQuantity + 1).ToString(); // Tăng số lượng lên 1
            }
        }

        protected void btnDecrease_Click(object sender, EventArgs e)
        {
            int currentQuantity;
            if (int.TryParse(SoSP.Text, out currentQuantity) && currentQuantity > 1)
            {
                SoSP.Text = (currentQuantity - 1).ToString(); // Giảm số lượng xuống 1
            }
        }

        private void spLienQuan(string loai)
        {
            SqlConnection con = connect("cthd");
            con.Open();
            SqlCommand cmd = new SqlCommand($"Select top 4 * from sanpham where MaLoai='{loai}'", con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Label lbl = new Label();
                lbl.Text =
                    $"<div class='w3-card-2 w3-quarter' style='background-color: white;width:23%;margin:10px;' > " +
                    $"<a href='ChiTiet.aspx?data={reader[0].ToString()}&loai={reader[1].ToString()}'>" +
                    $"      <img src='{ResolveUrl(reader[9].ToString())}' loading='lazy' alt='' style='width: 100%;max-height: 300px' class=''>  " +
                    $"     <div style='margin-left: 10px;' >    " +
                    $"     <h3>{reader[2].ToString()}</h3>     " +
                    $"     <p>Túi 5kg</p>    " +
                    $"     <p id='price'>{reader[7].ToString()}đ</p>  " +
                    $"     </div>  " +
                    $"   </a> " +
                    $"  </div>";
                lienquan.Controls.Add(lbl);
            }
        }

        private void themSPVG()
        {
            string data = Request.QueryString["data"];
            int gia = Convert.ToInt32(gsanpham.InnerText.ToString().Replace("đ", ""));
            SqlConnection sql = connect("cthd");
            sql.Open();
            SqlCommand sqlCommand = new SqlCommand("ThemGioHang", sql);
            sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
            sqlCommand.Parameters.AddWithValue("@makhach", Session["MaKhach"].ToString());
            sqlCommand.Parameters.AddWithValue("@masp", data);
            sqlCommand.Parameters.AddWithValue("@tensp", nsanpham.InnerText.ToString());
            sqlCommand.Parameters.AddWithValue("@soluong", SoSP.Text.ToString());
            sqlCommand.Parameters.AddWithValue("@giaban", gia);
            sqlCommand.Parameters.AddWithValue("@anh", img1.Src.ToString());
            sqlCommand.ExecuteNonQuery();
            sql.Close();

            
        }

        private void themSP1(string des)
        {
            string loaisp = Request.QueryString["loai"];
            string data = Request.QueryString["data"];
            int gia = Convert.ToInt32(gsanpham.InnerText.ToString().Replace("đ", ""));

            // Lưu trữ dữ liệu vào Session
            Session["masp"] = data;
            Session["tensp"] = nsanpham.InnerText.ToString();
            Session["soluong"] = SoSP.Text.ToString();
            Session["giaban"] = gia;
            Session["anh"] = img1.Src.ToString();
            Session["loaisp"] = loaisp;

            // Chuyển hướng sang trang Login.aspx
            Response.Redirect("Login.aspx?des="+Server.UrlEncode(des));

        }
    }
}