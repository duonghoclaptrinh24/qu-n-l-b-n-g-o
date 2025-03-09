<%@ Page Title="Sản phẩm" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SanPham.aspx.cs" Inherits="BTLWEB2.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     
    
   <div class="w3-container" style="margin-top:100px;font-size:24px"> 
        <div class="w3-breadcrumb w3-light-grey">
            <a href="Trangchu.aspx" class="w3-hover-opacity" style="font-weight:normal">Trang chủ</a> &gt;
            <span class="" style="font-weight:bold">Sản phẩm</span>
        </div>
    </div>

       <div class="w3-container" style=" padding: 0 52px;"> 
        <h1 id="topsell" style="font-size: 54px;" runat="server">Sản phẩm bán chạy</h1><br />
        <div class="w3-row-padding" id="hot" runat="server">

        </div>
    </div>

    <div class="w3-container w3-light-grey" style="margin: 150px 0px ; padding: 0 52px;" runat="server" id="allsp">
        <h1 id="" style="display: inline-block;font-size: 54px;" class="w3-half">Tất cả sản phẩm</h1>
            <div style="display: inline-flex; align-items: center; font-size: 40px; margin-left: 20px;">
                Loại:&nbsp;<asp:DropDownList ID="ddlLoai" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlLoai_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        <br/>
        <div class="w3-row-padding" id="sp" runat="server">
            
        </div>
        <div id="btn" runat="server" >

        </div>
    </div>
    
</asp:Content>
