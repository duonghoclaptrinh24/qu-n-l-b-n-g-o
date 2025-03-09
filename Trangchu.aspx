<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Trangchu.aspx.cs" Inherits="BTLWEB2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

  <div class=" w3-display-container " style="margin-top: 40px;">
        <img class="mySlides w3-animate-right" src="./img/C4B6IKNI_output_0.jpg" alt="" style="width: 100%;" />
        <img class="mySlides w3-animate-right" src="./img/OIG3 (2)-fotor-2024031583617.jpg" alt=""
             style="width: 100%; " />
        <img class="mySlides w3-animate-right" src="./img/6V4AOZNY_output_0.jpg" alt="" style="width: 100%;" />
        <img class="mySlides w3-animate-right" src="./img/fotor-2024031583510.jpg" alt="" style="width: 100%; " />
        <div class="w3-display-right w3-display-hover">
            <button type="button" class="w3-button w3-light-grey fa fa-arrow-right " onclick="plusDivs(1)" style="height: 100px;"></button>
        </div>
        <div class="w3-display-left w3-display-hover">
            <button  type="button" class="w3-button w3-light-grey fa fa-arrow-left" onclick="plusDivs(-1)" style="height: 100px;"></button>
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
                
                    <a href="ChungToi.aspx" type="button" class="w3-button w3-round w3-green " style="font-size: 28px;">Tìm hiểu thêm</a>
                
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
 

</asp:Content>
