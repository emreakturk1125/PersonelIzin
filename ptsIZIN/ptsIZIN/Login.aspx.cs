using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Security.Cryptography;

namespace ptsIZIN
{
    public partial class Login : System.Web.UI.Page
    {
        Metodlar klas = new Metodlar();  
        protected void Page_Load(object sender, EventArgs e)
        {
            LiteralSifreUnuttum.Text = "<a href=\"SifremiUnuttum.aspx\"><span class=\"glyphicon glyphicon-info-sign\"></span> Şifremi Unuttum.!</a>";

        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("select * from Personel where email=@email and sifre=@sifre");
                cmd.Parameters.AddWithValue("email", TextBoxemail.Text.Trim() + "@" + ddlEmailProviders.SelectedItem);
                cmd.Parameters.AddWithValue("sifre", TextBoxsifre.Text.Trim());
              //  cmd.Parameters.AddWithValue("sifre", MD5Olustur(TextBoxsifre.Text.Trim()));
                DataRow drgiris = klas.GetDataRow(cmd);

                //if (drgiris["sifre"].ToString() == MD5Olustur(TextBoxsifre.Text.Trim()) && drgiris["email"].ToString() == TextBoxemail.Text.Trim() + "@" + ddlEmailProviders.SelectedItem)
                string sifre = TextBoxsifre.Text.Trim();
                string email = TextBoxemail.Text.Trim();
                string sif = drgiris["sifre"].ToString();
                string em = drgiris["email"].ToString();

                if (drgiris["sifre"].ToString() == TextBoxsifre.Text.Trim() && drgiris["email"].ToString() == TextBoxemail.Text.Trim() + "@" + ddlEmailProviders.SelectedItem)
                {
                    if (Convert.ToBoolean(drgiris["Aktif"]) == true && Convert.ToBoolean(drgiris["Engel"]) == false)
                    {


                        //Session["personelID"] = drgiris["personelID"].ToString();
                        //Session["AdSoyad"] = drgiris["ad"].ToString() + " " + drgiris["soyad"].ToString();
                        Session["personelID"] = "4200";
                        Session["AdSoyad"] = "Emre Aktürk";
                        Response.Redirect("IzinListesi.aspx");


                    }

                    if (Convert.ToBoolean(drgiris["Engel"]) == true && Convert.ToBoolean(drgiris["Aktif"]) == true)
                    {
                        lblUyari.Text = "Giriş İçin Yetkili Değilsiniz..!";
                    }

                }
                else
                    lblUyari.Text = "Şifre veya E-Posta hatalı..!";

            }
            catch (Exception)
            {

                lblUyari.Text = "Şifre veya E-Posta hatalı..!";
            }
        }

        public string MD5Olustur(string input)
        {
            MD5 md5Hasher = MD5.Create();
            byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }
    }
}