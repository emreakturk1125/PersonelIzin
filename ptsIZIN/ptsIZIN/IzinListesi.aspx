<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IzinListesi.aspx.cs" Inherits="ptsIZIN.İzinListesi" %>

 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>İzin Listesi</title>
    <link href="img/users.ico" rel="shortcut_icon" />
    <script src="js/jquery.min.js"></script>
     <link rel="stylesheet" href="css/bootstrap.min.css"/>
  <script src="js/bootstrap.min.js" ></script>
    <link href="css/jquery.dataTables.min.css" rel="stylesheet" />
        <link href="css/default.min.css" rel="stylesheet" />
    <link href="css/alertify.min.css" rel="stylesheet" />
    <script src="js/jquery.dataTables.min.js"></script>
     <script src="js/alertify.min.js"></script>
    <link href="css/footable.min.css" rel="stylesheet" />
    <style type="text/css">
        .ustkısım {
            margin-bottom: 20px;
            margin-top: 20px;
        }
        /*.container{
             margin-bottom:20px;
            margin-top:20px;
        }*/
        .btn {
            margin-bottom: 10px;
        }

        .example th {
            text-align: center;
        }
    </style>
    <script type="text/javascript">

        $(document).ready(function () {
            $('#example').DataTable();
        });

        $(function () {
            $('#tblCustomers').footable();
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div class=" container">
            <div class="ustkısım">
                <ul class="nav nav-tabs">
                    <li role="presentation" class="active"><a href="#"> İzin Listesi</a></li>
                </ul>

            </div>

            <div class="btn" >
                <a href="IzinEkle.aspx">
                    <button type="button" id="btnIzinn" class="btn btn-primary " runat="server" ><span class="glyphicon glyphicon-plus"></span> İzin Ekle</button>

                </a>
                <asp:Button ID="btnCikis" Text="Güvenli Çıkış" runat="server" CssClass="btn btn-danger" OnClick="btnCikis_Click" />
               
               <%--<a href="IzinEkle.aspx">
                    <button type="button" id="Button1" class="btn btn-info " runat="server" ><span class="glyphicon glyphicon-cog"></span> Rapor İcon Ayarı</button>

                </a>--%>

                 <div class="btn-group">
                    <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-cog"></span> Rapor Ayarı</button>
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="RaporYol.aspx">Resim Yolu Ayarı</a></li>
                         
                    </ul>
                </div>
                            

            </div>
            <div style="margin-bottom: 20px">

                <%--<asp:CheckBox ID="cbOnaylananlar" runat="server" Text="Onaylananlar" OnCheckedChanged="cbOnaylananlar_CheckedChanged" AutoPostBack="true" />

                <asp:CheckBox ID="cbReddedilenler" runat="server" Text="Reddedilenler" OnCheckedChanged="cbReddedilenler_CheckedChanged" AutoPostBack="true" />--%>


<%--                <asp:CheckBox ID="cbIslemdeOlanlar" runat="server" Text="Henüz İşlemde Olanlar" OnCheckedChanged="cbIslemdeOlanlar_CheckedChanged" AutoPostBack="true" />--%>
               
            </div>
            <div class="list-group">
                <%--<table id="example" class="footable table table-bordered">--%>
                <table id="example" class="display  footable table table-bordered">
                    <thead>
                        <tr role="row">
                            <th style="width: 5%">Ad</th>
                            <th style="width: 5%">Soyad</th>
                            <%--<th style="width: 7%">Bölüm</th>--%>
                            <th style="width: 9%">İzin Baş.</th>
                            <th style="width: 9%">İzin Bit.</th>
                            <th style="width: 10%">İzin Türü</th>
                            <th style="width: 5%">T.Gün</th>
                            <th style="width: 5%">T.Saat</th>
                            <th style="width: 15%">Ulaşılacak Kişi</th>
                            <th style="width: 15%">Açıklama</th>
                            <%--<th style="width: 8%">Durumu</th>
                            <th style="width: 10%">İşlemi Yapan</th>
                            <th style="width: 10%">İşlem Tarihi</th>--%>
                            <th style="width: 10%">İşlem Tarihi</th>
                           <%-- <th id="thOnayla" runat="server" style="width: 5%">İşlem</th>--%>
                            <th style="width: 12%">İzin Raporu</th>

                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="dtIzinlerListesi" runat="server" OnItemCommand="dtIzinlerListesi_ItemCommand" >

                            <ItemTemplate>
                                <tr>
                                    <td style="width: 5%">
                                        <%#Eval("ad") %>
                                    </td>
                                    <td style="width: 5%">
                                        <%#Eval("soyad") %>
                                    </td>
                                   <%-- <td style="width: 7%">
                                        <%#Eval("bolumAdi") %>
                                    </td>--%>
                                    <td style="width: 9%">
                                        <%#Eval("baslamaTarihi") %>
                                    </td>
                                    <td style="width: 9%">
                                        <%#Eval("bitisTarihi") %>
                                    </td>
                                    <td style="width: 10%">
                                     <%--veritabanında boş olursa bu kısım hata verir--%>
                                    <%# ptsIZIN.Web.Utilities.EnumExtensionMethods.GetDescription((ptsIZIN.Enumlar.IzinTipi)Convert.ToInt32( Eval("izinTuru"))) %>
                                    </td>
                                     <td style="width: 5%">
                                        <%#Eval("toplamGun") %>
                                    </td>
                                     <td style="width: 5%">
                                        <%#Eval("toplamSaat") %>
                                    </td>
                                     <td style="width: 15%">
                                        <%#Eval("ulasKisi") %>
                                    </td>
                                    <td style="width: 15%">
                                        <%#Eval("aciklama") %>
                                    </td>
                           
                                    <td style="width: 10%">
                                        <%#Eval("islemTarihi") %>
                                    </td>
                                       <td style="width: 12%" id="tdPDF" runat="server">
                                          
                                          <asp:LinkButton ID="lblpdfAktar" runat="server"  CommandName="PDFFormati" CommandArgument='<%#Eval("izinID") %>'><span id="spanOnayla" runat="server" class="glyphicon glyphicon-download"></span> PDF'e Aktar</asp:LinkButton>
                                          
                                          <%--<asp:Literal ID="LiteralPdfFormat" runat="server"></asp:Literal>--%>
                                    </td>
                                    
                                    <%-- <td style="width: 5%" id="tdOnayla" runat="server">

                                          <asp:LinkButton ID="lbOnayla" runat="server"  CommandName="Onayla" onclick="lbOnayla_Click" CommandArgument='<%#Eval("izinID") %>'><span id="spanOnayla" runat="server" class="glyphicon glyphicon-ok-circle"></span>Onayla</asp:LinkButton>
                                          <asp:LinkButton ID="lbReddet" runat="server"  CommandName="Reddet" onclick="lbReddet_Click" CommandArgument='<%#Eval("izinID") %>'><span id="spanReddet" runat="server" class="glyphicon glyphicon-remove-circle"></span>Reddet</asp:LinkButton>
                                          <asp:LinkButton ID="lbKaldir" runat="server" Visible="false"  CommandName="Kaldir"  OnClick="lbKaldir_Click" CommandArgument='<%#Eval("izinID") %>'><span id="spanKaldir" runat="server" class="glyphicon glyphicon-remove-ban-circle"></span>Kaldır</asp:LinkButton>
                                        
                                    </td>--%>
       
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

        </div>


    </form>
</body>
</html>

