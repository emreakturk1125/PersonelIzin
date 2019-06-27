<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IzinRaporu.aspx.cs" Inherits="ptsIZIN.IzinRaporu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .rapor td {
            padding: 20px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div id="pnlReport" runat="server">
            <%--   <asp:Label ID="lblIzinBaslangicTarihi" runat="server"></asp:Label>--%>
            <table class="rapor" border="1" bordercolor="black" style="width: 100%; height: 100%; " cellspacing="0">
                <tr style="height: 130px">

                   
                    <td style="border-right:none;width:30%">
                        
                        <center>
                       <%-- <img src="C:\Users\EMREAKTURK\Documents\Visual Studio 2013\Projects\ptsIZIN\ptsIZIN\img\amblem.png" />--%>
                         <asp:Image ID="resim1" runat="server" ImageUrl="#" />
                       </center>
                    </td>
                    <td style="border-left:none;padding-left:110px">
                        <h2>İZİN RAPORU</h2>    
                    </td>


                </tr>
                <div style="text-align:center">
                <tr style="height: 30px">

                    <td style="width: 30%">
                        <center> <b>AD SOYAD :</b> </center>
                       
                    </td>
                    <td colspan="2" style="width: 70%">
                        <center><asp:Label ID="lblAd" Text="text" runat="server" /></center> 
                    </td>

                </tr>

                <tr style="height: 170px">
                    <td>
                        <center><b>İZİN TÜRÜ :</b></center>
                    </td>
                    <td>
                        
                        <table cellspacing="0" style="text-align: center;width:100%;height:100%">
                            <tr>
                                <td style="width: 35%">
                                    YILLIK İZİN :  
                                </td>
                                <td style="width: 15%;border:1px solid black;border-top:none;border-bottom:none">
                                    <asp:Label ID="lblYillikIzin" Text="" runat="server" />
                                </td>
                                <td style="width: 35%">
                                    EVLİLİK İZNİ :
                                </td>
                                <td style="width: 15%;border-left:1px solid black">
                                    <asp:Label ID="lblEvlilikIzin" Text="" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    RAPORLU İZİN : 
                                </td>
                                <td style="border:1px solid black">
                                    <asp:Label ID="lblRaporluIzin" Text="" runat="server" />
                                </td>
                                <td>
                                    ÖLÜM İZNİ :
                                </td>
                                <td style="border:1px solid black;border-right:none">
                                    <asp:Label ID="lblOlumIzin" Text="" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    DOĞUM İZNİ :
                                </td>
                                <td style="border:1px solid black;border-bottom:none;border-top:none">
                                    <asp:Label ID="lblDogumIzin" Text="" runat="server" />
                                </td>
                                <td>
                                    YENİ İŞ ARAMA İZNİ :
                                </td>
                                <td style="border-left:1px solid black">
                                    <asp:Label ID="lblYeniIsIzin" Text="" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>

                </tr>

                <tr style="height: 30px">
                    <td>
                        <center><b>İZNE BAŞLAMA TARİHİ :</b></center>
                        
                    </td>
                    <td>
                        <center>  <asp:Label ID="lblIzneBaslama" Text="text" runat="server" /></center>
                    </td>
                </tr>

                <tr style="height: 30px">
                    <td>
                        <center><b>İZİN BİTİŞ TARİHİ :</b> </center>
                       
                    </td>
                    <td>
                        <center><asp:Label ID="lblIzinBitisTarihi" Text="text" runat="server" /></center>  
                    </td>
                </tr>
                <tr>
                    <td style="height: 30px">
                        <center><b>TOPLAM GÜN :</b></center>
                         
                    </td>
                    <td>
                        <center><asp:Label ID="lblGun" Text="text" runat="server" /></center>  
                    </td>
                </tr>
                <tr style="height: 30px">
                     <td>
                         <center><b>TOPLAM SAAT :</b></center> 
                     </td>
                    <td>
                        <center><asp:Label ID="lblSaat" Text="text" runat="server" /></center> 
                    </td>
                </tr>
                    <tr style="height:100px">
                        <td>
                            <center><b>ACİL DURUMLARDA ULAŞILACAK KİŞİ AD SOYAD- TELEFON :</b></center>   
                        </td>
                        <td>
                            <center> <asp:Label ID="lblAcil" Text="text" runat="server" /></center>
                           
                        </td>
                    </tr>
                <tr style="height: 100px">
                    <td>
                        <center><b>AÇIKLAMA :</b></center>
                        
                    </td>
                    <td>
                        <center><asp:Label ID="lblAcilama" Text="text" runat="server" /></center> 
                    </td>
                </tr>

                <tr style="height: 30px">
                    <td>
                        <center> <b>TARİH :</b></center>
                       
                    </td>
                    <td>
                        <center><asp:Label ID="lblTarih" Text="text" runat="server" /></center> 
                    </td>
                </tr>

                <tr style="height:200px">
                    <%-- <td style="border-right:none;border-bottom:none">
                    <b>Personel Ad-Soyad /İMZA</b>  
                </td>
                <td style="border-left:none;border-bottom:none">
                    <b>ONAY-Birim Amiri  Ad -Soyad/ İMZA </b>   
                </td>--%>
                    <td colspan="2" style="border-bottom: none;text-align:center">
                        <b>Personel Ad-Soyad /İMZA</b>
                        <b style="margin-left: 150px">
                             ONAY-Birim Amiri  Ad -Soyad/ İMZA

                        </b>
                    </td>


                </tr>
                <tr style="height: auto">
                    <td colspan="2" style="border-top:none">
                        <b>
                            <center>Genel Müdür ONAY</center> 

                        </b>
                    </td>
                </tr>
                    </div>
            </table>
        </div>
    </form>
</body>
</html>
