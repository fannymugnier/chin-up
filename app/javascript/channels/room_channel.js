import consumer from "./consumer";
import { expandBtn } from "../plugins/expand-btn";
import { initTimer } from "../plugins/timer-topic";
import { initScrollToBottom } from "../plugins/chat_scroll_bottom";
import { everyoneHasVoted, displayResult, updatePoll } from "../plugins/chat_poll";

const insertMessage = (container, html) => {
  container.insertAdjacentHTML('beforeend', html);
  initScrollToBottom();
}

const initRoomCable = () => {
  const messagesContainer = document.getElementById("messages");
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    const newSub = consumer.subscriptions.create({ channel: "RoomChannel", id: id }, {
      received(data) {
        const dataParsed = JSON.parse(data);
        switch (dataParsed.event) {
          case 'new_message':
            insertMessage(messagesContainer, dataParsed.html);
            break;
          case 'new_topic_announce':
            insertMessage(messagesContainer, dataParsed.html);
            document.querySelector("#topic-banner-anchor").innerHTML = dataParsed.content;
            const countDownBis = document.querySelector('#countdown');
            if (!countDownBis.hasAttribute('data-end-timer')) {
              countDownBis.setAttribute('data-end-timer', 600);
              setTimeout(initTimer(), 1000);
            }
            break;
          case 'new_survey_announce':
            insertMessage(messagesContainer, dataParsed.html);
            document.querySelector("#survey-container").insertAdjacentHTML('beforeend', dataParsed.voteHtml);
            break;
          case 'new_vote':
            const vote = dataParsed.data;
            updatePoll(vote);
            if (everyoneHasVoted(vote)) {
              document.querySelector('.ongoing-vote').classList.add("vote-hide");
              displayResult(vote);
            }
            break;
        }
      },
    })
    const logOutDiv = document.querySelector('.exit-logo');
    logOutDiv.addEventListener('click', (e) => {
      newSub.unsubscribe();
    })
  }
}

export { initRoomCable };
