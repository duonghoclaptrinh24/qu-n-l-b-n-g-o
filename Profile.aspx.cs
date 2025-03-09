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
    public partial class WebForm8 : System.Web.UI.Page
    {
        string conStr;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader data;
        string sql = "";

        protected void Connection()
        {
            con = new SqlConnection("" + WebConfigurationManager.ConnectionStrings["cthd"].ConnectionString);
            if (con != null) con.Open();
        }

        private void LoadUserProfile()
        {
            Connection();
            if (Session["Quyen"] == "1")
            {
                sql = "SELECT MaKhach, TenKhach, DiaChi, DienThoai FROM Khach WHERE MaKhach = @makhach";
                using (cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@makhach", Session["MaKhach"].ToString());
                    data = cmd.ExecuteReader();

                    if (data.Read())
                    {
                        txtID.Text = data["MaKhach"].ToString(); // Cập nhật Mã khách hàng
                        txtFullName.Text = data["TenKhach"].ToString(); // Cập nhật Họ và tên
                        txtAddress.Text = data["DiaChi"].ToString(); // Cập nhật Địa chỉ
                        txtPhoneNumber.Text = data["DienThoai"].ToString(); // Cập nhật Số điện thoại

                        txtUsername.Text = Session["Username"].ToString();
                    }
                    else
                    {
                        lblMessage.Text = "Không tìm thấy thông tin khách hàng!";
                    }
                    pnNhanVien.Visible = false;
                }
            }
            else if (Session["Quyen"] == "0")
            {
                sql = "SELECT MaNV, TenNV, GioiTinh, DiaChi, DienThoai, NgaySinh FROM NhanVien WHERE MaNV = @manv";
                using (cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@manv", Session["MaNV"].ToString());
                    data = cmd.ExecuteReader();

                    if (data.Read())
                    {
                        txtNVID.Text = data["MaNV"].ToString();
                        txtNVName.Text = data["TenNV"].ToString();
                        txtNVgioitinh.Text = data["GioiTinh"].ToString();
                        txtNVdiachi.Text = data["DiaChi"].ToString();
                        txtNVdienthoai.Text = data["DienThoai"].ToString();
                        txtNVNgaysinh.Text = data[5].ToString();

                        txtUsername.Text = Session["Username"].ToString();
                    }
                    else
                    {
                        lblMessageNV.Text = "Không tìm thấy thông tin khách hàng!";
                    }
                    pnKhach.Visible = false;
                }
            }
            con.Close();

        }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else if (!IsPostBack)
            {
                LoadUserProfile();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Logout.aspx");
        }

        protected void lbtnUpdate_Click(object sender, EventArgs e)
        {
            if (Session["Quyen"] == "1")
            {
                txtFullName.ReadOnly = false;
                txtAddress.ReadOnly = false;
                txtPhoneNumber.ReadOnly = false;
                btnSave.Enabled = true;
            }
            else if (Session["Quyen"] == "0")
            {
                txtNVName.ReadOnly = false;
                txtNVgioitinh.ReadOnly = false;
                txtNVdiachi.ReadOnly = false;
                txtNVdienthoai.ReadOnly = false;
                txtNVNgaysinh.ReadOnly = false;
                btnSaveInforNV.Enabled = true;
            }

        }
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
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Connection();

                cmd = new SqlCommand("sp_SuaKhach", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@makhach", txtID.Text);
                cmd.Parameters.AddWithValue("@tenkhach", txtFullName.Text);
                cmd.Parameters.AddWithValue("@diachi", txtAddress.Text);
                cmd.Parameters.AddWithValue("@dienthoai", txtPhoneNumber.Text);
                cmd.ExecuteNonQuery();

                con.Close();

                lblMessage.Text = "Sửa thông tin thành công";

                txtFullName.ReadOnly = true;
                txtAddress.ReadOnly = true;
                txtPhoneNumber.ReadOnly = true;
                btnSave.Enabled = false;
            }
            catch (Exception)
            {
                lblMessage.Text = "Đã xảy ra lỗi, hãy thử lại!";
                throw;
            }

        }

        protected void btnSaveInforNV_Click(object sender, EventArgs e)
        {
            try
            {
                Connection();
                cmd = new SqlCommand("sp_Suanv", con);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                DateTime ns = new DateTime();
                ns = Convert.ToDateTime(txtNVNgaysinh.Text);

                cmd.Parameters.AddWithValue("@manv", txtNVID.Text);
                cmd.Parameters.AddWithValue("@tennv", txtNVName.Text);
                cmd.Parameters.AddWithValue("@gt", txtNVgioitinh.Text);
                cmd.Parameters.AddWithValue("@diachi", txtNVdiachi.Text);
                cmd.Parameters.AddWithValue("@dienthoai", txtNVdienthoai.Text);
                cmd.Parameters.AddWithValue("@ns", ns);

                cmd.ExecuteNonQuery();

                con.Close();

                lblMessageNV.Text = "Sửa thông tin thành công";

                txtNVName.ReadOnly = true;
                txtNVgioitinh.ReadOnly = true;
                txtNVdiachi.ReadOnly = true;
                txtNVdienthoai.ReadOnly = true;
                txtNVNgaysinh.ReadOnly = true;
                btnSaveInforNV.Enabled = false;
            }
            catch (Exception ex)
            {
                lblMessageNV.Text = "Đã xảy ra lỗi, hãy thử lại!" + ex.Message;

            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            //check mat khau mooi va nhap lai mat khau moi
            if (txtNewPassword.Text != txtRepeatNewPassword.Text)
            {
                lblPassWordChageMessage.Text = "Mật khẩu mới và nhập lại mật khẩu không trùng khớp!";
                return;
            }

            //kiem tra xem da dang nhap hay chua
            string username = Session["Username"] != null ? Session["Username"].ToString() : null;
            if (username == null)
            {
                lblPassWordChageMessage.Text = "Bạn chưa đăng nhập!";
                return;
            }

            try
            {
                Connection();

                using (cmd = new SqlCommand("sp_Sualogin", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@tdn", username);
                    cmd.Parameters.AddWithValue("@mkc", CaesarEncryption(txtOldPassword.Text));
                    cmd.Parameters.AddWithValue("@mkm", CaesarEncryption(txtNewPassword.Text));

                    int result = (int)cmd.ExecuteScalar();
                    if (result == 1)
                    {
                        lblPassWordChageMessage.Text = "Mật khẩu đã được thay đổi thành công!";
                    }
                    else
                    {
                        lblPassWordChageMessage.Text = "Mật khẩu cũ không đúng!";
                    }
                }
                con.Close();

            }
            catch (Exception ex)
            {
                lblPassWordChageMessage.Text = "Đã xảy ra lỗi: " + ex.Message;
            }
        }
    }
}