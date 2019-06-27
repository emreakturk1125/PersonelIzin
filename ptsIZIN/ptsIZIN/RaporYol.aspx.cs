using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace ptsIZIN
{
    public partial class RaporYol : System.Web.UI.Page
    {
        Metodlar klas = new Metodlar();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["personelID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
 
        protected void btnResimYoluekle_Click(object sender, EventArgs e)
        {
            SqlConnection baglanti = klas.baglan();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = baglanti;
            cmd.CommandText = "update appSettings  set settingsValue = @settingsValue where settingsKey = 'reportImageUrl' ";
            cmd.Parameters.Add("@settingsValue", txtboxResimYolu.Text);
            cmd.ExecuteNonQuery();
            txtboxResimYolu.Text = "";
            AlertCustom.ShowCustom(this.Page, "Resim Yolu eklenmiştir");
        }
    }
}