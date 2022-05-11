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

        <title>Details</title>

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

            #item {
                display: flex;
                align-items: center;
            }

            #item .image {
                background-color: #330033;
                background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='400' height='400' viewBox='0 0 800 800'%3E%3Cg fill='none' stroke='%23404' stroke-width='1'%3E%3Cpath d='M769 229L1037 260.9M927 880L731 737 520 660 309 538 40 599 295 764 126.5 879.5 40 599-197 493 102 382-31 229 126.5 79.5-69-63'/%3E%3Cpath d='M-31 229L237 261 390 382 603 493 308.5 537.5 101.5 381.5M370 905L295 764'/%3E%3Cpath d='M520 660L578 842 731 737 840 599 603 493 520 660 295 764 309 538 390 382 539 269 769 229 577.5 41.5 370 105 295 -36 126.5 79.5 237 261 102 382 40 599 -69 737 127 880'/%3E%3Cpath d='M520-140L578.5 42.5 731-63M603 493L539 269 237 261 370 105M902 382L539 269M390 382L102 382'/%3E%3Cpath d='M-222 42L126.5 79.5 370 105 539 269 577.5 41.5 927 80 769 229 902 382 603 493 731 737M295-36L577.5 41.5M578 842L295 764M40-201L127 80M102 382L-261 269'/%3E%3C/g%3E%3Cg fill='%23505'%3E%3Ccircle cx='769' cy='229' r='5'/%3E%3Ccircle cx='539' cy='269' r='5'/%3E%3Ccircle cx='603' cy='493' r='5'/%3E%3Ccircle cx='731' cy='737' r='5'/%3E%3Ccircle cx='520' cy='660' r='5'/%3E%3Ccircle cx='309' cy='538' r='5'/%3E%3Ccircle cx='295' cy='764' r='5'/%3E%3Ccircle cx='40' cy='599' r='5'/%3E%3Ccircle cx='102' cy='382' r='5'/%3E%3Ccircle cx='127' cy='80' r='5'/%3E%3Ccircle cx='370' cy='105' r='5'/%3E%3Ccircle cx='578' cy='42' r='5'/%3E%3Ccircle cx='237' cy='261' r='5'/%3E%3Ccircle cx='390' cy='382' r='5'/%3E%3C/g%3E%3C/svg%3E");

                display: flex;
                width: 50%;
                height: 700px;
                margin-bottom: 30px;
                justify-content: center;
                align-items: center;
                background-position: 50% 50%;
                background-size: cover;
                background-repeat: no-repeat;
            }

            #item .details {
                width: 50%;
                max-width: 470px;
                margin-bottom: 20px;
                margin-left: 100px;
            }

            #item .main {
                margin-bottom: 30px;
            }

            #item .header {
                font-size: 36px;
                line-height: 52px;
                font-weight: 400;
                margin-top: 20px;
                margin-bottom: 10px;
            }

            #item .sub-header {
                margin-bottom: 20px;
                color: gray;
                font-size: 30px;
                font-weight: 400;
                line-height: 52px;
            }

            #item .text {
                color: gray;
                font-size: 14px;
                line-height: 26px;
                letter-spacing: 0;
                text-transform: none;
            }

            #item .divider-dark {
                height: 1px;
                background-color: #202020;
            }

            #item .info {
                margin-top: 25px;
                margin-bottom: 25px;

                display: grid;
                grid-template-columns: repeat(2, 1fr);
                grid-template-rows: repeat(2, 1fr);
            }

            #item .label {
                padding-top: 5px;
                padding-bottom: 5px;

                font-family: Montserrat, sans-serif;
                color: #1a1b1f;
                font-weight: 400;
                color:gray;
                font-size: 14px;
                line-height: 26px;
                letter-spacing: 0px;
                text-transform: none;
            }

            #item .value {
                padding-top: 5px;
                padding-bottom: 5px;

                text-align: end;
                font-family: Montserrat, sans-serif;
                color: #1a1b1f;
                font-size: 16px;
                line-height: 28px;
                font-weight: 400;
            }

            #item .divider-light {
                height: 1px;
                background-color: #eee;
            }

            #item .selectors {
                margin: 30px 0 15px;
            }

            #item .colour-label {
                display: block;
                margin-bottom: 10px;
                font-size: 12px;
                line-height: 20px;
                font-weight: 500;
                letter-spacing: 1px;
                text-transform: uppercase;
            }

            #item .colour-drop {
                font: inherit;
                background-color: #f3f3f3;
                display: block;
                width: 100%;
                height: 38px;
                padding: 8px 12px;
                margin-bottom: 10px;
                font-size: 14px;
                line-height: 1.42857143;
                color: #333333;
                vertical-align: middle;
                border: 1px solid #cccccc;
                text-transform: none;
            }

            #item .quantity {
                margin-bottom: 0px;
                font-size: 12px;
                line-height: 20px;
                font-weight: 500;
                letter-spacing: 1px;
                text-transform: uppercase;
                display: block;
            }

            #item .selection {
                display: flex;
                margin-top: 0;
            }

            #item .drop {
                font: inherit;
                width: 80px;
                height: auto;
                margin-top: 10px;
                margin-right: 10px;
                margin-bottom: 0;
                padding: 8px 12px 8px 20px;
                background-color: #fff;
                border: 1px solid #e4e4e4;
                border-radius: 0;
                -webkit-transition: border-color 400ms ease;
                transition: border-color 400ms ease;
                font-size: 14px;
                line-height: 26px;
                display: block;
                appearance: none;
                color: inherit;
            }

            #item .button {
                font: inherit;
                margin-top: 10px;
                margin-right: 10px;
                padding: 12px 25px;
                border-radius: 0;
                background-color: #1a1b1f;
                transition: background-color 400ms ease, opacity 400ms ease, color 400ms ease;
                color: #fff;
                font-size: 12px;
                line-height: 20px;
                letter-spacing: 2px;
                text-decoration: none;
                text-transform: uppercase;
                border-bottom-width: 0;
                border-left-width: 0;
                border-right-width: 0;
                border-top-width: 0;
                cursor: pointer;
                display: flex;
                align-items: center;
                appearance: none;
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
                border-radius: 0;
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
                <div id="item">
                    <div class="image"></div>
                    <div class="details">
                        <div class="main">
                            <div class="header">Plainness</div>
                            <div class="sub-header">$ 40.00 USD</div>
                            <div class="text">Even the all-powerful Pointing has no control
                                about the blind texts it is an almost unorthographic life.</div>
                        </div>
                        <div class="divider-dark"></div>
                        <div class="info">
                            <div class="label">Dimensions</div>
                            <div class="value">4.5 in x 15.59 in x 8.6 in</div>
                            <div class="label">Weight</div>
                            <div class="value">2.8 oz</div>
                        </div>
                        <div class="divider-light"></div>
                        <div class="selectors">
                            <div class="colour">
                                <div class="colour-label">Colour</div>
                                <select name="colour" id="colour" class="colour-drop">
                                    <option value="none">Select Colour</option>
                                    <option value="white">White</option>
                                    <option value="grey">Grey</option>
                                    <option value="black">Black</option>
                                </select>
                            </div>
                            <div class="quantity">Quantity</div>
                            <div class="selection">
                                <input type="number" class="drop" min="1" value="1"/>
                                <input type="button" class="button" value="Add to Cart"/>
                            </div>
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