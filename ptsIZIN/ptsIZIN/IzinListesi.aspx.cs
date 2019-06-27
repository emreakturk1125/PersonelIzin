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
    public partial class İzinListesi : System.Web.UI.Page
    {
        Metodlar klas = new Metodlar();
        string izinID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //izinID = Session["izinID"].ToString();
            //LiteralPdfFormat.Text = "<a href=\"IzinRaporu.aspx\"><span class=\"glyphicon glyphicon-info-sign\"></span>PDF'e Aktar</a>";
            if (Session["personelID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                //PersonelGetir(null);
                List<string> durumlar = new List<string>();

                durumlar.Add(((int)Enumlar.IzinDurum.ISLEME_ALINDI).ToString());

                PersonelGetir(durumlar);
            }
        }

        private void PersonelGetir(List<string> durumListe)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT dbo.Izin.izinID, dbo.Bolum.bolumAdi, dbo.Personel.ad, dbo.Personel.personelID, dbo.Personel.soyad,dbo.Izin.toplamGun,dbo.Izin.toplamSaat,dbo.Izin.ulasKisi ,dbo.Izin.baslamaTarihi,dbo.Izin.aciklama,dbo.Izin.izinTuru, dbo.Izin.bitisTarihi, dbo.Izin.durum, dbo.Izin.islemTarihi, dbo.Izin.onaylayan, dbo.Izin.onayTarihi FROM  dbo.Bolum INNER JOIN dbo.Personel ON dbo.Bolum.bolumID = dbo.Personel.bolumID INNER JOIN dbo.Izin ON dbo.Personel.personelID = dbo.Izin.personelID where dbo.Personel.Aktif=1";

             

            if (durumListe != null)
            {
                if (durumListe.Count > 0)
                {
                    cmd.CommandText += " and durum IN (";
                    for (int i = 0; i < durumListe.Count; i++)
                    {
                        cmd.CommandText += durumListe[i] + ",";
                    }
                    cmd.CommandText = cmd.CommandText.Substring(0, cmd.CommandText.Length - 1);
                    cmd.CommandText += ")";
                }
            }

            DataTable dtkullanıcı = klas.GetDataTable(cmd);
            dtIzinlerListesi.DataSource = dtkullanıcı;
            dtIzinlerListesi.DataBind();
        }

        protected void btnCikis_Click(object sender, EventArgs e)
        {
            Session.Remove("personelID");
            Response.Redirect("Login.aspx");
        }

        protected void lblpdfAktar_Click(object sender, EventArgs e)
        {
            Response.Redirect("IzinRaporu.aspx");
        }

        protected void dtIzinlerListesi_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "PDFFormati")
            {
                Response.Redirect("IzinRaporu.aspx?izinID=" + e.CommandArgument);
            }
        }

    }
}