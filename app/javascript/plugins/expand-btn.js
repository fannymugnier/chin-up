const expandBtn = () => {

  const expand = document.querySelectorAll('.expand-button')
  if (expand) {
    const previousBtnElement = document.querySelector('#new-survey-btn')
    expand.forEach(button => {
      button.addEventListener('click', () => {
        const expandContent = document.querySelector('.expand-content');

        button.classList.toggle('expand-button--active')
        previousBtnElement.classList.toggle('remove-bdrs')

        if (button.classList.contains('expand-button--active')) {
          expandContent.style.maxHeight = expandContent.scrollHeight + 150 + 'px'
        } else {
          expandContent.style.maxHeight = 0
        }
      })
    });
  }
}

export { expandBtn }
