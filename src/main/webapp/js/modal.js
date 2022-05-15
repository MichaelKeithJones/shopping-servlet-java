//--| Global Variables
let overlay = document.querySelector("#cart-modal");
let content = document.querySelector("#cart-modal .content");
let modalCloseButton = document.querySelector("#cart-modal .close");

//--| Display Shopping Cart
let displayShoppingCart = () => {
    let modalBody =  document.querySelector("#cart-modal .body");

    fetch('cart')
        .then(response => response.json())
        .then(data => {
            console.log(data)
            if (data.length === 0) {
                modalBody.innerHTML = `
                                <div class="inner-empty">
                                    <div class="text">No items found.</div>
                                </div>
                            `;
            } else {
                let total = 0;
                data.map(product => total += product.cost);

                let outputHTML = '<div class="inner-full"><div class="upper">';
                data.forEach(product => {
                    outputHTML += `
                        <div class="item">
                            <img class="product-img" src="" alt="">
                            <div class="details">
                                <div class="product-name">\${product.name}</div>
                                <div class="product-cost">\${product.cost}</div>
                                <div class="product-color">Colour: <span style="color: black">\${product.color}</span></div>
                                <a data-id="\${product.id}" class="product-remove">Remove</a>
                            </div>
                            <input data-id="\${product.id}" class="quantity" type="text" value="1" />
                        </div>
                    `;
                });
                outputHTML += `
                    </div>
                        <div class="lower">
                            <div class="subtotal">
                                <div>Subtotal</div>
                                <div class="amount">\${total}</div>
                            </div>
                            <div>
                                <a class="checkout">Continue to Checkout</a>
                            </div>
                        </div>
                    </div>
                `;
                modalBody.innerHTML = outputHTML;

                modalBody.addEventListener('click', (e) => {
                    if (e.target.classList.contains('product-remove')) {
                        console.log('remove');
                        fetch('/cart', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify({
                                action: 'remove',
                                id: e.target.getAttribute("data-id")
                            })
                        }).then(displayShoppingCart);
                    }

                    if (e.target.classList.contains('checkout')) {
                        console.log('Product Checkout');
                        console.log(e.target);
                    }
                });

                let quantityButtons = document.querySelectorAll('#cart-modal input');
                quantityButtons.forEach(element => element.addEventListener('change', e => {
                    fetch('/cart', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({
                            action: 'set',
                            id: e.target.getAttribute("data-id"),
                            quantity: e.target.value
                        })
                    }).then(displayShoppingCart);
                }));
            }
        });
}

//--| Modal Slide-in Function
let slideIn = () => {
    overlay.style.display = "block";
    let wait = () => {
        content.style.right = "0";
        content.style.opacity = "1";
        displayShoppingCart();
    };
    const myTimeout = setTimeout(wait, 100);
}
//--| Display Modal
document.querySelector("#cart-button").addEventListener('click', slideIn);

//--| Modal Slide-out Function
let slideOut = () => {
    content.style.right = "-100px";
    content.style.opacity = "0";
    let wait = () => { overlay.style.display = "none"; };
    const myTimeout = setTimeout(wait, 100);
}
//--| Close Modal
modalCloseButton.onclick = () => slideOut();
window.onclick = (event) => { if (event.target === overlay) slideOut(); }
