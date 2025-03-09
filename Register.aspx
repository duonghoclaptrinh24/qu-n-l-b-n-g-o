<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BTLWEB2.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Đăng ký</title>
    <style type="text/css">
        /* Đặt font chữ toàn bộ trang */
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fdf2e9; /* Màu nền cam nhạt */
            color: #333; /* Màu chữ dễ nhìn */
        }

        /* Căn giữa form đăng ký */
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

        /* Nút bấm đăng ký */
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
        .dnbtn {
            color: #FF6F00; /* Màu cam cho các liên kết */
            text-decoration: none;
        }

        .dnbtn:hover {
            text-decoration: underline;
        }

        /* Tiêu đề Đăng ký */
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
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Đăng ký"></asp:Label>
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
                    <td>Nhập lại mật khẩu:</td>
                    <td>
                        <asp:TextBox ID="txtRepeatPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Họ tên:</td>
                    <td>
                        <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Địa chỉ:</td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Số điện thoại:</td>
                    <td>
                        <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
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
                        <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Đăng ký" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        Bạn đã có tài khoản? <asp:LinkButton ID="lbLogin" runat="server" OnClick="lbLogin_Click" CssClass="dnbtn">Đăng nhập</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>

</asp:Content>
