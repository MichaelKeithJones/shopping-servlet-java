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

        <title>About</title>

        <style>
            <%@ include file="/css/general.css"%>
            <%@ include file="/css/navbar.css"%>
            <%@ include file="/css/intro-header.css"%>
            <%@ include file="/css/main-info.css"%>

            #articles {
                display: flex;
                justify-content: center;
            }
            #articles .content{
                width: 100%;
                max-width: 1140px;

                display: grid;
                grid-auto-columns: 1fr;
                grid-template-rows: auto auto;

                margin-bottom: 150px;
                grid-column-gap: 30px;
                grid-row-gap: 30px;
                grid-template-areas: ". . ." ". . .";
                grid-template-columns: 1fr 1fr 1fr;
            }
            #articles .article {
                background-color: #330033;
                background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='400' height='400' viewBox='0 0 800 800'%3E%3Cg fill='none' stroke='%23404' stroke-width='1'%3E%3Cpath d='M769 229L1037 260.9M927 880L731 737 520 660 309 538 40 599 295 764 126.5 879.5 40 599-197 493 102 382-31 229 126.5 79.5-69-63'/%3E%3Cpath d='M-31 229L237 261 390 382 603 493 308.5 537.5 101.5 381.5M370 905L295 764'/%3E%3Cpath d='M520 660L578 842 731 737 840 599 603 493 520 660 295 764 309 538 390 382 539 269 769 229 577.5 41.5 370 105 295 -36 126.5 79.5 237 261 102 382 40 599 -69 737 127 880'/%3E%3Cpath d='M520-140L578.5 42.5 731-63M603 493L539 269 237 261 370 105M902 382L539 269M390 382L102 382'/%3E%3Cpath d='M-222 42L126.5 79.5 370 105 539 269 577.5 41.5 927 80 769 229 902 382 603 493 731 737M295-36L577.5 41.5M578 842L295 764M40-201L127 80M102 382L-261 269'/%3E%3C/g%3E%3Cg fill='%23505'%3E%3Ccircle cx='769' cy='229' r='5'/%3E%3Ccircle cx='539' cy='269' r='5'/%3E%3Ccircle cx='603' cy='493' r='5'/%3E%3Ccircle cx='731' cy='737' r='5'/%3E%3Ccircle cx='520' cy='660' r='5'/%3E%3Ccircle cx='309' cy='538' r='5'/%3E%3Ccircle cx='295' cy='764' r='5'/%3E%3Ccircle cx='40' cy='599' r='5'/%3E%3Ccircle cx='102' cy='382' r='5'/%3E%3Ccircle cx='127' cy='80' r='5'/%3E%3Ccircle cx='370' cy='105' r='5'/%3E%3Ccircle cx='578' cy='42' r='5'/%3E%3Ccircle cx='237' cy='261' r='5'/%3E%3Ccircle cx='390' cy='382' r='5'/%3E%3C/g%3E%3C/svg%3E");
                background-position: 50% 50%;
                background-size: cover;
                height: 460px;
            }
            #articles .one {
                grid-column-start: 2;
                grid-column-end: 4;
                grid-row-start: 3;
                grid-row-end: 4;
            }
            #articles .two {
                grid-column-start: 1;
                grid-column-end: 4;
                grid-row-start: 2;
                grid-row-end: 3;
            }
            #articles .three {
                grid-column-start: 1;
                grid-column-end: 3;
                grid-row-start: 1;
                grid-row-end: 2;
            }
            @media only screen and (max-width: 975px) {
                #articles .one {
                    grid-column-start: 1;
                }

                #articles .three {
                    grid-column-end: 4;
                }

            }

            #quote {
                max-width: 1140px;
                margin: 0 auto;
            }
            #quote .content {
                width: 70%;
                margin-right: auto;
                margin-bottom: 120px;
                margin-left: auto;
                text-align: center;
            }
            #quote .header {
                margin-top: 10px;
                margin-bottom: 10px;
                font-size: 36px;
                line-height: 50px;
                font-weight: 400;
            }
            #quote .body {
                color: gray;
                margin-bottom: 10px;
                font-size: clamp(16px, 2vw, 20px);
                line-height: clamp(28px, 3vw, 34px);
                font-weight: 400;
            }
            #quote .signature {
                color: gray;
                font-size: 14px;
                line-height: 26px;
                letter-spacing: 0;
                text-transform: none;
                font-weight: 400;
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
                    <div id="intro-header">
                        <div class="content">
                            <div class="text">
                                <div class="title">About Us</div>
                                <div class="paragraph">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div id="main-info">
                        <div class="content">
                            <div class="heading">
                                <h1 class="header">This is our life story</h1>
                                <div class="sub-header">Beginning of tea parties</div>
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
                    <div id="articles">
                        <div class="content">
                            <div class="article one"></div>
                            <div class="article two"></div>
                            <div class="article three"></div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div id="quote">
                        <div class="content">
                            <div class="header">Our Philosophy</div>
                            <div class="body">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                Suspendisse varius enim in eros elementum tristique. Duis cursus, mi quis
                                viverra ornare, eros dolor interdum nulla, ut commodo diam libero vitae erat.
                            </div>
                            <div class="signature">― Dr. Seuss, Oh, The Places You'll Go!</div>
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
        </script>
    </body>
</html>