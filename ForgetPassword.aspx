<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="BTLWEB2.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>

<html>
<head>
    <title>Quên Mật Khẩu</title>
    <link rel="icon" href="../Image/logo.png" />
    <style type="text/css">
        /* Đặt font chữ toàn bộ trang */
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fdf2e9; /* Màu nền cam nhạt */
            color: #333; /* Màu chữ dễ nhìn */
        }

        /* Căn giữa form quên mật khẩu */
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

        /* Nút bấm */
        input[type="submit"], .button, .asp-button {
            background-color: #0bc54a;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

            input[type="submit"]:hover, .button:hover, .asp-button:hover {
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

        /* Tiêu đề Quên mật khẩu */
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
    <form>
        <div class="formcontainer">
            <table cellpadding="3" cellspacing="3">
                <tr>
                    <td>
                        <asp:LinkButton ID="lbtnLogin" runat="server" OnClick="lbtnLogin_Click" CssClass="dkbtn">Quay lại</asp:LinkButton>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <h2>QUÊN MẬT KHẨU</h2>
                    </td>
                </tr>
                <tr>
                    <td>Bạn là:</td>
                    <td>
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:RadioButtonList ID="rdolistRole" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                                <asp:ListItem>Nhân viên</asp:ListItem>
                                <asp:ListItem>Khách hàng</asp:ListItem>
                            </asp:RadioButtonList>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>Tên đăng nhập:</td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Mã:</td>
                    <td>
                        <asp:TextBox ID="txtID" runat="server" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Mật khẩu mới:</td>
                    <td>
                        <asp:TextBox ID="txtNewPassword" runat="server" Width="100%" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Nhập lại mật khẩu:</td>
                    <td>
                        <asp:TextBox ID="txtRepeatNewPassword" runat="server" Width="100%" TextMode="Password"></asp:TextBox>
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
                        <asp:Button ID="btnChangePassword" runat="server" CssClass="asp-button" Text="Đổi mật khẩu" OnClick="btnChangePassword_Click" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>Bạn chưa có tài khoản?
                        <asp:LinkButton ID="lbtnRegister" runat="server" CssClass="dkbtn" OnClick="lbtnRegister_Click">Đăng ký</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
</asp:Content>
