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

        <title>Products</title>

        <style>
            <%@ include file="/css/general.css"%>
            <%@ include file="/css/navbar.css"%>

            #selector {
                width: 100%;
                max-width: 1140px;
                margin: 60px auto 80px;

                display: flex;
                flex-direction: column;
            }
            #selector .header {
                margin: 20px .67em 15px;
                font-weight: 400;
                font-size: clamp(36px, 10vw, 44px);
                line-height: clamp(52px, 10vw, 62px);
                text-align: center;
            }
            #selector .tabs {
                text-align: center;

                display: flex;
                flex-direction: row;
                justify-content: center;
            }
            @media only screen and (max-width: 720px) {
                #selector .tabs {
                    flex-direction: column;
                    gap: 10px;
                }
            }
            #selector .link {
                color: darkgrey;
                margin-right: 15px;
                margin-left: 15px;

                font-size: 12px;
                font-weight: 500;
                line-height: 20px;
                letter-spacing: 1px;
                text-decoration: none;
                text-transform: uppercase;
            }
            #selector .link:hover {
                color: rgba(0, 0, 0, 0.60);
            }
            
            <%@ include file="/css/cards.css"%>
            <%@ include file="/css/newsletter.css"%>
            <%@ include file="/css/footer.css"%>
            <%@ include file="/css/modal.css"%>
        </style>
    </head>
    <body>

        <jsp:include page="partials/navbar.jsp" />
        <main>
            <div class="container">
                <div id="selector">
                    <div class="header">Our Products</div>
                    <div class="tabs">
                        <a href="/products" class="link">All Products</a>
                        <a href="/products?category=Category 1" class="link">Category 1</a>
                        <a href="/products?category=Category 2" class="link">Category 2</a>
                        <a href="/products?category=Category 3" class="link">Category 3</a>
                        <a href="/products?category=Category 4" class="link">Category 4</a>
                    </div>
                </div>
            </div>
            <div class="container">
                <div id="cards">
                    <c:forEach var="product" items="${products}">
                        <div class="card">
                            <a class="anchor">
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

        <script>
            <%@ include file="/js/modal.js"%>
        </script>
    </body>
</html>