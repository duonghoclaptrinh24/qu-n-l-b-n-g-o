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
    public partial class WebForm10 : System.Web.UI.Page
    {
        //khai bao bien toan cuc
        SqlConnection con;
        SqlCommand cmd, cmd1;
        SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rdolistRole.SelectedValue = "Nhân viên";
            }
        }

        protected void Connection()
        {
            con = new SqlConnection("" + WebConfigurationManager.ConnectionStrings["cthd"].ConnectionString);
            if (con != null) con.Open();
        }

        protected void lbtnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lbtnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
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

        //Hàm check
        protected void CheckTextBox()
        {
            if (string.IsNullOrEmpty(txtUsername.Text) || string.IsNullOrEmpty(txtID.Text))
            {
                lblMessage.Text = "Hãy nhập thông tin!";
                return;
            }
            else if (string.IsNullOrEmpty(txtNewPassword.Text) || string.IsNullOrEmpty(txtRepeatNewPassword.Text))
            {
                lblMessage.Text = "Hãy nhập mật khẩu!";
                return;
            }
            else if (txtNewPassword.Text != txtRepeatNewPassword.Text)
            {
                lblMessage.Text = "Mật khẩu nhập lại không đúng!";
                return;
            }
        }

        protected void ChangePassword(string username, string password)
        {
            // Tạo và thực thi lệnh cập nhật
            cmd1 = new SqlCommand("sp_SuaLogin1", con);
            cmd1.CommandType = System.Data.CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@tdn", username);
            cmd1.Parameters.AddWithValue("@mk", CaesarEncryption(password));
            int result = cmd1.ExecuteNonQuery();

            if (result > 0)
                lblMessage.Text = "Đổi mật khẩu thành công!";
            else
                lblMessage.Text = "Đổi mật khẩu không thành công. Vui lòng kiểm tra lại!";
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            //ket noi database
            Connection();
            //check xem radio button dang chon cai nao
            string selected = rdolistRole.SelectedValue;

            try
            {
                if (selected == "Nhân viên")
                {
                    CheckTextBox();//kiểm tra text box

                    //Viết câu truy vấn 
                    string sql = "select Tendangnhap, MaNV from Login where Tendangnhap = @tdn and MaNV = @mnv";

                    cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@tdn", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@mnv", txtID.Text);

                    //thuc thi cau truy van
                    reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Đóng reader trước khi thực hiện lệnh cập nhật
                        reader.Close();

                        //goi ham doi matkhau
                        ChangePassword(txtUsername.Text, txtNewPassword.Text);

                        //Chuyển trang sang đăng nhập
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Không tìm thấy tài khoản hoặc mã nhân viên không khớp!";
                        reader.Close();
                    }
                }
                else if (selected == "Khách hàng")
                {
                    CheckTextBox();//kiểm tra text box

                    string sql = "select Tendangnhap, MaKhach from Login where Tendangnhap = @tdn and MaKhach = @mkhach";

                    cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@tdn", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@mkhach", txtID.Text);

                    //thuc thi cau truy van
                    reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Đóng reader trước khi thực hiện lệnh cập nhật
                        reader.Close();
                        //goi ham doi matkhau
                        ChangePassword(txtUsername.Text, txtNewPassword.Text);
                        //Chuyển trang sang đăng nhập
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Không tìm thấy tài khoản hoặc mã nhân viên không khớp!";
                        reader.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                throw;
            }

            //Đóng kết nối
            con.Close();
        }
    }
}