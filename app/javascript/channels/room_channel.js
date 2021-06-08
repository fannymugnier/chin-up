import consumer from "./consumer";
import { expandBtn } from "../plugins/expand-btn";

const updatePoll = (data) => {
  const surveyId = data.survey_id;
  const firstPropositionCount = data.first_proposition_count;
  const secondPropositionCount = data.second_proposition_count;
  const firstPropositionPercent = data.first_proposition_percent;
  const secondPropositionPercent = data.second_proposition_percent;

  const surveyElement = document.querySelector(`#survey-${surveyId}`);
  const surveyResultWrap = surveyElement.querySelector(".result-wrap");
  surveyResultWrap.querySelector(".first-prop-count").innerText =
    firstPropositionCount;
  surveyResultWrap.querySelector(".second-prop-count").innerText =
    secondPropositionCount;

  surveyResultWrap.querySelector(
    ".results-poll .proposition.first"
  ).style.width = `${firstPropositionPercent}%`;
  surveyResultWrap.querySelector(
    ".results-poll .proposition.second"
  ).style.width = `${secondPropositionPercent}%`;
};

const initRoomCable = () => {
  const messagesContainer = document.getElementById("messages");

  // TO DO initialize const banner
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create(
      { channel: "RoomChannel", id: id },
      {
        received(data) {
          const surveyContainer = document.querySelector("#survey-container");
          const surveyResultsContainer =
            document.querySelector("#survey-results");
          const topicBanner = document.querySelector("#topic-banner-anchor");
          const dataParsed = JSON.parse(data);
          console.log(dataParsed);
          if (dataParsed.event == "new_message") {
            messagesContainer.insertAdjacentHTML("beforeend", dataParsed.html);
            messagesContainer.scrollTop = messagesContainer.scrollHeight;
          } else if (dataParsed.event == "new_topic_announce") {
            messagesContainer.insertAdjacentHTML("beforeend", dataParsed.html);
            messagesContainer.scrollTop = messagesContainer.scrollHeight;
            console.log(dataParsed);
            topicBanner.innerHTML = dataParsed.content;
            // TO DO : update value in banner
          } else if (dataParsed.event == "new_survey_announce") {
            messagesContainer.insertAdjacentHTML("beforeend", dataParsed.html);
            messagesContainer.scrollTop = messagesContainer.scrollHeight;
            surveyContainer.insertAdjacentHTML(
              "beforeend",
              dataParsed.voteHtml
            );
          } else if (dataParsed.event == "new_vote") {
            updatePoll(dataParsed.data);

            // surveyResultsContainer.innerHTML = dataParsed.resultsHtml;
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
      }
    );
  }
};

export { initRoomCable };
