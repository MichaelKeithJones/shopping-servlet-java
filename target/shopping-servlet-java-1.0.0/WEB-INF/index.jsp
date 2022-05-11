<%--
  Author: Michael Jones
  Date: 4/27/2022
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en-US">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0" />

        <title>Index</title>

        <style>
            <%@ include file="/css/general.css"%>
            <%@ include file="/css/navbar.css"%>
            <%@ include file="/css/intro-header.css"%>
            <%@ include file="/css/main-info.css"%>

            #features {
                margin-bottom: 80px;
                text-align: center;
            }
            #features .header {
                margin-top: 10px;
                margin-bottom: 10px;
                font-size: 30px;
                line-height: 46px;
                font-weight: 400;
            }
            #features .sub-header {
                color: gray;
                margin-bottom: 10px;
                font-size: 20px;
                line-height: 34px;
                font-weight: 400;
            }

            #list {
                width: 100%;
                margin-bottom: 30px;
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                grid-column-gap: 30px;
                grid-row-gap: 15px;
            }
            @media only screen and (max-width: 986px) {
                #list {
                    grid-template-columns: 1fr;
                    place-items: center;
                }
            }
            #list .item {
                position: relative;

                width: 100%;
                max-width: 620px;
                min-height: 620px;
                background-color: #330033;
                background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='400' height='400' viewBox='0 0 800 800'%3E%3Cg fill='none' stroke='%23404' stroke-width='1'%3E%3Cpath d='M769 229L1037 260.9M927 880L731 737 520 660 309 538 40 599 295 764 126.5 879.5 40 599-197 493 102 382-31 229 126.5 79.5-69-63'/%3E%3Cpath d='M-31 229L237 261 390 382 603 493 308.5 537.5 101.5 381.5M370 905L295 764'/%3E%3Cpath d='M520 660L578 842 731 737 840 599 603 493 520 660 295 764 309 538 390 382 539 269 769 229 577.5 41.5 370 105 295 -36 126.5 79.5 237 261 102 382 40 599 -69 737 127 880'/%3E%3Cpath d='M520-140L578.5 42.5 731-63M603 493L539 269 237 261 370 105M902 382L539 269M390 382L102 382'/%3E%3Cpath d='M-222 42L126.5 79.5 370 105 539 269 577.5 41.5 927 80 769 229 902 382 603 493 731 737M295-36L577.5 41.5M578 842L295 764M40-201L127 80M102 382L-261 269'/%3E%3C/g%3E%3Cg fill='%23505'%3E%3Ccircle cx='769' cy='229' r='5'/%3E%3Ccircle cx='539' cy='269' r='5'/%3E%3Ccircle cx='603' cy='493' r='5'/%3E%3Ccircle cx='731' cy='737' r='5'/%3E%3Ccircle cx='520' cy='660' r='5'/%3E%3Ccircle cx='309' cy='538' r='5'/%3E%3Ccircle cx='295' cy='764' r='5'/%3E%3Ccircle cx='40' cy='599' r='5'/%3E%3Ccircle cx='102' cy='382' r='5'/%3E%3Ccircle cx='127' cy='80' r='5'/%3E%3Ccircle cx='370' cy='105' r='5'/%3E%3Ccircle cx='578' cy='42' r='5'/%3E%3Ccircle cx='237' cy='261' r='5'/%3E%3Ccircle cx='390' cy='382' r='5'/%3E%3C/g%3E%3C/svg%3E");
            }
            #list .info {
                position: absolute;
                bottom: 40px;
                left: 35px;
            }
            #list .header {
                color: white;
                font-size: 20px;
                line-height: 34px;
                font-weight: 500;
                text-transform: uppercase;
            }
            #list .text {
                color: gray;
                font-size: 14px;
                line-height: 26px;
            }

            <%@ include file="/css/newsletter.css"%>
            <%@ include file="/css/footer.css"%>
            <%@ include file="/css/modal.css"%>
        </style>
    </head>
    <body>

        <jsp:include page="partials/navbar.jsp" />
        <main>
            <div class="container">
                <div id="intro-header">
                    <div class="content">
                        <div class="text">
                            <div class="title">Build you dream store</div>
                            <div class="paragraph">A simple Webflow Ecommerce template to get you started.</div>
                        </div>
                        <a class="button" type="button" href="/products">EXPLORE</a>
                    </div>
                </div>
            </div>
            <div class="container">
                <div id="main-info">
                    <div class="content">
                        <div class="heading">
                            <h1 class="header">This is your space</h1>
                            <div class="sub-header">Talk about your business, your products, or yourself.</div>
                        </div>
                        <div class="divider"></div>
                        <div class="paragraph">
                            <div class="sub-paragraph">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius enim in eros elementum tristique. Duis cursus, mi quis viverra ornare, eros dolor interdum nulla, ut commodo diam libero vitae erat. Aenean faucibus nibh et justo cursus id rutrum lorem imperdiet. Nunc ut sem vitae risus tristique posuere.</div>
                            <div class="sub-paragraph">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius enim in eros elementum tristique. Duis cursus, mi quis viverra ornare, eros dolor interdum nulla, ut commodo diam libero vitae erat. Aenean faucibus nibh et justo cursus id rutrum lorem imperdiet. Nunc ut sem vitae risus tristique posuere.</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div id="features">
                    <div class="header">Featured Products</div>
                    <div class="sub-header">Check out new and popular products</div>
                </div>
            </div>
            <div class="container">
                <div id="list">
                    <c:forEach var="product" items="${products}">
                        <div class="item">
                            <div class="info">
                                <div class="header">${product.name}</div>
                                <div class="text"><fmt:formatNumber value = "${product.cost}" type = "currency"/> USD</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <jsp:include page="partials/newsletter.jsp" />
        </main>
        <jsp:include page="partials/footer.jsp" />

        <jsp:include page="partials/modal.jsp" />

    <script>
        <%@ include file="/js/modal.js"%>
    </script>
    </body>
</html>