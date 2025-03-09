<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="BTLWEB2.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Trang cá nhân</title>
    <style type="text/css">
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f1f3f8;
            margin: 0;
            padding: 0;
        }

        .formcontainer {
            max-width: 800px;
            margin: 100px auto;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 32px;
            font-weight: 700;
            color: #2c3e50;
            text-align: left;
            margin-bottom: 30px;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        td {
            padding: 10px 0;
            vertical-align: middle;
        }

        .label {
            width: 35%;
            font-size: 18px;
            color: #2c3e50;
            font-weight: 600;
        }

        input[type="text"], input[type="password"], .asp-textbox {
            width: 100%;
            padding: 14px;
            border: 1px solid #ccd1d9;
            border-radius: 8px;
            font-size: 16px;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #3498db;
        }

        .btn {
            padding: 14px 24px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .btn:hover {
            background-color: #2980b9;
            box-shadow: 0 6px 20px rgba(52, 152, 219, 0.3);
        }

        .btn-secondary {
            background-color: #2ecc71;
        }

        .btn-secondary:hover {
            background-color: #27ae60;
        }

        .message-label {
            color: #e74c3c;
            font-size: 16px;
        }

        .form-section {
            margin-bottom: 40px;
        }

        .form-section:last-child {
            margin-bottom: 0;
        }

        @media (max-width: 768px) {
            form {
                padding: 20px;
            }

            .label {
                width: 100%;
            }

            td {
                display: block;
                width: 100%;
            }

            input[type="text"], input[type="password"] {
                width: 100%;
            }

            .btn {
                width: 100%;
            }
        }
        .auto-style1 {
            width: 500px;
            border-style: solid;
            border-width: 3px;
        }
    </style>
</head>
<body>
    <div class="formcontainer">
        <!-- Login/Logout Buttons Section -->
        <div class="form-section">
            <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-secondary" OnClick="btnLogin_Click" Text="Đăng nhập" Visible="false"/>
            <asp:Button ID="btnLogout" runat="server" CssClass="btn btn-secondary" OnClick="btnLogout_Click" Text="Đăng xuất" />
        </div>

        <!-- Personal Information Section -->
        <div style="display:flex;position:relative">
            <h2 style="margin-right:100px">Thông tin cá nhân</h2>
            <h2 class="w3-button w3-blue" style="position:absolute;right:0"><asp:LinkButton ID="lbtnUpdate" runat="server" OnClick="lbtnUpdate_Click">Sửa</asp:LinkButton></h2>
        </div>
        <asp:Panel ID="pnKhach" runat="server">
            <table>
                <tr>
                    <td class="label">Mã khách hàng:</td>
                    <td>
                        <asp:TextBox ID="txtID" runat="server" ReadOnly="True" CssClass="asp-textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">Họ và tên:</td>
                    <td>
                        <asp:TextBox ID="txtFullName" runat="server" ReadOnly="True" CssClass="asp-textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">Địa chỉ:</td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" ReadOnly="True" CssClass="asp-textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">Số điện thoại:</td>
                    <td>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" ReadOnly="True" CssClass="asp-textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btnSave" runat="server" CssClass="btn" Enabled="False" Text="Lưu thông tin" OnClick="btnSave_Click" />

                    </td>
                </tr>
            </table>
        </asp:Panel>

        <!-- Password Change Section -->
        <asp:Panel ID="pnNhanVien" runat="server">
            
    <table>
        <tr>
            <td class="label">Mã nhân viên:</td>
            <td>
                <asp:TextBox ID="txtNVID" runat="server" ReadOnly="True" CssClass="asp-textbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="label">Tên nhân viên:</td>
            <td>
                <asp:TextBox ID="txtNVName" runat="server" ReadOnly="True" CssClass="asp-textbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="label">Giới tính:</td>
            <td>
                <asp:TextBox ID="txtNVgioitinh" runat="server" ReadOnly="True" CssClass="asp-textbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="label">Địa chỉ:</td>
            <td>
                <asp:TextBox ID="txtNVdiachi" runat="server" ReadOnly="True" CssClass="asp-textbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="label">Điện thoại:</td>
            <td>
                <asp:TextBox ID="txtNVdienthoai" runat="server" ReadOnly="True" CssClass="asp-textbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="label">Ngày sinh:</td>
            <td>
                <asp:TextBox ID="txtNVNgaysinh" runat="server" ReadOnly="True" CssClass="asp-textbox" TextMode="DateTime"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lblMessageNV" runat="server" CssClass="message-label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnSaveInforNV" runat="server" CssClass="btn" Text="Lưu thông tin" Enabled="False" OnClick="btnSaveInforNV_Click" />

            </td>
        </tr>
    </table>
</asp:Panel>

        <h2>Đổi mật khẩu</h2>
        <div class="form-section">
            <table>
                <tr>
                    <td class="label">Tài khoản:</td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server" ReadOnly="True" CssClass="asp-textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">Mật khẩu cũ:</td>
                    <td>
                        <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password" CssClass="asp-textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">Mật khẩu mới:</td>
                    <td>
                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="asp-textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">Nhập lại mật khẩu mới:</td>
                    <td>
                        <asp:TextBox ID="txtRepeatNewPassword" runat="server" TextMode="Password" CssClass="asp-textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="lblPassWordChageMessage" runat="server" CssClass="message-label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btnChangePassword" runat="server" CssClass="btn" OnClick="btnChangePassword_Click" Text="Thay đổi mật khẩu" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>

</asp:Content>
