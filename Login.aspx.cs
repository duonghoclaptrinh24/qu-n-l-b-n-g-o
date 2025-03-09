using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTLWEB2
{
    public partial class WebForm7 : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        HttpCookie ck;


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //kiem tran cookies tendangnhap
                ck = Request.Cookies["tendangnhap"];
                if (ck != null)
                {
                    //tự động đăng nhập
                    Session["Username"] = ck.Value;
                    //Response.Redirect("Profile.aspx");
                }
            }
        }


        protected void SetLogin(string username, string des)
        {
            Session["Username"] = username;
            Session.Timeout = 30;
            ck = new HttpCookie("tendangnhap", txtUsername.Text);
            ck.Expires = DateTime.Now.AddDays(1);
            ck.HttpOnly = true;
            ck.Secure = Request.IsSecureConnection;
            Response.Cookies.Add(ck);
            if (des == "tt")
            {
                themSP();
                Response.Redirect("ThanhToan.aspx");
            }
            else if (des == "ctt")
            {
                themSP();
                Response.Redirect("ChiTiet.aspx?data=" +
                    Server.UrlEncode(Session["masp"].ToString()) +
                    "&loai=" +
                    Server.UrlEncode(Session["loaisp"].ToString()));
                huySession();
            }
            else
            {
                Response.Redirect("Trangchu.aspx");
            }
        }

        //Hàm mã hóa mật khẩu
        protected string CaesarEncryption(string str)
        {
            int shift = 3;
            StringBuilder encoded = new StringBuilder();

            for (int i = 0; i < str.Length; i++)
            {
                char c = str[i];

                // Dịch chuyển ký tự, đảm bảo không vượt quá 'Z'
                char shiftedChar = (char)((c - 'A' + shift) % 26 + 'A');
                encoded.Append(shiftedChar);
            }

            return encoded.ToString();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string des = Request.QueryString["des"];
            if (txtUsername.Text == "" || txtPassword.Text == "")
            {
                lblMessage.Text = "Sai thông tin đăng nhập!";
            }
            else
            {
                //ket noi databse
                string conStr = WebConfigurationManager.ConnectionStrings["cthd"].ConnectionString;
                con = new SqlConnection(conStr);
                con.Open();

                using (cmd = new SqlCommand("sp_Dangnhap", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@tdn", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@mk", CaesarEncryption(txtPassword.Text));

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read();
                        string loaiTaiKhoan = reader["LoaiTaiKhoan"].ToString();

                        if (loaiTaiKhoan == "KhachHang")
                        {
                            // Xử lý thông tin khách hàng
                            Session["MaKhach"] = reader["MaKhach"].ToString();
                            Session["TenKhach"] = reader["TenKhach"].ToString();
                            Session["DiaChi"] = reader["DiaChi"].ToString();
                            Session["DienThoai"] = reader["DienThoai"].ToString();
                            Session["Quyen"] = "1";

                            SetLogin(txtUsername.Text, des);
                        }
                        else if (loaiTaiKhoan == "NhanVien")
                        {
                            // Xử lý thông tin nhân viên
                            Session["MaNV"] = reader["MaNV"].ToString();
                            Session["TenNV"] = reader["TenNV"].ToString();
                            Session["GioiTinh"] = reader["GioiTinh"].ToString();
                            Session["DiaChiNV"] = reader["DiaChi"].ToString();
                            Session["DienThoaiNV"] = reader["DienThoai"].ToString();
                            Session["NgaySinh"] = reader["NgaySinh"].ToString();
                            Session["Quyen"] = "0";

                            SetLogin(txtUsername.Text, des);
                        }

                        lblMessage.Text = "Tên đăng nhập hoặc mật khẩu không đúng!";
                    }
                    else
                    {
                        lblMessage.Text = "Tên đăng nhập hoặc mật khẩu không đúng!";
                    }
                }
                con.Close();

            }
        }

        protected void lbRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }


        private void themSP()
        {
            SqlConnection sql = connect("cthd");
            sql.Open();
            SqlCommand sqlCommand = new SqlCommand("ThemGioHang", sql);
            sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
            sqlCommand.Parameters.AddWithValue("@makhach", Session["MaKhach"].ToString());
            sqlCommand.Parameters.AddWithValue("@masp", Session["masp"].ToString());
            sqlCommand.Parameters.AddWithValue("@tensp", Session["tensp"].ToString());
            sqlCommand.Parameters.AddWithValue("@soluong", Session["soluong"].ToString());
            sqlCommand.Parameters.AddWithValue("@giaban", Session["giaban"].ToString());
            sqlCommand.Parameters.AddWithValue("@anh", Session["anh"].ToString());
            sqlCommand.ExecuteNonQuery();
            sql.Close();
        }
        private SqlConnection connect(string database)
        {
            string constring = WebConfigurationManager.ConnectionStrings[database].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            return con;
        }

        private void huySession()
        {
            Session.Remove("masp");
            Session.Remove("tensp");
            Session.Remove("soluong");
            Session.Remove("giaban");
            Session.Remove("loaisp");
            Session.Remove("anh");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgetPassword.aspx");
        }
    }
}