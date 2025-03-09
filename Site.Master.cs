using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGrease.Activities;

namespace BTLWEB2
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!ckdn())
            {
                nosp.Visible = true;
                ttbtn.Visible = false;
            }
            else
            {
                listSPDC(ckdn());
                if (Session["Quyen"] == "0")
                {
                    khnv.InnerText = "QUẢN LÍ SẢN PHẨM";
                    khnv.HRef = "~/NhanVien/QuanTri.aspx";
                    rightMenu.Visible = false;
                    shopcart.Visible = false;
                }
            }
            
        }

        private SqlConnection connect(string database)
        {
            string constring = WebConfigurationManager.ConnectionStrings[database].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            return con;
        }
        private void listSPDC(bool dn)
        {
            if (dn)
            {
                
                    SqlCommand cmd;

                SqlConnection con = connect("cthd");
                con.Open();
                if (Session["MaKhach"] == null)
                {
                    cmd = new SqlCommand($"Select * from GioHang", con);
                }
                else
                {
                    cmd = new SqlCommand($"Select * from GioHang where MaKhach='{Session["MaKhach"].ToString()}'", con);
                }
                int sl = 0;   

                SqlDataReader reader = cmd.ExecuteReader();
                    Panel panel = new Panel();

                    if (!reader.HasRows)
                    {
                        nosp.Visible = true;
                        ttbtn.Visible = false;
                    }
                    else
                    {
                   
                        while (reader.Read())
                        {
                            Label label = new Label();
                            label.Text =
                                $"<div class='w3-row product-item' style='margin:10px 0;background-color:buttonface;padding-left:10%'>" +
                                $"<div class='w3-col s9'>" +
                                $"<p style='margin:0'>{reader[2].ToString()} </p>" +
                                $"<p style='margin:0'>Giá: {reader[4].ToString()}</p>" +
                                $"<p style='margin:0'>Số lượng:{reader[3].ToString()}</p>" +
                                $"</div>" +
                                $"<div class='w3-col s3'>" +
                                $"<a href='Xoa.aspx?data={reader[0].ToString()}&sp={reader[1].ToString()}'>Xóa</a>" +
                                $"</div>" +
                                $"</div>";
                            panel.Controls.Add(label);
                        sl += int.Parse(reader[3].ToString());
                        }
                    }
                    sltg.InnerText= sl.ToString();
                    spdc.Controls.Add(panel);
                
                
            }
        }

        private void timSP()
        {
            SqlConnection con = connect("cthd");
            con.Open();
            SqlCommand cmd = new SqlCommand($"Select * from sanpham where TenSP='{search.Text}'", con);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Response.Redirect($"SanPham.aspx?tensp={search.Text}");
            }
        }

        private bool ckdn()
        {
            if (!IsPostBack)
            {
                //kiem tran cookies tendangnhap
                HttpCookie ck = Request.Cookies["tendangnhap"];
                if (ck != null)
                {
                    //tự động đăng nhập
                    Session["Username"] = ck.Value;
                    dnbtn.InnerText = ck.Value.ToString() ;
                    dnbtn.HRef = "Profile.aspx";
                    return true;
                }
            }
            return false;
        }

        protected void ThanhToan_Click(object sender, EventArgs e)
        {
            HttpCookie ck = Request.Cookies["tendangnhap"];
            if (ck != null)
            {
                Response.Redirect("ThanhToan.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx?des=tt");
            }
        }

        
    }
        
}