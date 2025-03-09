<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BTLWEB2.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!DOCTYPE html>

<html>
<head>
    <title>Đăng nhập</title>
    <link rel="icon" href="../Image/logo.png"/>

    <style type="text/css">
        /* Đặt font chữ toàn bộ trang */
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fdf2e9; /* Màu nền cam nhạt */
            color: #333; /* Màu chữ dễ nhìn */
        }

        /* Căn giữa form đăng nhập */
        .formcontainer {
            max-width: 500px;
            margin: 100px auto; /* Căn giữa và thêm khoảng cách trên/dưới */
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Phong cách cho các ô input */
        input[type="text"], input[type="password"], input[type="email"] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* Nút bấm đăng nhập */
        input[type="submit"], .button {
            background-color: #0bc54a;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        input[type="submit"]:hover, .button:hover {
            background-color: #0eff5f;
        }

        /* Phong cách cho liên kết */
        .dkbtn {
            color: #FF6F00; /* Màu cam cho các liên kết */
            text-decoration: none;
        }

        .dkbtn:hover {
            text-decoration: underline;
        }

        /* Tiêu đề Đăng nhập */
        h1, h2, h3, h4, h5, h6 {
            color: #FF6F00; /* Màu cam cho tiêu đề */
            text-align: center;
            margin: 20px 0;
        }

        table {
            width: 100%; /* Đảm bảo form chiếm toàn bộ chiều rộng */
        }

    </style>
</head>
<body>
    <div class="formcontainer">
        <div>
            <table cellpadding="3" cellspacing="3" class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Đăng nhập"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Tên đăng nhập:</td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Mật khẩu:</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:CheckBox ID="chkRememberInfor" runat="server" Text="Remember me" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Đăng nhập" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#FF6600" OnClick="LinkButton1_Click">Quên mật khẩu?</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        Bạn chưa có tài khoản? <asp:LinkButton ID="lbRegister" runat="server" OnClick="lbRegister_Click" CssClass="dkbtn">Đăng ký</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>

</asp:Content>
