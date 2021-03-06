let products = JSON.parse('${products}');

//--| Sets all colors of Product
let updateColorSelector = () => {
    document.querySelector('#item .colour').innerHTML = `
        <div class="colour-label">Colour</div>
        <select name="colour" id="colour" class="colour-drop" required>
            <option value="">Select Colour</option>
        </select>
    `;
    for(let i = 0; i < products.length; i++)
        document.querySelector('#colour').insertAdjacentHTML('beforeend', `<option value="` + products[i].color + `">` + products[i].color + `</option>`);
}

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
if (products[0].color !== 'None') {
    updateColorSelector();
    document.querySelector('#colour').addEventListener('change', event => { for(let i = 0; i < products.length; i++) if (event.target.value === products[i].color) updateProduct(i); });
}

//--| Sets Initial Product
updateProduct(0);

//--| Adds Current Product to Cart
let detailsForm = document.querySelector('#item form');
detailsForm.addEventListener('submit', e => {
    e.preventDefault();

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
    }).then(displayShoppingCart);
    slideIn();
});