console.log("i'm in expand-btn");


document.querySelectorAll('.expand-button').forEach(button => {
  button.addEventListener('click', () => {
    const expandContent = button.nextElementSibling;

    button.classList.toggle('expand-button--active')

    if (button.classList.contains('expand-button--active')) {
      expandContent.style.maxHeight = expandContent.scrollHeight + 'px'
    } else {
      expandContent.style.maxHeight = 0
      }
  })
});