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

            <%@ include file="/css/cards.css"%>
            <%@ include file="/css/newsletter.css"%>
            <%@ include file="/css/footer.css"%>
            <%@ include file="/css/modal.css"%>
        </style>
    </head>
    <body>

        <div class="page">
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
                    <div id="cards">
                        <c:forEach var="product" items="${products}">
                            <div class="card">
                                <a class="anchor" href="/details?product=${product.name}">
                                    <div class="info">
                                        <div class="header">${product.name}</div>
                                        <div class="text"><fmt:formatNumber value = "${product.cost}" type = "currency"/> USD</div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <jsp:include page="partials/newsletter.jsp" />
            </main>

            <jsp:include page="partials/footer.jsp" />

            <jsp:include page="partials/modal.jsp" />
        </div>

    <script>
        <%@ include file="/js/navbar.js"%>
        <%@ include file="/js/modal.js"%>
        // Todo: Make navbar responsive and collapsable : 975px
        // Todo: Make main-info text center at 745px
        // Todo: Collapse footer into straight column at 745px
    </script>
    </body>
</html>