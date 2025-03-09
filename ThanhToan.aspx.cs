using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTLWEB2
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            listDH();
        }

        private SqlConnection connect(string database)
        {
            string constring = WebConfigurationManager.ConnectionStrings[database].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            return con;
        }
        private void listDH()
        {
            SqlConnection con = connect("cthd");
            con.Open();
            SqlCommand cmd = new SqlCommand($"Select * from GioHang where MaKhach='{Session["MaKhach"].ToString()}'", con);
            SqlDataReader reader = cmd.ExecuteReader();
            Panel panel = new Panel();
            double totalprice=0,sum = 0;
            int totalsp=0,sp=0;
            string makh="";
            while (reader.Read())
            {
                sp = Convert.ToInt16(reader[3].ToString());
                sum = Convert.ToDouble(reader[4].ToString());
                Label label = new Label();
                label.Text = "<div class='w3-row product-item'>" +
                    "                        <div class='w3-col s3'>" +
                    $"                            <img src='{ResolveUrl(reader[5].ToString())}' alt='{reader[2].ToString()}' class='product-img' style='width:100%'> " +
                    "                        </div>" +
                    "                        <div class='w3-col s5'>" +
                    $"                            <p style='font-weight: bold;'>{reader[2].ToString()}</p>" +
                    $"                            <p style='color: red;font-weight: bold;'>Giá: {reader[4].ToString()} đ</p>" +
                    "                        </div>" +
                    "                        <div class='w3-col s3' style='margin-left:30px'>" +
                    $"                            <p>Số lượng: {reader[3].ToString()}</p>" +
                    "                        </div>" +
                    "                    </div> ";
                panel.Controls.Add(label);
                totalprice += sum * sp;
                totalsp += sp;
                makh = reader[0].ToString();
            }
            double feeprice = totalprice * 0.1;
            fee.InnerHtml = $"Phí vận chuyển: <span>{feeprice} đ</span>";
            tamtinh.InnerText = $"Tạm tính ({totalsp} Sản phẩm): {totalprice} đ";
            total.InnerHtml = $"Tổng cộng: <span>{totalprice+feeprice} đ</span>";
            lspdh.Controls.Add(panel);
            con.Close();
            con.Open();
            SqlCommand cmd2 = new SqlCommand($"Select * from Khach where MaKhach='{makh}'", con);
            SqlDataReader reader2 = cmd2.ExecuteReader();
            if (reader2.Read())
            {
                tenkh.InnerText = "Người nhận: "+reader2[1].ToString();
                diachikh.InnerText = "Địa chỉ: "+reader2[2].ToString();
                sdtkh.InnerText = "Số điện thoại: "+reader2[3].ToString();
            }
            con.Close();
        }

        
    }
}