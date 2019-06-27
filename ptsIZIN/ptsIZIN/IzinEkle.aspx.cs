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

    public partial class IzinEkle : System.Web.UI.Page
    {
        Metodlar klas = new Metodlar();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["personelID"] == null)
                Response.Redirect("Login.aspx");
            if (Session["AdSoyad"] != null)
                lblPersonelAdi.Text = Session["AdSoyad"].ToString();
            if (!IsPostBack) // *** dropdownlist li enum kullanımı ***
            {


                //LiteralGuncelleme.Text = "<a href=\"PersonelGüncelle.aspx?personelID=" + Session["personelID"] + "\"><span class=\"glyphicon glyphicon-edit\"></span>Bilgilerini Güncelle</a>";
                //LiteralGuncelleme.Text = "<a href=\"PersonelGuncelle.aspx?personelID=" + Session["personelID"] + "\"><span class=\"glyphicon glyphicon-edit\"></span>Bilgilerini Güncelle</a>";
                Array values = Enum.GetValues(typeof(Enumlar.IzinTipi));
                Array names = Enum.GetNames(typeof(Enumlar.IzinTipi));

                for (int i = 0; i < names.Length; i++)
                {
                    ddlIzinTuru.Items.Add(new ListItem(names.GetValue(i).ToString(), Convert.ToInt32(values.GetValue(i)).ToString()));
                }
                ddlIzinTuru.Items.Insert(0, new ListItem("Seçiniz", ""));
            }
        }

        public void btnEkle_Click(object sender, EventArgs e)
        {
            DateTime dt4 = Convert.ToDateTime(txtBaslangicTarihi.Text);
            DateTime dt5 = Convert.ToDateTime(txtBitisTarihi.Text);
            int resultId = 0;

            //DateTime d1 = Convert.ToDateTime(txtBaslangicTarihi.Text);
            //DateTime d2 = Convert.ToDateTime(txtBitisTarihi.Text);

            //TimeSpan dateDiff = d2 - d1;

            //string gunn = Convert.ToString(string.Format("{0:dd}",dateDiff));

           

            if (DateTime.Compare(dt4, dt5) == 0)
            {

                AlertCustom.ShowCustom(this.Page, "İki Tarih Eşit Olamaz..!!");
            }

            else if (DateTime.Compare(dt4, dt5) > 0)
            {
                AlertCustom.ShowCustom(this.Page, "Başlangıç Tarihi, Bitiş Tarihinden Sonra Olamaz!!");

            }
            else
            {

                SqlConnection con = klas.baglan();
                SqlCommand cmd = new SqlCommand();

                cmd.Connection = con;
                cmd.CommandText = "insert into Izin (baslamaTarihi,bitisTarihi,personelID,durum,islemTarihi,aciklama,izinTuru,toplamGun,toplamSaat,ulasKisi) values (@baslamaTarihi,@bitisTarihi,@personelID,@durum,@islemTarihi,@aciklama,@izinTuru,@toplamGun,@toplamSaat,@ulasKisi); SELECT SCOPE_IDENTITY();";
               
                cmd.Parameters.Add("@baslamaTarihi", dt4);
                cmd.Parameters.Add("@aciklama", txtboxAciklama.Text);
                cmd.Parameters.Add("@izinTuru", ddlIzinTuru.SelectedValue);
                cmd.Parameters.Add("@toplamGun", txtToplamGun.Text);
                cmd.Parameters.Add("@toplamSaat", txtToplamSaat.Text);
                cmd.Parameters.Add("@ulasKisi", txtAcilUlas.Text);
                cmd.Parameters.Add("@bitisTarihi", dt5);
                cmd.Parameters.Add("@islemTarihi", DateTime.Now);
                cmd.Parameters.Add("@durum", (short)Enumlar.IzinDurum.ISLEME_ALINDI);
                if (Session["personelID"] != null)
                {
                    cmd.Parameters.Add("@personelID", System.Data.SqlDbType.SmallInt).Value = Convert.ToInt32(Session["personelID"].ToString());
                }
                //cmd.ExecuteNonQuery();  

                txtBaslangicTarihi.Text = "";
                txtBitisTarihi.Text = "";
                txtToplamGun.Text = "";
                txtToplamSaat.Text = "";
                temizle(pnlIzin);
                
                resultId = Convert.ToInt32(cmd.ExecuteScalar()); //  cmd.ExecuteNonQuery(); ve cmd.ExecuteScalar() aynı anda kullanırsan iki defa işlem yapar o yüzden ikisinden birini kullan

            }
            string script = @"window.open('IzinRaporu.aspx?izinID=" + resultId + "');";
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Redirect", script, true);
            AlertCustom.ShowCustom(this.Page, "İzin İşlemi başarılı..");
           



        }
 
        public void temizle(Panel PNL)
        {
            foreach (Control ctrl in pnlIzin.Controls)
            {
                if (ctrl is TextBox)
                {
                    ((TextBox)ctrl).Text = "";
                }
                if (ctrl is DropDownList)
                {
                    ((DropDownList)ctrl).Text = "";
                }


            }
        }

        protected void btnExceleAktar_Click(object sender, EventArgs e)
        {
            ExcelAktar();
        }
        private void GridViewDoldur()
        {
            SqlConnection baglanti = klas.baglan();
            SqlCommand cmd1 = new SqlCommand();
            cmd1.Connection = baglanti;
            cmd1.CommandText = "select * from dbo.Izin";
            DataTable dt = klas.GetDataTable(cmd1);
            gvListe.DataSource = dt;
            gvListe.DataBind();
        }
        private void ExcelAktar()
        {
            Response.Clear();
            Response.AddHeader("content-disposition", "attachment;filename=İzinRaporu.xls");
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("ISO-8859-9");
            Response.Charset = "ISO-8859-9";
            Response.ContentType = "application/vnd.xls";
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
            form1.Controls.Clear();
            form1.Controls.Add(gvListe);
            form1.RenderControl(htmlWrite);
            Response.Write(stringWrite.ToString());
            Response.End();
        }


    }
}