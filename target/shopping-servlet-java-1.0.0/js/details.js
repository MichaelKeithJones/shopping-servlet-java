let products = JSON.parse('${products}');

//--| Sets Current Product After Color Selection
let updateProduct = (index) => {
    let currentProduct = products[index];
    document.querySelector('#item .header').innerHTML = currentProduct.name;
    document.querySelector('#product-id').value = currentProduct.id;
    document.querySelector('#item .sub-header').innerHTML = '$ ' + (currentProduct.cost).toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}) + ' USD';
    document.querySelector('#item .text').innerHTML = currentProduct.description;
    document.querySelector('#item .dimension').innerHTML = currentProduct.height + ' ' + currentProduct.dimensionUnit + ' x '
        + currentProduct.width + ' ' + currentProduct.dimensionUnit + ' x '
        + currentProduct.length + ' ' + currentProduct.dimensionUnit;
    document.querySelector('#item .weight').innerHTML = currentProduct.weight + ' ' + currentProduct.weightUnit;
}
document.querySelector('#colour').addEventListener('change', event => { for(let i = 0; i < products.length; i++) if (event.target.value === products[i].color) updateProduct(i); });

//--| Sets all colors of Product
let updateColorSelector = () => { for(let i = 0; i < products.length; i++) document.querySelector('#colour').insertAdjacentHTML('beforeend', `<option value="` + products[i].color + `">` + products[i].color + `</option>`); }
updateColorSelector();

//--| Sets Inital Product
updateProduct(0);

// Todo: Add alert when color is not selected.
//--| Adds Current Product to Cart
if (document.querySelector("#add-to-cart")) {
    document.querySelector("#add-to-cart").addEventListener('click', e => {
        fetch('/cart', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                action: 'add',
                id: document.querySelector("#product-id").value,
                quantity: document.querySelector("#product-quantity").value
            })
        });
        slideIn();
    });
}