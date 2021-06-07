import consumer from "./consumer";
import { expandBtn } from "../plugins/expand-btn";
const initRoomCable = () => {
  const messagesContainer = document.getElementById('messages');

  // TO DO initialize const banner
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "RoomChannel", id: id }, {
      received(data) {
        const surveyContainer = document.querySelector("#survey-container");
        const surveyResultsContainer = document.querySelector("#survey-results");
        const votingElement = document.querySelector("#you-can-vote");
        const dataParsed = JSON.parse(data)
        console.log(dataParsed)
        if (dataParsed.event == "new_message") {
          messagesContainer.insertAdjacentHTML('beforeend', dataParsed.html);
          messagesContainer.scrollTop = messagesContainer.scrollHeight;
        } else if (dataParsed.event == "new_topic_announce") {
          messagesContainer.insertAdjacentHTML('beforeend', dataParsed.html);
          messagesContainer.scrollTop = messagesContainer.scrollHeight;
          // TO DO : update value in banner
        } else if (dataParsed.event == "new_survey_announce") {
          messagesContainer.insertAdjacentHTML('beforeend', dataParsed.html);
          messagesContainer.scrollTop = messagesContainer.scrollHeight;
          surveyContainer.insertAdjacentHTML('beforeend', dataParsed.voteHtml)
        } else if (dataParsed.event == "new_vote") {
          surveyResultsContainer.innerHTML = dataParsed.resultsHtml;
        }

        // else if (dataParsed.event == "new_survey")
        // if (data.classList.contains('message-container')) {
        //
        //
        // }

        // if (data.classList.contains('survey-result')) {
        //   messagesContainer.innerHTML('beforeend', data);
        //   messagesContainer.scrollTop = messagesContainer.scrollHeight;
        // }

      },
    });
  }
}

export { initRoomCable };
