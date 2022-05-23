let isHidden = false;

let closeNavLinks = () => {
    isHidden = false;
    document.querySelector('nav').classList.remove('nav-full');
    document.querySelector('nav .content').classList.remove('links-down');
    document.querySelector('nav .overlay').classList.remove('overlay-down');
}

document.querySelector('#drop-button').addEventListener('click', () => {
    isHidden = !isHidden;
    if (isHidden) {
        document.querySelector('nav').classList.add('nav-full');
        document.querySelector('nav .content').classList.add('links-down');
        document.querySelector('nav .overlay').classList.add('overlay-down');
    }else{
        document.querySelector('nav').classList.remove('nav-full');
        document.querySelector('nav .content').classList.remove('links-down');
        document.querySelector('nav .overlay').classList.remove('overlay-down');
    }
});
document.querySelector('.overlay').addEventListener('click', () => closeNavLinks());

window.onresize = () => { if (window.innerWidth > 975) closeNavLinks(); }