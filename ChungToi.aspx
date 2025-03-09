<%@ Page Title="Về chúng tôi" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChungToi.aspx.cs" Inherits="BTLWEB2.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./userScript/style.css">
    <link rel="shortcut icon" type="image/png" href="./img/logo1.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        img + h4 {
            text-align: center;
        }

        h4 + p {
            text-align: center;
            font-style: italic;
        }

        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container " style="margin-top: 150px;">
        <div class="row">
            <div class="col-md-8 ">
                <h1 style=" font-size: 56px;font-weight: bold;">Sơ Lược Về Công Ty</h1>
                <h3 style="">
                    Tháng 3/2024 thành lập Công ty cổ phần VietNam's Rice: là Công ty mẹ và là đầu
                    não quản lý, cấp vốn, điều hành tất cả các Công ty con và dự án. Ông Dương Quang Bảo là Chủ tịch HĐQT.
                </h3>
                <h3>Cho đến nay, với hơn 25 ngày phát triển:</h3>
                <ul>
                    <li>Trên 5 dự án đã triển khai </li>
                    <li>Đội ngũ nhân sự trên 4 người</li>
                    <li>Đạt được sự tín nhiệm từ khách hàng và đối tác.</li>
                    <li>Đóng góp tích cực vào phát triển kinh tế và xã hội của Việt Nam.</li>
                    <li>Áp dụng công nghệ tiên tiến để nâng cao chất lượng sản phẩm và dịch vụ.</li>
                    <li>Tạo ra các cơ hội việc làm và phát triển nghề nghiệp cho cộng đồng lao động.</li>
                </ul>
            </div>
            <div class="col-md-4">
                <img src="./img/anhdaidien.jpg" alt="gao" style="width: 100%;">
                <h4 style="font-weight: bold;">Ông Dương Quang Bảo</h4>
                <p>Chủ tịch HĐQT</p>

            </div>
        </div>

    </div>


    <div id="demo" class="carousel slide" data-bs-ride="carousel">
        <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev"
                style="color: black;">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
        <!-- Indicators/dots -->
        <div class="carousel-indicators">
            <button type="button" style="color: aqua;" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
        </div>

        <!-- The slideshow/carousel -->
        <div class="carousel-inner" style="height: 700px;">
            <div class="carousel-item active" style="height: 100%;">
                <img src="./img/bacthang.jpg" alt="Chicago" class="d-block" style=" width: 100%;">
            </div>
            <div class="carousel-item" style="height: 100%;">
                <img src="./img/gatlua.jpg" alt="Chicago" class="d-block" style="width:100%">
            </div>
            <div class="carousel-item" style="height: 100%;">
                <img src="./img/lam nong.jpg" alt="Chicago" class="d-block" style="width:100%">
            </div>

        </div>
    </div>

    </div>
    <h2 class="text-center m-5" style="font-size: 56px;font-weight: bold; ">Hội Đồng Quản Trị</h2>
    <div class="container">
        <div class="row ">
            <div class=" col-xl-4 col-md-4 co-sm-6 mb-5">
                <img src="./img/anhdaidien.jpg" style="border-radius: 50%;width: 100%;"
                     alt="a">
                <h2 class="text-center" style="font-weight: bold;">Ông Tạ Mạnh Doanh</h2>
                <p class="text-center" style="font-style: italic;">Phó Chủ Tịch HĐQT</p>

            </div>
            <div class="  col-xl-4 col-md-4 co-sm-6 mb-5 ">
                <img src="./img/anhdaidien.jpg" style="border-radius: 50%;width: 100%;"
                     alt="a">
                <h2 class="text-center " style="font-weight: bold;">Ông Dương Quang Bảo</h2>
                <p class="text-center" style="font-style: italic;">Chủ tịch HĐQT</p>
            </div>
            <div class="  col-xl-4 col-md-4 co-sm-6 mb-5">
                <img src="./img/anhdaidien.jpg" style="border-radius: 50%;width: 100%;"
                     alt="a">
                <h2 class="text-center " style="font-weight: bold;">Ông Trần Nguyễn Minh Hùng</h2>
                <p class="text-center" style="font-style: italic;">Tổng Giám Đốc IMG</p>
            </div>
        </div>
    </div>

    <div class="w3-container " style="background-image: url(https://img.vn/imgs/layout/bg_tn.jpg); height:300px">
        <h2 class="w3-center" style="color:#ffffff; font-size: 56px;font-weight: bold;">Tầm Nhìn Và Sứ Mệnh</h2><br><br>
        <p class="w3-center" style=" color: #ffffff ">
            Đầu tư chuyên nghiệp, nắm bắt cơ hội, kiên trì đến
            đích,
        </p> <br>
        <p class="w3-center" style=" color: #ffffff">
            sử dụng và cập nhật công nghệ cao, đối tác chất lượng,
            nhân sự giỏi, có trách nhiệm với xã hội và nhân viên.
        </p>
    </div>






    <h3 class="text-center " style="color: black;margin: 50px; font-size:56px;font-weight: bold;">Giá Trị Cốt Lõi</h3>
    <br>
    <div class="container">
        <div class="row">
            <div class="col-md-4 mx-auto ">
                <div class="diamond-frame">
                    <img src="https://img.vn/uploads/danhmuc/toc-do-1564025169-3nybd.png" class="img-fluid" alt="Your Image">


                </div>
                <h1 class="text-center m-5" style="color: black;">Tốc Độ</h1>
                <p class="text-center mb-5 ">Thực hiện deadline, <br> bảo đảm tiến độ</p>
            </div>
            <div class="col-md-4 mx-auto ">
                <div class="diamond-frame">
                    <img src="https://img.vn/uploads/danhmuc/hieu-qua-1564025194-zganp.png" class="img-fluid" alt="Your Image">
                </div>
                <h1 class="text-center m-5" style="color:black;">Trách Nhiệm</h1>
                <p class="text-center mb-5">Đặt chất lượng và hiệu quả công <br>việc lên trên</p>
            </div>
            <div class="col-md-4 mx-auto ">
                <div class="diamond-frame">
                    <img src="https://img.vn/uploads/danhmuc/trach-nhiem-1564025139-lbgfg.png" class="img-fluid" alt="Your Image">
                </div>
                <h1 class="text-center m-5  " style="color:black ;">Hiệu Quả</h1>
                <p class="text-center mb-5">
                    Với công việc, công trình, đối tác,<br> nhân viên, xã hội
                </p>
            </div>
        </div>
    </div>

   
    <script src="./userScript/script.js"></script>
</body>
</html>
</asp:Content>
