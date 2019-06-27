using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ptsIZIN
{
    public partial class IzinRaporu : System.Web.UI.Page
    {
        Metodlar klas = new Metodlar();
        string izinID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection baglanti = klas.baglan();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = baglanti;
            cmd.CommandText = "select * from appSettings where settingsKey='reportImageUrl'";
            DataRow dr = klas.GetDataRow(cmd);
            string i = dr["settingsValue"].ToString();

            resim1.ImageUrl = dr["settingsValue"].ToString();
            if (Session["personelID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                IzinRaporuOlustur();
                
            }
           
        
        }

        private void IzinRaporuOlustur()
        {
            izinID = Request.QueryString["izinID"];
            SqlCommand cmd = new SqlCommand();
            //cmd.CommandText = "select * from Izin where izinID=@izinID";
            cmd.CommandText = "SELECT dbo.Izin.*, dbo.Personel.* FROM dbo.Izin INNER JOIN dbo.Personel ON dbo.Izin.personelID = dbo.Personel.personelID where izinID=@izinID";
            cmd.Parameters.Add("@izinID", Request.QueryString["izinID"]);
            DataRow drIzin = klas.GetDataRow(cmd);
            Session["AdSoyad"] = drIzin["ad"].ToString() + " " + drIzin["soyad"].ToString();
            lblAd.Text = Session["AdSoyad"].ToString();
            if (drIzin["izinTuru"].ToString() == "1")
            {
                lblYillikIzin.Text = "X";
            }
            if (drIzin["izinTuru"].ToString() == "2")
            {
                lblRaporluIzin.Text = "X";
            }
            if (drIzin["izinTuru"].ToString() == "3")
            {
                lblDogumIzin.Text = "X";
            }
            if (drIzin["izinTuru"].ToString() == "4")
            {
                lblEvlilikIzin.Text = "X";
            }
            if (drIzin["izinTuru"].ToString() == "5")
            {
                lblOlumIzin.Text = "X";
            }
            if (drIzin["izinTuru"].ToString() == "6")
            {
                lblYeniIsIzin.Text = "X";
            }
            lblIzneBaslama.Text = drIzin["baslamaTarihi"].ToString();
            lblIzinBitisTarihi.Text = drIzin["bitisTarihi"].ToString();
            lblAcilama.Text = drIzin["aciklama"].ToString();
            lblGun.Text = drIzin["toplamGun"].ToString();
            lblSaat.Text = drIzin["toplamSaat"].ToString();
            lblAcil.Text = drIzin["ulasKisi"].ToString();
            lblTarih.Text = DateTime.Now.ToString();


            string PDFReportPath = ConfigurationManager.AppSettings["PDFReportPath"].ToString();
            string strExportFile = string.Empty;
            string guid = Guid.NewGuid().ToString().Substring(0, 8);

            strExportFile = Server.MapPath(PDFReportPath + guid + ".pdf");

            string fileName = strExportFile.Substring(strExportFile.LastIndexOf("\\"));
            //Response.ContentType = "application/pdf";
            //Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            pnlReport.RenderControl(hw);//pnlReport divi içindeki bilgileri yazdırır

            var htmlContent = sw.ToString();
            htmlContent = RemedyCharacters(htmlContent);
            var pdfBytes = (new NReco.PdfGenerator.HtmlToPdfConverter()).GeneratePdf(htmlContent);
 

            File.WriteAllBytes(strExportFile, pdfBytes);
            Response.Clear();
            MemoryStream ms = new MemoryStream(pdfBytes);
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename="+"(" +Session["AdSoyad"].ToString()+")"+ fileName);
            Response.Buffer = true;
            ms.WriteTo(Response.OutputStream);
            Response.End();


        }

        private string RemedyCharacters(string Characters)
        {
            Characters = Characters.Replace("ö", "&#246;");
            Characters = Characters.Replace("ç", "&#231;");
            Characters = Characters.Replace("ğ", "&#287;");
            Characters = Characters.Replace("ı", "&#305;");
            Characters = Characters.Replace("ü", "&#252;");
            Characters = Characters.Replace("ş", "&#351;");
            Characters = Characters.Replace("Ö", "&#214;");
            Characters = Characters.Replace("Ü", "&#220;");
            Characters = Characters.Replace("Ç", "&#199;");
            Characters = Characters.Replace("Ğ", "&#286;");
            Characters = Characters.Replace("Ş", "&#350;");
            Characters = Characters.Replace("İ", "&#304;");
            Characters = Characters.Replace("'", "&#39;");

            return Characters;
        }
    }
}