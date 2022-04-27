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
            @import url("https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");

            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            body {
                width: 100%;
                height: 100vh;
                font-family: 'Montserrat', sans-serif;
            }

            #navbar {
                padding: 30px 50px;
                display: flex;
                justify-content: space-between;
            }

            #navbar .brand{
                display: flex;
                align-items: center;
            }

            #navbar .nav-items {
                list-style: none;

                text-transform: uppercase;
                font-size: 12px;
                line-height: 20px;
                font-weight: 500;
                letter-spacing: 1px;

                display: flex;
                align-items: center;
            }

            #navbar .nav-item {
                display: block;
                color: darkgrey;
                background-color: white;
                text-align: center;
                padding: 9px 20px;
                text-decoration: none;
            }

            #navbar .nav-item:hover {
                color: rgba(0, 0, 0, 0.60);
                background-color: white;
            }

            #navbar #cart {
                color: white;
                background-color: rgba(0, 0, 0, 0.85);
                overflow: hidden;
            }

            #navbar #cart:hover {
                color: white;
                background-color: rgba(0, 0, 0, 0.75);

                transition: 0.5s;
            }

            .container {
                padding: 0 min(2%, 30px);
                width: 100%;
            }

            .container-fluid {
                width: 100%;
            }

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

            #newsletter {
                background-color: #f4f4f4;
                padding-top: 130px;
                padding-bottom: 140px;
            }

            #newsletter .content {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            #newsletter .header {
                margin-top: 10px;
                margin-bottom: 15px;
                font-size: 36px;
                line-height: 50px;
                font-weight: 400;
                text-transform: none;
                text-align: center;
            }

            #newsletter .text {
                width: clamp(80%, 10wv, 40%);
                max-width: 456px;
                color: gray;
                font-size: 14px;
                line-height: 26px;
                letter-spacing: 0px;
                text-transform: none;
                text-align: center;
                margin: 0 auto;
            }

            #newsletter .input {
                width: 60%;
            }

            #newsletter .form {
                margin-top: 20px;
                margin-bottom: 15px;
                display: flex;
                justify-content: center;
                gap: 10px;
            }

            #newsletter .box{
                display: block;
                width: 330px;
                height: 38px;
                color: gray;
                background-color: #ffffff;

                margin-bottom: 0;
                padding: 21px 20px;
                border: 1px solid #e4e4e4;
                border-radius: 0;
                transition: border-color 400ms ease;

                font: inherit;
                font-size: 14px;
                vertical-align: middle;
            }

            #newsletter .button{
                display: inline-block;
                border: 0;
                cursor: pointer;
                margin: 0;

                padding: 12px 25px;
                border-radius: 0px;
                background-color: #1a1b1f;
                transition: background-color 400ms ease, opacity 400ms ease, color 400ms ease;
                color: #fff;
                font-size: 12px;
                line-height: 20px;
                letter-spacing: 2px;
                text-decoration: none;
                text-transform: uppercase;
            }

            @media only screen and (max-width: 745px) {
                #newsletter .form {
                    flex-direction: column;
                }

                #newsletter .box{
                    width: 100%;
                    text-align: center;
                }
            }

            footer {
                display: flex;
                justify-content: center;
            }

            footer .content {
                width: 100%;
                max-width: 1140px;
                padding-top: 120px;
                padding-bottom: 60px;

                display: grid;
                justify-items: start;
                align-items: start;
                grid-column-gap: 30px;
                grid-row-gap: 30px;
                grid-template-areas: ". . . . .";
            }

            footer .brand {
                grid-column-start: 1;
                grid-column-end: 2;
                grid-row-start: 1;
                grid-row-end: 2;
            }

            footer .header {
                margin-bottom: 10px;
                font-size: 12px;
                line-height: 20px;
                font-weight: 500;
                letter-spacing: 1px;
                text-transform: uppercase;
            }

            footer .listing {
                margin-top: 40px;
                display: flex;
                flex-direction: column;
            }

            footer .link {
                margin-bottom: 15px;
                transition: color 200ms ease, opacity 200ms ease;
                font-size: 14px;
                text-decoration: none;
                color: #43464d;
                background-color: transparent;
                line-height: 28px;
                font-weight: 400;
            }

            footer .menu-section {
                grid-column-start: 2;
                grid-column-end: 3;
                grid-row-start: 1;
                grid-row-end: 2;
            }

            footer .categories-section {
                grid-column-start: 3;
                grid-column-end: 4;
                grid-row-start: 1;
                grid-row-end: 2;
            }

            footer .help-section {
                grid-column-start: 4;
                grid-column-end: 5;
                grid-row-start: 1;
                grid-row-end: 2;
            }

            footer .follow-section {
                grid-column-start: 5;
                grid-column-end: 6;
                grid-row-start: 1;
                grid-row-end: 2;
            }
        </style>
    </head>
    <body>

        <nav id="navbar">
            <a class="brand" href="/" >
                <img src="https://assets.website-files.com/5c6eefaaeddf9248ac13bc72/5c6ef116eddf92775813c297_store-logo%402x.png" alt="" class="logo-image" width="65">
            </a>
            <div class="nav-items">
                <a class="nav-item" href="#">Products</a>
                <a class="nav-item" href="#">About</a>
                <a class="nav-item" href="#">Contact</a>
                <a class="nav-item" href="#" id="cart">Cart 0</a>
            </div>
        </nav>

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
            <div class="container-fluid">
                <div id="newsletter">
                    <div class="content">
                        <div class="header">Monthly Newsletter</div>
                        <div class="text">Sign up to receive updates from our shop, including new tea selections and upcoming events.</div>
                        <div class="input">
                            <form class="form">
                                <input type="text" class="box" placeholder="Enter your email">
                                <input type="button" class="button" value="SUMBIT">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer class="container">
            <div class="content">
                <a class="brand" href="/" >
                    <img src="https://assets.website-files.com/5c6eefaaeddf9248ac13bc72/5c6ef116eddf92775813c297_store-logo%402x.png" alt="" class="logo-image" width="65">
                </a>
                <div class="header menu-section">Menu</div>
                <div class="listing menu-section">
                    <a class="link" href="#">Home</a>
                    <a class="link" href="#">About</a>
                    <a class="link" href="#">Contact</a>
                    <a class="link" href="#">Products</a>
                    <a class="link" href="#">Blog</a>
                    <a class="link" href="#">Styleguide</a>
                </div>
                <div class="header categories-section">Categories</div>
                <div class="listing categories-section">
                    <a class="link" href="#">Category 1</a>
                    <a class="link" href="#">Category 2</a>
                    <a class="link" href="#">Category 3</a>
                    <a class="link" href="#">Category 4</a>
                </div>
                <div class="header help-section">Help</div>
                <div class="listing help-section">
                    <a class="link" href="#">Shipping</a>
                    <a class="link" href="#">Returns & Exchange</a>
                    <a class="link" href="#">Product Care</a>
                </div>
                <div class="header follow-section">Follow</div>
                <div class="listing follow-section">
                    <a class="link" href="#">Instagram</a>
                    <a class="link" href="#">Facebook</a>
                    <a class="link" href="#">Twitter</a>
                </div>
            </div>
        </footer>

    </body>
</html>