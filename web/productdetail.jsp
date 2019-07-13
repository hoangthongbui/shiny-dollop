<%-- 
    Document   : productdetail
    Created on : Jul 5, 2019, 9:18:07 PM
    Author     : stephen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="xm" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/homepage.css" type="text/css"/>
        <link rel="stylesheet" href="CSS/productDetail.css" type="text/css"/>
        <link rel="stylesheet" href="CSS/productItem.css" type="text/css"/>
        <link rel="stylesheet" href="CSS/modal.css" type="text/css"/>
        <title>Chi Tiết Sản Phẩm</title>
    </head>
    <body>
        <c:set var="result" value="${requestScope.PRODUCT_DETAIL}" />
        <c:set var="resultRelated" value="${requestScope.PRODUCT_RELATED}"/>
        <c:import var="DetailXSL" url="XSLT/html/ProductDetail.xsl" charEncoding="UTF-8" /> 
        <c:import var="ProductXSL" url="XSLT/html/Product.xsl" charEncoding="UTF-8" />
        <div class="topnav">
            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 426.668 426.668" style="enable-background:new 0 0 426.668 426.668;" xml:space="preserve" width="30px" height="30px"><g><path d="M401.788,74.476c-63.492-82.432-188.446-33.792-188.446,49.92  c0-83.712-124.962-132.356-188.463-49.92c-65.63,85.222-0.943,234.509,188.459,320.265  C402.731,308.985,467.418,159.698,401.788,74.476z" data-original="#F05228" class="active-path" data-old_color="#F05228" fill="#FC2E51"/></g> </svg>
            <a href="NavigateServlet?page=homepage">Trang chủ</a>
            <a id="myBtn">Gợi ý sản phẩm</a>
            <div class="search-container">
                <input size="450" id="search" type="text" placeholder="Tìm đầm bé gái, áo bé trai,....vv"/>
                <div id="searchProduct">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="main">
                <h1>Chi tiết sản phẩm</h1>
                <xm:parse var="resultXML" xml="${result}" scope="request" />
                <c:if test="${not empty resultXML}">
                    <xm:transform xml="${resultXML}" xslt="${DetailXSL}" />  
                </c:if>
                <div class="related-product">
                    <h1>Sản phẩm tương tự</h1>
                    <xm:parse var="resultRelatedXML" xml="${resultRelated}" scope="request" />
                    <c:if test="${not empty resultRelatedXML}">
                        <xm:transform xml="${resultRelatedXML}" xslt="${ProductXSL}" />  
                    </c:if>
                </div>
            </div>
        </div>
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h1>Gợi ý</h1>
                <form method="POST" action="SuggestionServlet">
                    <p>Bạn hãy chọn giới tính của con mình</p>
                    <select name="sex">
                        <option value="1">Nam</option>
                        <option value="0">Nữ</option>
                    </select>
                    <p>Tuổi của con bạn là bao nhiêu ?(1 - 14)</p>
                    <select name="yearOld">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                    </select>
                    <p>Bạn muốn chọn loại đồ nào ?</p>
                    <select name="type">
                        <option value="1">Áo</option>
                        <option value="2">Quần</option>
                        <option value="3">Combo</option>
                        <option value="4">Váy</option>
                    </select>
                    <p>Bạn mong muốn mức giá bao nhiêu ?</p>
                    <select name="desirePrice">
                        <option value="1">0-500k</option>
                        <option value="2">500k-1tr</option>
                        <option value="3">1tr-1tr6</option>
                    </select>
                    <p>Đồ có thể mặc kết hợp ?</p>
                    <select name="canCombine">
                        <option value="0">Có</option>
                        <option value="1">Không</option>
                    </select>
                    <p>Chọn màu sắc</p>
                    <select name="color">
                        <option value="1">Nâu</option>
                        <option value="2">Đỏ</option>
                        <option value="3">Cam</option>
                        <option value="4">Xanh</option>
                        <option value="5">Vàng</option>
                        <option value="6">Tím</option>
                        <option value="7">Trắng</option>
                        <option value="8">Đen</option>
                        <option value="9">Xám</option>
                        <option value="10">Kem</option>
                        <option value="11">Hồng</option>
                    </select>
                    <input type="submit" value="Suggest" />
                </form>
            </div>
        </div>
    </body>
    <script src="JS/showModal.js" type="text/javascript" ></script>
    <script src="JS/SearchProduct.js" type="text/javascript"></script>
    <script src="JS/ProductItemSlide.js" type="text/javascript"></script>
    <script type="text/javascript">
        var slideshow = document.querySelectorAll("div.product-detail-img");
        slideshow[0].style.display = "block";
    </script>
</html>