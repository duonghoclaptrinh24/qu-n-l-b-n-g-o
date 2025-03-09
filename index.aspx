<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="BTLWEB2.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="shortcut icon" type="image/png" href="./img/logo1.png" />
    <link rel="stylesheet" href="./userScript/style.css" />
    <title>Website Bán Gạo</title>
    <style>
        @media (max-width:600px) {
            p {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="w3-top" id="navheader">
        <div class="w3-bar " style="height: 60px;">
            <div class="w3-bar-item " style="margin: 0; width: 200px;">
                <a href="./index.html"><img src="./img/logo1.png" alt="logo" style="width: 100%;margin-left: 24px;" /></a>
            </div>
            <div class="w3-dropdown-click w3-right" style="background-color: transparent;" id="dropmenu">
                <button class=" fa fa-bars" style="margin:20px 20px;background-color:transparent;border: none; cursor: pointer;"
                        onclick="drops()" id="dropdn"></button>
                <div class="w3-dropdown-content w3-bar-block w3-border" style="right:0" id="Demo">
                    <a href="./userScript/buy.html" class="w3-bar-item w3-button">MUA NGAY</a>
                    <a href="./index.html" class="w3-bar-item w3-button">TRANG CHỦ</a>
                    <a href="./gioithieu.html" class="w3-bar-item w3-button">GIỚI THIỆU</a>
                    <a href="./lienhe.aspx" class="w3-bar-item w3-button">LIÊN HỆ</a>
                </div>
            </div>
            <div class="w3-sidebar w3-bar-block w3-card w3-animate-right" style="display:none;right:0;width: 20%;"
                 id="rightMenu">
                <button onclick="closeRightMenu()" class="w3-bar-item  w3-large;" style="cursor: pointer;">
                    <p style="display: inline-block;">GIỎ HÀNG</p>
                    <p class="w3-right" style="display: inline-block;font-weight: bold;"> &times;</p>
                </button>
                <h3 style="margin-left: 10%;">Giỏ hàng của bạn còn trống. </h3>
            </div>
            <button class="w3-bar-item  w3-right fa fa-shopping-cart"
                    style="margin:10px 20px;cursor: pointer;background-color: transparent" onclick="openRightMenu()"></button>

            <div class="w3-right">
                <input type="text" class="w3-bar-item w3-input w3-round-xxlarge " placeholder="Search.."
                       style="margin:10px 0; display: none;" id="searchbar">
                <button id="close-btn" class="fa fa-close"
                        style="margin:20px 20px;background-color:transparent;border: none; cursor: pointer;display: none;"
                        onclick="searchClose('close-btn')"></button>
                <button id="search-btn" class="fa fa-search"
                        style="margin:20px 20px;background-color:transparent;border: none; cursor: pointer;"
                        onclick="searchDisplay('search-btn')"></button>
            </div>
            <a href="./lienhe.aspx" class="w3-bar-item  w3-right" style="margin:10px 20px">LIÊN HỆ </a>
            <div class="w3-bar-item"></div>
            <a href="./gioithieu.html" class="w3-bar-item  w3-right" style="margin:10px 20px">GIỚI THIỆU</a>
            <a href="./userScript/buy.html" class="w3-bar-item  " style="margin:10px 20px;font-weight: bold;">SHOP NOW!</a>
            <a href="" class="w3-bar-item  w3-right" style="margin:10px 20px;">TRANG CHỦ</a>

        </div>
    </div>



    <div class=" w3-display-container " style="margin-top: 40px;">
        <img class="mySlides w3-animate-right" src="./img/C4B6IKNI_output_0.jpg" alt="" style="width: 100%;" />
        <img class="mySlides w3-animate-right" src="./img/OIG3 (2)-fotor-2024031583617.jpg" alt=""
             style="width: 100%; " />
        <img class="mySlides w3-animate-right" src="./img/6V4AOZNY_output_0.jpg" alt="" style="width: 100%;" />
        <img class="mySlides w3-animate-right" src="./img/fotor-2024031583510.jpg" alt="" style="width: 100%; " />
        <div class="w3-display-right w3-display-hover">
            <button class="w3-button w3-light-grey fa fa-arrow-right " onclick="plusDivs(1)" style="height: 100px;"></button>
        </div>
        <div class="w3-display-left w3-display-hover">
            <button class="w3-button w3-light-grey fa fa-arrow-left" onclick="plusDivs(-1)" style="height: 100px;"></button>
        </div>
    </div>

    <div class="w3-container " style="">
        <div class="w3-rows" style="margin-top: 64px;">
            <div class="w3-half w3-padding-large " style="">
                <h1 class="w3-center" style="font-weight: bold;font-size:56px;">VỀ CHÚNG TÔI</h1>
                <p class="" style="font-size: 36px;font-family: 'Times New Roman', Times, serif;" id="about">
                    VietNam's Rice là một doanh nghiệp được thành lập vào năm 2024, với tầm nhìn và mục tiêu phát triển mạnh mẽ
                    trong ngành nông nghiệp, đặc biệt là về sản xuất và xuất khẩu gạo. Với sự kết hợp giữa sự nhiệt huyết và sự
                    chuyên nghiệp, chúng tôi cam kết mang lại những sản phẩm chất lượng nhất từ vùng đất màu mỡ và nước trong lành
                    của Việt Nam.
                </p>
                <a href="./gioithieu.html">
                    <button class="w3-button w3-round w3-green " style="font-size: 28px;">
                        Tìm hiểu
                        thêm
                    </button>
                </a>
            </div>
            <div class="w3-half ">
                <img src="./img/Gemini_Generated_Image.jpg" alt="" class="w3-image" style="width: 100%;">
            </div>
        </div>
    </div>

    <div class="w3-container  w3-light-grey " style="padding-bottom: 2%;padding-top: 36px;">
        <h1 class="w3-center" style="padding-bottom: 36px;font-size: 56px; font-weight: bold;">THÀNH TỰU</h1>
        <div class="w3-container w3-row-padding">
            <div class="w3-third">
                <div class="w3-card  w3-bar-item w3-border " style="width: 100%;margin-right: 5%; ">
                    <img src="./img/a1.jpg" alt="" style="width: 100%;">
                    <div class="w3-container ">
                        <h3 style="font-weight: bold;margin-top: 30px;">Chất lượng vượt trội</h3>
                        <p>VietNam's Rice cam kết cung cấp gạo chất lượng cao, đạt tiêu chuẩn quốc tế.</p>
                    </div>
                </div>
            </div>
            <div class="w3-third" style="">
                <div class="w3-card w3-bar-item w3-border" style="width: 100%">
                    <img src="./img/a2.jpg" alt="" style="width: 100%;">
                    <div class="w3-container ">
                        <h3 style="font-weight: bold;margin-top: 30px;">Tích lũy uy tín</h3>
                        <p>Với sự nỗ lực không ngừng, chúng tôi đã xây dựng được uy tín vững chắc trong ngành công nghiệp gạo.</p>
                    </div>
                </div>
            </div>
            <div class="w3-third">
                <div class="w3-card w3-bar-item w3-right w3-border" style=" width: 100%">
                    <img src="./img/a3.jpg" alt="" style="width: 100%;  ">
                    <div class="w3-container ">
                        <h3 style="font-weight: bold;margin-top: 30px;">Đóng góp cho cộng đồng</h3>
                        <p>
                            Chúng tôi không chỉ là doanh nghiệp kinh doanh mà còn đóng góp vào sự phát triển bền vững của cộng đồng
                            nông dân tại Việt Nam.
                        </p>
                    </div>
                </div>
            </div>
            <!-- <div class="w3-card-4 s4  " style="width: 25%; ">
              <img src="../img/1.jpg" alt="" style="width: 100%;padding: 5px;">
              <div class="w3-container w3-center">
                <p>Information</p>
              </div> -->
        </div>
    </div>
    </div>

    <div class="w3-container" style="margin-top: 24px;">
        <div style="padding: 36px;">
            <h1 class="w3-center" style="font-weight: bold;font-size: 56px;">ĐỐI TÁC</h1>
            <div class="w3-container">
                <div style="height: 50%;display: flexbox">
                    <a href="https://www.agribank.com.vn" target="_blank">
                        <img src="./logo/agribank-logo.com.png" alt=""
                             width="20%" style="margin: 2%;" loading="lazy">
                    </a>
                    <a href="https://vinafood2.com.vn" target="_blank">
                        <img src="./logo/hoi-vien-99.jpg" alt="" width="20%"
                             style="margin: 2%;" loading="lazy">
                    </a>
                    <a href="https://www.haagrico.com" target="_blank">
                        <img src="./logo/NHVL-1.jpg" alt="" width="20%"
                             style="margin: 2%;" loading="lazy">
                    </a>
                    <a href="https://vnua.edu.vn" target="_blank">
                        <img src="./logo/hvnnvn.jpg" alt="" width="20%"
                             style="margin: 2%;" loading="lazy">
                    </a>

                    <a href="https://www.cargill.com.vn" target="_blank">
                        <img src="./logo/Cargill_logo.svg.png" alt=""
                             width="20%" style="margin: 2%;" loading="lazy">
                    </a>
                    <a href="https://www.bayer.com/vi/vn/vietnam-home" target="_blank">
                        <img src="./logo/Logo_Bayer.svg.png"
                             alt="" width="20%" style="margin: 2%;" loading="lazy">
                    </a>
                    <a href="https://www.adm.com" target="_blank">
                        <img src="./logo/Archer_Daniels_Midland_logo.svg.png" alt=""
                             width="20%" style="margin: 2%;" loading="lazy">
                    </a>
                    <a href="https://www.cnh.com" target="_blank">
                        <img src="./logo/CNH_Industrial.svg.png" alt="" width="20%"
                             style="margin: 2%;" loading="lazy">
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <div class="w3-container w3-row-padding" style="margin-top: 64px;" id="footer">
        <div class="w3-quarter w3-center">
            <div style="margin: 24px 36px; color: gray; display:inline-block;">
                <a href=""><img src="./img/logo1.png" alt="logo" style=""></a>
                <p>Số điện thoại:0999.999.9999</p>
                <p>Email: contractVNR@gmail.com</p>
                <p>Địa chỉ: Trâu Quỳ, Gia Lâm, Hà Nội, Việt nam</p>
            </div>
        </div>

        <div class="w3-quarter w3-center">
            <div style="display: inline-block;color: gray;margin-top: 36px; margin-left:36px;">
                <p id="foot-tilte">SẢN PHẨM</p>
                <p style="margin: 10px 0;"><a href="" style="text-decoration: none;">Gạo Việt</a></p>
                <p style="margin: 10px 0;"><a href="" style="text-decoration: none;">Gạo Thái</a></p>
                <p style="margin: 10px 0;"><a href="" style="text-decoration: none;">Gạo Mỹ</a></p>
                <p style="margin: 10px 0;"><a href="" style="text-decoration: none;">Gạo Ấn Độ</a></p>
            </div>
        </div>
        <div class="w3-quarter w3-center">
            <div style="display: inline-block;color: gray;margin-top: 36px; margin-left:36px;">
                <p id="foot-tilte">LIÊN HỆ</p>
                <p style="margin: 10px 0;"><a href="" style="text-decoration: none;">Truyền thông</a></p>
                <p style="margin: 10px 0;"><a href="" style="text-decoration: none;">Thông cáo báo chí</a></p>
                <p style="margin: 10px 0;"><a href="" style="text-decoration: none;">Tin tức sự kiện</a></p>
                <p style="margin: 10px 0;"><a href="" style="text-decoration: none;">Thư viện</a></p>
            </div>
        </div>

        <div class="w3-quarter w3-center">
            <div style="display: inline-block;color: gray; margin-top: 36px;  margin-left:36px;">
                <p id="foot-tilte" style=" margin-bottom: 31px;">CÔNG TY TNHH VIETNAM'S RICE</p>
                <p style="margin: 10px 0;"><a href="" style="text-decoration: none;">Mã số thuế:01354968720</a></p>
                <p style="margin: 10px 0;"><a href="" style="text-decoration: none;">Ngày thành lập: 15/03/2024</a></p>
                <p style="margin: 10px 0;">
                    <a href="" style="text-decoration: none;">
                        Lĩnh vực: Nông nghiệp, lương thực phẩm,<br>
                        xuất nhập khẩu lương thực, phát triển nông thôn
                    </a>
                </p>
            </div>
        </div>
    </div>
    <script src="./userScript/script.js">
    </script>
</body>
</html>
