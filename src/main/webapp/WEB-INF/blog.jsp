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

        #posts {
            width: 100%;
            max-width: 1140px;
            margin-right: auto;
            margin-left: auto;
        }

        #posts > .post {
            display: block;
            margin-right: auto;
            margin-bottom: 80px;
            margin-left: auto;
        }

        #posts > .post > .img {
            background-color: #330033;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='400' height='400' viewBox='0 0 800 800'%3E%3Cg fill='none' stroke='%23404' stroke-width='1'%3E%3Cpath d='M769 229L1037 260.9M927 880L731 737 520 660 309 538 40 599 295 764 126.5 879.5 40 599-197 493 102 382-31 229 126.5 79.5-69-63'/%3E%3Cpath d='M-31 229L237 261 390 382 603 493 308.5 537.5 101.5 381.5M370 905L295 764'/%3E%3Cpath d='M520 660L578 842 731 737 840 599 603 493 520 660 295 764 309 538 390 382 539 269 769 229 577.5 41.5 370 105 295 -36 126.5 79.5 237 261 102 382 40 599 -69 737 127 880'/%3E%3Cpath d='M520-140L578.5 42.5 731-63M603 493L539 269 237 261 370 105M902 382L539 269M390 382L102 382'/%3E%3Cpath d='M-222 42L126.5 79.5 370 105 539 269 577.5 41.5 927 80 769 229 902 382 603 493 731 737M295-36L577.5 41.5M578 842L295 764M40-201L127 80M102 382L-261 269'/%3E%3C/g%3E%3Cg fill='%23505'%3E%3Ccircle cx='769' cy='229' r='5'/%3E%3Ccircle cx='539' cy='269' r='5'/%3E%3Ccircle cx='603' cy='493' r='5'/%3E%3Ccircle cx='731' cy='737' r='5'/%3E%3Ccircle cx='520' cy='660' r='5'/%3E%3Ccircle cx='309' cy='538' r='5'/%3E%3Ccircle cx='295' cy='764' r='5'/%3E%3Ccircle cx='40' cy='599' r='5'/%3E%3Ccircle cx='102' cy='382' r='5'/%3E%3Ccircle cx='127' cy='80' r='5'/%3E%3Ccircle cx='370' cy='105' r='5'/%3E%3Ccircle cx='578' cy='42' r='5'/%3E%3Ccircle cx='237' cy='261' r='5'/%3E%3Ccircle cx='390' cy='382' r='5'/%3E%3C/g%3E%3C/svg%3E");
            display: block;
            width: 100%;
            height: 620px;
            margin-bottom: 45px;
            background-position: 50% 50%;
            background-size: cover;
        }

        #posts > .post > .summary {
            width: 70%;
            margin-right: auto;
            margin-bottom: 20px;
            margin-left: auto;
            text-align: left;
        }

        @media only screen and (max-width: 745px) {
            #posts > .post {
                width: 90%;
                max-width: 470px;
            }

            #posts > .post > .img {
                height: 460px;
            }

            #posts > .post > .summary {
                text-align: center;
            }
        }

        #posts > .post > .summary > .title{
            margin-bottom: 10px;

            background-color: transparent;
            color: #43464d;

            font-size: 30px;
            font-weight: 400;
            line-height: 46px;

            text-decoration: none;
            display: block;
        }

        #posts > .post > .summary > .info{
            opacity: 0.6;
            font-size: 14px;
            line-height: 26px;
            letter-spacing: 0px;
            text-transform: none;
        }

        #posts > .post > .summary > .date{
            margin-top: 20px;
            opacity: 0.6;
            margin-bottom: 10px;
            font-size: 12px;
            line-height: 20px;
            font-weight: 500;
            letter-spacing: 1px;
            text-transform: uppercase;
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

        <div class="container">
            <div id="posts">
                <div class="post">
                    <div class="img"></div>
                    <div class="summary">
                        <a class="title" href="#">7 of the Best Examples of Beautiful Blog Design</a>
                        <div class="info">Harum et neque voluptate voluptatem aut quis culpa modi. Enim similique
                            provident et libero quod magni soluta. Repudiandae deserunt architecto itaque repellat perfe
                        </div>
                        <div class="date">February 22, 2019</div>
                    </div>
                </div>
                <div class="post">
                    <div class="img"></div>
                    <div class="summary">
                        <a class="title" href="#">5 Principles Of Effective Web Design</a>
                        <div class="info">Qui unde velit voluptatem architecto qui sequi et delectus. Dolore at quia et
                            tempora maiores qui vel ipsam voluptas. Cupiditate qui vel. Placeat dolor ex voluptas architecto
                            sit. Ea ad deserunt dicta et. Asperiores veniam voluptatum odio veritatis alias nihil. Dolor
                            libero fac
                        </div>
                        <div class="date">February 22, 2019</div>
                    </div>
                </div>
                <div class="post">
                    <div class="img"></div>
                    <div class="summary">
                        <a class="title" href="#">15 Best Blogs To Follow About Web Design</a>
                        <div class="info">Maxime repellendus beatae asperiores. Est sapiente a et consectetur quo voluptate
                            explicabo quis. Dignissimos error esse sapiente aperiam amet eum perspiciatis. Dolor totam
                            voluptatum veritatis ex assumenda ut assumenda accus
                        </div>
                        <div class="date">February 22, 2019</div>
                    </div>
                </div>
                <div class="post">
                    <div class="img"></div>
                    <div class="summary">
                        <a class="title" href="#">14 Common Problems with modern Web Design</a>
                        <div class="info">Est aperiam dolores fuga ut id. Itaque et minima quae similique aliquid. Est
                            tempora aliquam quasi nihil dolores ut blanditiis dolor. Laboriosam omnis quae accusamus
                            totam a totam eius. Est ad ea est autem ut iusto sed velit et. Possimus quos hic dolo
                        </div>
                        <div class="date">February 22, 2019</div>
                    </div>
                </div>
                <div class="post">
                    <div class="img"></div>
                    <div class="summary">
                        <a class="title" href="#">10 Quick Tips About Blogging</a>
                        <div class="info">Sit quam quae perferendis harum amet dolorum possimus minus. Occaecati magnam
                            animi quasi dolor quae et aut. Autem voluptas alias nobis in odit. Aperiam harum eum modi neque.
                            Ipsum iusto beatae et esse nobis illum hic natus. Sapiente non cumque quia facilis. Quo est
                            odio culpa eaque sit ipsum mol
                        </div>
                        <div class="date">February 22, 2019</div>
                    </div>
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