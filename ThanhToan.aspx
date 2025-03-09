<%@ Page Title="Thanh toán" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="BTLWEB2.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        .container {
            max-width: 1200px;
            margin: 0 auto;
            margin-top: 20px;
        }
        .shipping-address, .order-summary, .payment-method-section {
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .payment-method {
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }
        .payment-method img {
            width: 40px;
            margin-right: 10px;
        }
        .payment-method input[type="radio"] {
            margin-right: 10px;
        }
        .apply-discount {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .apply-discount input {
            flex-grow: 1;
            padding: 5px;
        }
        .apply-discount button {
            margin-left: 10px;
            padding: 5px 15px;
        }
        .summary {
            margin-top: 20px;
        }
        .summary p {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
        }
        .total {
            font-weight: bold;
            color: #ff5722;
        }
        .checkout-btn {
            background-color: #ff5722;
            color: white;
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .checkout-btn:hover {
            background-color: #e64a19;
        }
    </style>
</head>
<body>
<!-- Container -->
<div class="w3-container container" style="margin-top:100px">
    <div class="w3-row-padding">
        <!-- Cột bên trái: Địa chỉ giao hàng và thông tin đơn hàng -->
        <div class="w3-col l6 m12">
            <!-- Địa chỉ giao hàng -->
            <div class="shipping-address w3-card">
                <h3>Địa chỉ giao hàng</h3>
                <p runat="server" id="tenkh"></p>
                <p runat="server" id="diachikh"></p>
                <p runat="server" id="sdtkh"></p>
            </div>

            <!-- Thông tin đơn hàng -->
            <div class="order-summary w3-card">
                <h3>Thông tin đơn hàng</h3>
                <div class="w3-container" runat="server" id="lspdh">
                </div>
            </div>
        </div>

        <!-- Cột bên phải: Phương thức thanh toán và nút đặt hàng -->
        <div class="w3-col l6 m12">
            <div class="payment-method-section w3-card">
                <h3>Chọn phương thức thanh toán</h3>

                <!-- Phương thức thanh toán 1 -->
                <div class="payment-method">
                    <input type="radio" name="payment" id="momo" checked>
                    <img src="logo/Logo-MoMo-Circle.jpg" alt="MoMo">
                    <label for="momo">Ví MoMo</label>
                    
                </div>

                <!-- Phương thức thanh toán 2 -->
                <div class="payment-method">
                    <input type="radio" name="payment" id="cash">
                    <img src="icon/cash.jpg" alt="Cash">
                    <label for="cash">Thanh toán khi nhận hàng</label>
                    
                </div>

                <!-- Mã giảm giá -->
                <div class="apply-discount">
                    <input type="text" placeholder="Nhập mã giảm giá (mã chỉ áp dụng 1)">
                    <button class="w3-button w3-teal">ÁP DỤNG</button>
                </div
                            <div class="order-summary w3-card">
                <h3>Thông tin đơn hàng</h3>
                <div>
                    <p id="tamtinh" runat="server"></p>
                    <p id="fee" runat="server"></p>
                    <p class="total" id="total" runat="server"></p>
                </div>
            </div>

                <!-- Nút đặt hàng -->
                <button class="checkout-btn" onclick="showMessage()">ĐẶT HÀNG</button>
            </div>
        </div>
    </div>
</div>
    <script type="text/javascript">
        function showMessage() {
            alert("Đã đặt hàng thành công!");
        }
    </script>
</body>
</asp:Content>
