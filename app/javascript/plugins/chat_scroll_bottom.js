/** @format */

const initScrollToBottom = () => {
  const messages = document.querySelector("#messages");
  if (messages) {
    messages.scrollTop = messages.scrollHeight;
  }
};

export {initScrollToBottom};
