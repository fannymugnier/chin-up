const expandBtn = () => {

  const expand = document.querySelectorAll('.expand-button')
  if (expand) {
    const topicBtnElement = document.querySelector('#new-topic-btn')
    const surveyBtnElement = document.querySelector('#new-survey-btn')
    expand.forEach(button => {
      if (button.id === "new-topic-btn") {
        button.addEventListener('click', () => {
          const expandContent = document.querySelector('.expand-content-topic');
          const expandContentSurvey = document.querySelector('.expand-content-survey');

          button.classList.toggle('expand-button--active');
          if (surveyBtnElement.classList.contains('expand-button--active')) {
            surveyBtnElement.classList.remove('expand-button--active');
            expandContentSurvey.style.maxHeight = 0;
          }

          if (button.classList.contains('expand-button--active')) {
            expandContent.style.maxHeight = expandContent.scrollHeight + 150 + 'px';
            surveyBtnElement.classList.add('remove-bdrs');
          } else {
            expandContent.style.maxHeight = 0;
            surveyBtnElement.classList.remove('remove-bdrs');
            topicBtnElement.classList.remove('remove-bdrs');
          }
        })
      } else {
        button.addEventListener('click', () => {
          const expandContent = document.querySelector('.expand-content-survey');
          const expandContentTopic = document.querySelector('.expand-content-topic');

          button.classList.toggle('expand-button--active');
          if (topicBtnElement.classList.contains('expand-button--active')) {
            topicBtnElement.classList.remove('expand-button--active');
            expandContentTopic.style.maxHeight = 0;
          }

          if (button.classList.contains('expand-button--active')) {
            expandContent.style.maxHeight = expandContent.scrollHeight + 150 + 'px';
            topicBtnElement.classList.add('remove-bdrs');
          } else {
            expandContent.style.maxHeight = 0;
            topicBtnElement.classList.remove('remove-bdrs');
            surveyBtnElement.classList.remove('remove-bdrs');
          }
        })
      }

    });
  }
}

export { expandBtn }
