<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ptsIZIN.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Personel Giriş Sayfası</title>
     <link rel="stylesheet" href="css/bootstrap.min.css"/>
  <script src="js/bootstrap.min.js" ></script>
     <style type="text/css">
        .icon-input-btn {
            display: inline-block;
            position: relative;
        }

            .icon-input-btn input[type="submit"] {
                padding-left: 2em;
            }

            .icon-input-btn .glyphicon {
                display: inline-block;
                position: absolute;
                left: 0.65em;
                top: 30%;
            }
    </style>


    <script type="text/javascript">
        $(document).ready(function () {
            $(".icon-input-btn").each(function () {
                var btnFont = $(this).find(".btn").css("font-size");
                var btnColor = $(this).find(".btn").css("color");
                $(this).find(".glyphicon").css("font-size", btnFont);
                $(this).find(".glyphicon").css("color", btnColor);
                if ($(this).find(".btn-xs").length) {
                    $(this).find(".glyphicon").css("top", "24%");
                }
            });
        });
</script>

</head>
<body style="background-image: url(img/background.png)" >
 <form id="form1" runat="server">
<div class="container">
        <div class="row">
            <p>
                <br />
            </p>
            <div class="col-md-4"></div>

            <div class="col-md-4">

                <div class="panel panel-default">
                    <div class="panel-heading" style="text-align: center; color:black">
                        <h2>İzin Rapor Sistemi</h2>
                    </div>
                    <div class="panel-body">
                        <%-- <div class="page-header" style="text-align:center">
                            <h2>Personel Kayıt Sistemi</h2>
                        </div>--%>
                       



                            <div class="form-group">
                                <label for="exampleInputEmail1">E-Posta</label>

                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user"></span></span>
                                    <table>
                                        <tr>
                                            <td style="width: 50%">
                                                <asp:TextBox ID="TextBoxemail" CssClass="form-control" placeholder="E-Posta" runat="server" required></asp:TextBox>
                                                <%--<asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="E-Posta" runat="server" type="email"  required></asp:TextBox>--%>
                                            </td>
                                            <td>
                                                <span class="form-control">@</span>
                                            </td>
                                            <td style="width: 48%">
                                                <asp:DropDownList ID="ddlEmailProviders" runat="server" AppendDataBoundItems="true" CssClass="form-control" required>
                                                    <asp:ListItem Text="-Seçiniz-" Value=""></asp:ListItem>
                                                    <asp:ListItem Text="medoc.com.tr" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="hotmail.com" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="gmail.com" Value="3"></asp:ListItem>
                                                     <asp:ListItem Text="yahoo.com" Value="4"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>

                                    </table>

                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Şifre</label>
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-star"></span></span>
                                    <asp:TextBox ID="TextBoxsifre" CssClass="form-control" placeholder="Şifre" runat="server" TextMode="Password" required></asp:TextBox>

                                </div>
                            </div>
                           <%--  <hr />
                        <div class="checkbox">
                                <label>

                                    <asp:CheckBox ID="Cbhatirla" runat="server" />Beni Hatırla
                                </label>
                            </div>--%>

                            <hr />
                            <%--<a href="UyeOl.aspx">
                                <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span> Üye Ol</button>
                            </a>--%>
                            <a href="UyeOl.aspx">
                                <button type="button" class="btn btn-success"> Üye Ol</button>
                            </a>
                             <%--<span class="icon-input-btn"><span class="glyphicon glyphicon-ok-sign" style="color: white"></span>
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Giriş" OnClick="btnGiris_Click"   />
                            </span>--%>
                             
                                <asp:Button ID="btnGiris" runat="server" CssClass="btn btn-primary" Text="Giriş" OnClick="btnGiris_Click"   />
                           
                           <p>
                                <br />
                            </p>
                            <div>
                                <asp:Literal ID="LiteralSifreUnuttum" runat="server"></asp:Literal>
                            </div>
                            <p>
                                <br />
                            </p>
                            <asp:Label ID="lblUyari" runat="server" ForeColor="#d43f3a"></asp:Label>
                        
                    </div>

                </div>

            </div>
            <div class="col-md-4"></div>
        </div>
    </div>

    </form>
   


</body>
</html>
