using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.AccessControl;
using System.Web.Configuration;

namespace BTLWEB2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string constring = WebConfigurationManager.ConnectionStrings["demobd"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from sanpham",con);            
            SqlDataReader reader = cmd.ExecuteReader();
            Panel panel = new Panel();
            while (reader.Read())
            {
               Label lbl = new Label();
                lbl.Text = 
                    $"<div class='VietNam NEP k1kg w3-card-2 w3-quarter' style='background-color: white;' > " +
                    $"<a href=''><img src='' loading='lazy' alt='' style='width: 100%;' class=''>  " +
                    $"     <div style='margin-left: 10px;' >    " +
                    $"     <h3>{reader[1].ToString()}<br> (loại 1)</h3>     " +
                    $"     <p>túi 1kg</p>    " +
                    $"     <p id='price'>{reader[2].ToString()}</p>  " +
                    $"     </div>  " +
                    $"   </a> " +
                    $"  </div>";
                panel.Controls.Add(lbl);
            }
            this.Controls.Add(panel);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }



       
}