let newsletterForm = document.querySelector('#newsletter form');

newsletterForm.addEventListener('submit', e => {
    e.preventDefault();
    newsletterForm.style.display = 'none';
    document.querySelector('#newsletter .message-sent').style.display = 'inline-block';
});