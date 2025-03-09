<%@ Page Title="Liên hệ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LienHe.aspx.cs" Inherits="BTLWEB2.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="w3-container w3-row-padding" style="margin: 150px 2%">
    <div class="w3-half w3-light-grey" style="">
      <div class="w3-card" style="">
        <div>
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2851.163766033942!2d105.94496365173222!3d21.020869607979492!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135a8c1afafff73%3A0x89a437ed0ab4a463!2zQ8O0bmcgYW4gVGjhu4sgdHLhuqVuIFRyw6J1IFF14buz!5e0!3m2!1svi!2s!4v1710949553181!5m2!1svi!2s"
            width="100%" height="450" style="border: 0" allowfullscreen="" loading="lazy"
            referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
        <div class="w3-container">
          <h4 style="font-weight: bold">CÔNG TY TNHH VIETNAM'S RICE</h4>
          <p>Trâu Quỳ, Gia Lâm, Hà Nội, Việt nam</p>
          <p>contractVNR@gmail.com</p>
        </div>
      </div>
    </div>

    <div class="w3-half w3-border" style="margin-top: 24px">
      <div style="padding: 36px">
        <h1 class="w3-center" style="font-weight: bold; font-size: 48px">
          LIÊN HỆ VỚI CHÚNG TÔI
        </h1>
        <form>
          <label for="fname">Tên cá nhân</label>
          <input class="w3-input" type="text" name="fname" id="" /><br />
          <label for="email">Email</label>
          <input class="w3-input" type="email" name="femail" id="" /><br />
          <label for="fnumber">Số điện thoại</label>
          <input class="w3-input" type="tel" name="fnumber" id="" /><br />
          <label for="faddress">Địa chỉ</label>
          <input class="w3-input" type="text" name="faddress" id="" /><br />
          <div class="w3-center">
            <input class="w3-button w3-border w3-round-large" type="submit" value="GỬI"
              style="width: 30%;font-weight: bold;" />
            <!-- <button class="w3-button w3-border w3-round-large	" onclick="sbt()">Hello</button> -->
          </div>
        </form>
      </div>
    </div>
  </div>
</asp:Content>
