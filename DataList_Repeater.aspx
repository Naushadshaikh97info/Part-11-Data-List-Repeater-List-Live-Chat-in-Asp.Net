<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="DataList_Repeater.aspx.cs" Inherits="DataList_Repeater" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="hom-slider">
        <div class="container">
            <div id="sequence">
                <ul class="sequence-canvas">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <li class="animate-in">
                                <h1 class="sltitle">
                                    <%#Eval("titel") %></h1>
                                <h2 class="subtitle">
                                    <%#Eval("name") %></h2>
                                <p class="description">
                                    <%#Eval("detils") %></p>
                                <img class="model" src='<%#Eval("img") %>' alt="slide-01" />
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <div class="slider-pagin">
                    <ul class="sequence-pagination">
                        <asp:Repeater ID="Repeater3" runat="server">
                            <ItemTemplate>
                                <li><a>
                                    <img src='<%#Eval("img") %>' alt="slide-01" /></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="4">
        <ItemTemplate>
            <div class="products">
                <div class="products-top">
                    <div class="thumbnail">
                        <img src='<%#Eval("img") %>' alt="Product Name" height="270px" width="280px">
                    </div>
                    <div class="productname">
                        <%#Eval("p_name") %></div>
                    <div class="overly">
                        <a href="images/products/large/products-01.png" data-fancybox-group="newer" class="fancybox veiwphoto"
                            title="Lorem ipsum dolor sit amet"><i class="fa fa-picture-o">&nbsp;</i></a>
                        <a href="products_details2.html" class="linkdetail"><i class="fa  fa-link"></i></a>
                        <h3 class="overlyprice">
                            <%#Eval("p_price") %></h3>
                        <span class="overlyrating"><i class="fa fa-star blue"></i><i class="fa fa-star blue">
                        </i><i class="fa fa-star blue"></i><i class="fa fa-star-half-o blue"></i><i class="fa fa-star-o">
                        </i></span>
                    </div>
                </div>
                <div class="products-bottom">
                    <h4 class="price">
                        <%#Eval("p_price") %></h4>
                    <p class="name">
                        <%#Eval("p_name") %></p>
                    <div class="button_group">
                        <button type="button" class="button" onclick="location.href='products_details.html';">
                            Add To Cart</button>
                        <button data-original-title="Compare" data-placement="top" data-toggle="tooltip"
                            class="tool button" type="button">
                            <i class="fa fa-exchange"></i>
                        </button>
                        <button data-original-title="Favourite" data-placement="top" data-toggle="tooltip"
                            class="tool button" type="button">
                            <i class="fa fa-heart-o"></i>
                        </button>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <div class="brandingwrap">
        <div class="container">
            <div class="logocarousel">
                <div class="logo-control">
                    <a id="prev_logo" class="prev" href="#">&lt;</a><a id="next_logo" class="next" href="#">&gt;</a></div>
                <ul id="brandlogo">
                    <asp:Repeater ID="Repeater2" runat="server">
                        <ItemTemplate>
                            <li><a href="#" class="">
                                <img src='<%#Eval("img") %>' alt="" />
                            </a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
