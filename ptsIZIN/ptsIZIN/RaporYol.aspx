<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RaporYol.aspx.cs" Inherits="ptsIZIN.RaporYol" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="img/users.ico" rel="shortcut_icon" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/default.min.css" rel="stylesheet" />
    <link href="css/alertify.min.css" rel="stylesheet" />
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/alertify.min.js"></script>

     <style type="text/css">
        .area {
            margin-top: 20px;
            position: relative;
            margin-left: auto;
            margin-right: auto;
        }

        .container {
            margin-bottom: 20px;
            margin-top: 20px;
        }
       </style>  
</head>
<body>
    <form id="form1" runat="server">
     <div class="container">


            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#">Rapor Resim Yolu Ekle</a></li>
            </ul>

         <div class="area">
                <table style="position: relative; margin: auto; width: 450px">
                    <asp:Panel ID="Pnlsifre" runat="server">
                        <tr>
                            <td style="width: 30%"><b>Yol :</b></td>
                            <td style="width: 30%">
                                <asp:TextBox ID="txtboxResimYolu" Width="400px" CssClass="form-control" placeholder="Resmin bulunduğu klasör yolunu ekleyiniz.." runat="server" required></asp:TextBox>
                            </td>
                            
                             
                        </tr>
                        <tr>
                            <td>&nbsp
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 30%"></td>
                            <td>
                                
                                <a href="IzinListesi.aspx">
                                    <button type="button" class="btn btn-success">Geri</button>
                                </a>

                                <span class="icon-input-btn"><span class="glyphicon glyphicon-envelope" style="color: white"></span>
                                    <asp:Button ID="btnResimYoluekle" CssClass="btn btn-primary"  OnClick="btnResimYoluekle_Click" Text="Ekle" runat="server"  />
                                </span>
                            </td>
                        </tr>

                    </asp:Panel>
                </table>
            </div>
    </form>
</body>
</html>
