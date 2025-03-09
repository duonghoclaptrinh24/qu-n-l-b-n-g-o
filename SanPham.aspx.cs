using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing.Printing;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace BTLWEB2
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string tensp = Request.QueryString["tensp"];
            if (!IsPostBack && string.IsNullOrEmpty(tensp))
            {
                listHot();
                listAll();
                LoadDropDownList();
            }
            else if (!string.IsNullOrEmpty(tensp))
            {
                listSearch(tensp);
                topsell.InnerText = "Sản phẩm tìm kiếm: "+ tensp;
                allsp.Visible = false;
            }
            
         
            
        }
        private SqlConnection connect(string database)
        {
            string constring = WebConfigurationManager.ConnectionStrings[database].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            return con;
        }
        private void listHot()
        {
            SqlConnection con = connect("cthd");
            con.Open();
            SqlCommand cmd = new SqlCommand("GetTopSellingProducts", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Label lbl = new Label();
                lbl.Text =
                    $"<div class='w3-card-2 w3-quarter' style='width:23%;background-color: white;margin:10px' > " +
                    $"<a href='ChiTiet.aspx?data={reader[0].ToString()}&loai={reader[1].ToString()}'>" +
                    $"      <img src='{ResolveUrl( reader[4].ToString())}' loading='lazy' alt='' style='width: 100%;max-height: 300px' class=''>  " +
                    $"     <div style='margin-left: 10px;' >    " +
                    $"     <h3>{reader[2].ToString()}</h3>     " +
                    $"     <p>Túi 5kg</p>    " +
                    $"     <p id='price'>{reader[3].ToString()}đ</p>  " +
                    $"     </div>  " +
                    $"   </a> " +
                    $"  </div>";
                hot.Controls.Add(lbl);
            }
        }

        private void listAll()
        {
            int pageSize = 16; // Số sản phẩm trên mỗi trang (4x4)
            int pageIndex = 0; // Trang mặc định là trang 1 (pageIndex = 0 tương ứng trang 1)

            // Kiểm tra nếu có tham số "page" trong query string
            if (!string.IsNullOrEmpty(Request.QueryString["page"]))
            {
                pageIndex = int.Parse(Request.QueryString["page"]) - 1; // Trang bắt đầu từ 1, nhưng pageIndex là từ 0
            }

            int startRow = pageIndex * pageSize; // Tính toán vị trí bắt đầu sản phẩm

            // Kết nối đến cơ sở dữ liệu và lấy dữ liệu theo phân trang
            SqlConnection con = connect("cthd");
            con.Open();
            string query = "SELECT * FROM sanpham ORDER BY MaSP OFFSET @StartRow ROWS FETCH NEXT @PageSize ROWS ONLY";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@StartRow", startRow);
            cmd.Parameters.AddWithValue("@PageSize", pageSize);
            SqlDataReader reader = cmd.ExecuteReader();

            // Hiển thị sản phẩm
            while (reader.Read())
            {
                Label lbl = new Label();
                lbl.Text =
                    $"<div class='w3-card-2 w3-quarter' style='background-color: white;width:23%;margin:10px;' > " +
                    $"<a href='ChiTiet.aspx?data={reader[0].ToString()}&loai={reader[1].ToString()}'>" +
                    $"      <img src='{ResolveUrl( reader[9].ToString())}' loading='lazy' alt='' style='width: 100%;max-height: 300px' class=''>  " +
                    $"     <div style='margin-left: 10px;' >    " +
                    $"     <h3>{reader[2].ToString()}</h3>     " +
                    $"     <p>Túi 5kg</p>    " +
                    $"     <p id='price'>{reader[7].ToString()}đ</p>  " +
                    $"     </div>  " +
                    $"   </a> " +
                    $"  </div>";
                sp.Controls.Add(lbl);
            }

            reader.Close();
            con.Close();

            // Tính tổng số sản phẩm để tạo nút phân trang
            con.Open();
            SqlCommand countCmd = new SqlCommand("SELECT COUNT(*) FROM sanpham", con);
            int totalProducts = (int)countCmd.ExecuteScalar();
            con.Close();

            // Tính tổng số trang
            int totalPages = (int)Math.Ceiling((double)totalProducts / pageSize);

            // Tạo điều hướng phân trang
            Label pagination = new Label();
            string paginationHtml = "<div class='w3-bar w3-center' style='margin: 20px;'>";

            // Nút "Trang trước"
            if (pageIndex > 0)
            {
                paginationHtml += $"<a href='?page={pageIndex}' class='w3-button w3-border' >&laquo; Trang trước</a> ";
            }
            else
            {
                paginationHtml += "<span class='w3-button w3-border w3-disabled' >&laquo; Trang trước</span> ";
            }

            // Hiển thị các số trang
            for (int i = 0; i < totalPages; i++)
            {
                if (i == pageIndex)
                {
                    paginationHtml += $"<span class='w3-button w3-red' >{i + 1}</span> "; // Trang hiện tại
                }
                else
                {
                    paginationHtml += $"<a href='?page={i + 1}' class='w3-button w3-border' >{i + 1}</a> ";
                }
            }

            // Nút "Trang sau"
            if (pageIndex < totalPages - 1)
            {
                paginationHtml += $"<a href='?page={pageIndex + 2}' class='w3-button w3-border' >Trang sau &raquo;</a>";
            }
            else
            {
                paginationHtml += "<span class='w3-button w3-border w3-disabled' >Trang sau &raquo;</span>";
            }

            paginationHtml += "</div>";
            pagination.Text = paginationHtml;
            btn.Controls.Add(pagination); // Thêm điều hướng phân trang vào trang
        }

        private void LoadDropDownList()
        {
            //ket noi database
            SqlConnection con = connect("cthd");
            con.Open();

            string sql = "select MaLoai,TenLoai from Loai";
            SqlCommand cmd = new SqlCommand(sql, con);

            //thuc thi cau truy van
            SqlDataReader reader = cmd.ExecuteReader();

            //gan du lieu vao drop list
            ddlLoai.DataSource = reader;
            ddlLoai.DataTextField = "TenLoai";
            ddlLoai.DataValueField = "MaLoai";
            ddlLoai.DataBind();

            //thêm mục tất cả
            ddlLoai.Items.Insert(0, new ListItem("Tất cả", ""));

            //dong ketnoi
            reader.Close();
            con.Close();
        }

        protected void ddlLoai_SelectedIndexChanged(object sender, EventArgs e)
        {
            //hien thi listHot
            listHot();
            
            string selectedLoai = ddlLoai.SelectedValue;

            //Kiem tra xem co chon All hay khong
            if(string .IsNullOrEmpty(selectedLoai) || selectedLoai == "All")
            {
                listAll();
            }
            else
            {
                //ket noi database
                SqlConnection con = connect("cthd");
                con.Open();

                //viet cau truy van de truy cap du lieu
                string sql = "SELECT * FROM SanPham WHERE MaLoai = @ml";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@ml", selectedLoai);

                //Thuc thi cau lenh
                SqlDataReader reader = cmd.ExecuteReader();

                //Hien thi san pham
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
                    sp.Controls.Add(lbl);
                }
                //dong ket noi
                reader.Close();
                con.Close();
            }
        }

        private void listSearch(string tensp)
        {
            
            SqlConnection con = connect("cthd");
            con.Open();
            SqlCommand cmd = new SqlCommand("TimKiemSanPham", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TenSP",tensp);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Label lbl = new Label();
                lbl.Text =
                    $"<div class='w3-card-2 w3-quarter' style='width:23%;background-color: white;margin:10px' > " +
                    $"<a href='ChiTiet.aspx?data={reader[0].ToString()}&loai={reader[1].ToString()}'>" +
                    $"      <img src='{ResolveUrl(reader[9].ToString())}' loading='lazy' alt='' style='width: 100%;max-height: 300px' class=''>  " +
                    $"     <div style='margin-left: 10px;' >    " +
                    $"     <h3>{reader[2].ToString()}</h3>     " +
                    $"     <p>túi 1kg</p>    " +
                    $"     <p id='price'>{reader[7].ToString()}đ</p>  " +
                    $"     </div>  " +
                    $"   </a> " +
                    $"  </div>";
                hot.Controls.Add(lbl);
            }
        }
    }
}