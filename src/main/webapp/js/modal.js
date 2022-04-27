(() => {
    //--| Global Variables
    let overlay = document.querySelector("#cart-modal");
    let content = document.querySelector("#cart-modal .content");
    let modalCloseButton = document.querySelector("#cart-modal .close");

    //--| Modal Slide-in Function
    // let slideIn = () => {
    //     overlay.style.display = "block";
    //     let wait = () => {
    //         content.style.width = "480px";
    //         content.style.opacity = "1";
    //     };
    //     const myTimeout = setTimeout(wait, 100);
    // }
    let slideIn = () => {
        overlay.style.display = "block";
        let wait = () => {
            content.style.right = "0";
            content.style.opacity = "1";
        };
        const myTimeout = setTimeout(wait, 150);
    }

    //--| Modal Slide-out Function
    // let slideOut = () => {
    //     content.style.width = "0";
    //     content.style.opacity = "0";
    //     let wait = () => { overlay.style.display = "none"; };
    //     const myTimeout = setTimeout(wait, 200);
    // }

    let slideOut = () => {
        content.style.right = "-100px";
        content.style.opacity = "0";
        let wait = () => { overlay.style.display = "none"; };
        const myTimeout = setTimeout(wait, 150);
    }

    //--| Display Modal
    document.querySelector("#button").onclick = () => slideIn();

    //--| Close Modal
    modalCloseButton.onclick = () => slideOut();
    window.onclick = (event) => { if (event.target === overlay) slideOut(); }
})();