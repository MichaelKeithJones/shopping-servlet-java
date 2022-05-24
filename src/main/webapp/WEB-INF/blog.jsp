<%--
  Author: Michael Jones
  Date: 4/27/2022
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en-US">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0" />

    <title>Blog</title>

    <style>
        <%@ include file="/css/general.css"%>
        <%@ include file="/css/navbar.css"%>

        #title .heading {
            width: 100%;
            max-width: 1140px;
            margin: 60px auto 80px;
            text-align: center;
        }
        #title .header {
            font-size: 44px;
            font-weight: 400;
            line-height: 62px;
            margin: 20px .67em 15px;
        }
        #title .sub-header {
            color: gray;
            margin-bottom: 10px;
            font-size: 20px;
            font-weight: 400;
            line-height: 34px;
        }

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
            <div id="title">
                <div class="heading">
                    <div class="header">Our Stories</div>
                    <div class="sub-header">Harum et neque voluptate voluptatem</div>
                </div>
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
    <%@ include file="/js/newsletter.js"%>
</script>
</body>
</html>