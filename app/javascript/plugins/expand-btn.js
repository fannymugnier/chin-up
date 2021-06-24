const isTopic = (id) => {
  return id === "new-topic-btn";
}

const applyBdrs = (args) => {
  args.forEach((arg) => {
    arg.classList.remove('remove-bdrs');
  })
}

const isExpanded = (element) => {
  return element.classList.contains('expand-button--active')
}

const closeContent = (content) => {
  content.style.maxHeight = 0;
}

const expandBtn = () => {
  const expand = document.querySelectorAll('.expand-button')
  if (expand) {
    const topicBtnElement = document.querySelector('#new-topic-btn');
    const surveyBtnElement = document.querySelector('#new-survey-btn');
    const topicExpandContent = document.querySelector('.expand-content-topic');
    const surveyExpandContent = document.querySelector('.expand-content-survey');

    expand.forEach(button => {
      button.addEventListener('click', (event) => {
        const selectedBtnElement = isTopic(button.id) ? topicBtnElement : surveyBtnElement;
        const selectedContent = isTopic(button.id) ? topicExpandContent : surveyExpandContent;
        const otherBtnElement = isTopic(button.id) ? surveyBtnElement : topicBtnElement;
        const otherContent = isTopic(button.id) ? surveyExpandContent : topicExpandContent;

        button.classList.toggle('expand-button--active');
        if (isExpanded(otherBtnElement)) {
          otherBtnElement.classList.remove('expand-button--active');
          closeContent(otherContent);
        }
        if (isExpanded(button)) {
          selectedContent.style.maxHeight = selectedContent.scrollHeight + 150 + 'px';
          otherBtnElement.classList.add('remove-bdrs');
        } else {
          closeContent(selectedContent);
          applyBdrs([otherBtnElement, selectedBtnElement]);
        }
      })
    });
  }
}

export { expandBtn }
