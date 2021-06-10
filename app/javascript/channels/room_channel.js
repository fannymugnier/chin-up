import consumer from "./consumer";
import { expandBtn } from "../plugins/expand-btn";
import { initTimer } from "../plugins/timer-topic";

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
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    const a = consumer.subscriptions.create({ channel: "RoomChannel", id: id }, {
      received(data) {
        const surveyContainer = document.querySelector("#survey-container");
        const surveyResultsContainer = document.querySelector("#survey-results");
        const topicBanner = document.querySelector("#topic-banner-anchor");
        const dataParsed = JSON.parse(data)
        if (dataParsed.event == "new_message") {
          messagesContainer.insertAdjacentHTML('beforeend', dataParsed.html);
          messagesContainer.scrollTop = messagesContainer.scrollHeight;
        } else if (dataParsed.event == "new_topic_announce") {
          messagesContainer.insertAdjacentHTML('beforeend', dataParsed.html);
          messagesContainer.scrollTop = messagesContainer.scrollHeight;
          topicBanner.innerHTML = dataParsed.content;
          const countDownBis = document.querySelector('#countdown')

          if(countDownBis.hasAttribute('data-end-timer')) {

          } else {
            countDownBis.setAttribute('data-end-timer', 600)
            setTimeout(initTimer(), 1000);
          }
        } else if (dataParsed.event == "new_survey_announce") {
          messagesContainer.insertAdjacentHTML('beforeend', dataParsed.html);
          messagesContainer.scrollTop = messagesContainer.scrollHeight;
          surveyContainer.insertAdjacentHTML('beforeend', dataParsed.voteHtml);
        } else if (dataParsed.event == "new_vote") {
          updatePoll(dataParsed.data)
          if (dataParsed.data.first_proposition_count + dataParsed.data.second_proposition_count === dataParsed.data.number_of_users) {
            const winDivElement = document.querySelector(`#winning-prop-survey${dataParsed.data.survey_id}`);
            const voteElement = document.querySelector('.ongoing-vote');
            voteElement.classList.add("vote-hide")
            winDivElement.classList.remove("hidden")
            if (dataParsed.data.first_proposition_count < dataParsed.data.second_proposition_count) {
              winDivElement.insertAdjacentHTML('beforeend', `<p>${dataParsed.data.second_proposition} l'emporte ! 🎉</p>`)
            } else if (dataParsed.data.first_proposition_count > dataParsed.data.second_proposition_count) {
              winDivElement.insertAdjacentHTML('beforeend', `<p>${dataParsed.data.first_proposition} l'emporte ! 🎉</p>`)
            } else {
              winDivElement.insertAdjacentHTML('beforeend', "<p>Ex-æquo ! 🤷‍♂️</p>")
            }
          }
        }
        },
      }
    );
    const logOutDiv = document.querySelector('.exit-logo')

    logOutDiv.addEventListener('click', (e) => {
      a.unsubscribe();
    })
  }
};

export { initRoomCable };
