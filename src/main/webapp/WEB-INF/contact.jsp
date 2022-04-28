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

        <title>Contact</title>

        <style>
            <%@ include file="/css/general.css"%>
            <%@ include file="/css/navbar.css"%>

            #contact .heading {
                width: 100%;
                max-width: 1140px;
                margin: 60px auto 80px;
                text-align: center;
            }
            #contact .header {
                font-size: 44px;
                font-weight: 400;
                line-height: 62px;
                margin: 20px .67em 15px;
            }
            #contact .sub-header {
                color: gray;
                margin-bottom: 10px;
                font-size: 20px;
                font-weight: 400;
                line-height: 34px;
            }
            #contact form {
                width: 70%;
                max-width: 800px;
                margin-right: auto;
                margin-left: auto;
                margin-bottom: 100px;

                display: flex;
                flex-direction: column;
                align-items: stretch;
            }
            #contact label {
                display: block;
                margin-bottom: 10px;
                font-size: 12px;
                line-height: 20px;
                font-weight: 500;
                letter-spacing: 1px;
                text-transform: uppercase;
            }
            #contact .input-fields {
                display: flex;
            }
            #contact .text-field {
                font-family: Montserrat, sans-serif;
                color: #333333;
                font-size: 14px;
                line-height: 26px;
                font-weight: 400;

                margin-bottom: 25px;
                padding: 21px 20px;
                border: 1px solid #e4e4e4;
                border-radius: 0;
                transition: border-color 400ms ease;

                display: block;
                width: 100%;
                height: 38px;

                background-color: #ffffff;
            }
            #contact .input-name {
                width: 50%;
                padding-right: 10px;
            }
            #contact .input-email {
                width: 50%;
                padding-left: 10px;
            }
            @media only screen and (max-width: 975px) {
                #contact .input-fields {
                    flex-direction: column;
                    align-items: stretch;
                }

                #contact .input-name {
                    width: 100%;
                    padding-right: 0;
                }

                #contact .input-email {
                    width: 100%;
                    padding-left: 0;
                }

            }
            #contact .text-style {
                display: block;
                width: 100%;

                height: 200px;
                margin-bottom: 25px;

                padding: 12px 20px 21px;
                border: 1px solid #e4e4e4;
                border-radius: 0;
                transition: border-color 400ms ease;

                font: inherit;
                color: #333333;
                font-size: 14px;
                line-height: 26px;
                font-weight: 400;

                overflow: auto;
            }
            #contact .button {
                display: inline-block;
                padding: 12px 25px;
                border: 0;
                border-radius: 0;
                background-color: #1a1b1f;
                transition: background-color 400ms ease, opacity 400ms ease, color 400ms ease;
                font: inherit;
                color: #fff;
                font-size: 12px;
                line-height: 20px;
                letter-spacing: 2px;
                text-decoration: none;
                text-transform: uppercase;
                cursor: pointer;
            }
            #contact .spacer {
                background-color: rgb(229, 227, 223);
                width: 100%;
                max-width: 1140px;
                height: 460px;
                margin: 0 auto 100px;
            }

            #numbers {
                width: 100%;
                max-width: 1140px;
                margin-right: auto;
                margin-left: auto;
                margin-bottom: 100px;
                text-align: center;
            }
            #numbers .heading{
                margin-top: 10px;
                margin-bottom: 10px;
                font-size: 36px;
                line-height: 50px;
                font-weight: 400;
            }
            #numbers .sections{
                margin-top: 60px;

                display: grid;
                grid-template-areas: ". . . .";
                grid-template-columns: 1fr 1fr 1fr 1fr;
                grid-auto-columns: 1fr;
                grid-column-gap: 30px;
                grid-template-rows: auto;
                grid-row-gap: 30px;

                text-align: center;
            }
            #numbers .support {
                grid-column-start: 1;
                grid-column-end: 2;
                grid-row-start: 1;
                grid-row-end: 2;

                text-align: center;
            }
            #numbers .marketing {
                grid-column-start: 2;
                grid-column-end: 3;
                grid-row-start: 1;
                grid-row-end: 2;

                text-align: center;
            }
            #numbers .hotline {
                grid-column-start: 3;
                grid-column-end: 4;
                grid-row-start: 1;
                grid-row-end: 2;

                text-align: center;
            }
            #numbers .email {
                grid-column-start: 4;
                grid-column-end: 5;
                grid-row-start: 1;
                grid-row-end: 2;

                text-align: center;
            }
            #numbers .header {
                margin-bottom: 10px;
                opacity: 1;
                font-size: 20px;
                line-height: 34px;
                font-weight: 400;
            }
            #numbers .sub-header {
                margin-bottom: 10px;
                font-family: Montserrat, sans-serif;
                color: #1a1b1f;
                font-size: 16px;
                line-height: 28px;
                font-weight: 400;
            }
            #numbers .text {
                color: gray;
                font-size: 12px;
                line-height: 20px;
                font-family: Montserrat, sans-serif;
                color: #1a1b1f;
                font-weight: 400;
            }
            #numbers .link {
                display: block;
                margin-bottom: 10px;
                color: gray;
                transition: opacity 200ms ease;
                font-size: 20px;
                line-height: 34px;
                font-weight: 400;
                text-decoration: none;
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
                <div id="contact">
                    <div class="heading">
                        <div class="header">Get in touch</div>
                        <div class="sub-header">Hey there, fill out this form</div>
                    </div>
                    <div class="body">
                        <form>
                            <div class="input-fields">
                                <div class="input-name">
                                    <label for="name">Name</label>
                                    <input class="text-field" type="text" name="name" id="name" placeholder="Enter your name">
                                </div>
                                <div class="input-email">
                                    <label for="email">Email Address</label>
                                    <input class="text-field" type="email" name="email" id="email" placeholder="Enter your email">
                                </div>
                            </div>
                            <label for="message">Message</label>
                            <textarea class="text-style" name="message" id="message" placeholder="Enter your message"></textarea>
                            <input type="button" class="button" value="Submit">
                        </form>
                        <div class="spacer"></div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div id="numbers">
                    <div class="heading">Main Contacts</div>
                    <div class="sections">
                        <div class="support">
                            <div class="header">Support</div>
                            <div class="sub-header">+61 8372 4662</div>
                            <div class="text">Mon - Fri, 9am - 5pm</div>
                        </div>
                        <div class="marketing">
                            <div class="header">Marketing</div>
                            <div class="sub-header">+61 8372 4662</div>
                            <div class="text">Mon - Fri, 9am - 5pm</div>
                        </div>
                        <div class="hotline">
                            <div class="header">Office Hotline</div>
                            <div class="sub-header">+61 8372 4662</div>
                            <div class="text">Mon - Fri, 9am - 5pm</div>
                        </div>
                        <div class="email">
                            <div class="header">Email</div>
                            <a class="link">support@store.com</a>
                        </div>
                    </div>
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