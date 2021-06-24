const everyoneHasVoted = (data) => {
  return data.first_proposition_count + data.second_proposition_count === data.number_of_users;
}

const displayResult = (surveyData) => {
  const textResultElement = document.querySelector(`#winning-prop-survey${vote.survey_id}`);
  if (surveyData.first_proposition_count < surveyData.second_proposition_count) {
    textResultElement.insertAdjacentHTML('beforeend', `<p>${surveyData.second_proposition} l'emporte ! 🎉</p>`);
  } else if (surveyData.first_proposition_count > surveyData.second_proposition_count) {
    textResultElement.insertAdjacentHTML('beforeend', `<p>${surveyData.first_proposition} l'emporte ! 🎉</p>`);
  } else {
    textResultElement.insertAdjacentHTML('beforeend', "<p>Ex-æquo ! 🤷‍♂️</p>");
  }
}

const updatePoll = (data) => {
  const surveyId = data.survey_id;
  const firstPropCount = data.first_proposition_count;
  const secondPropCount = data.second_proposition_count;
  const firstPropPercent = data.first_proposition_percent;
  const secondPropPercent = data.second_proposition_percent;
  const surveyElement = document.querySelector(`#survey-${surveyId}`);
  const surveyResultWrap = surveyElement.querySelector(".result-wrap");

  surveyResultWrap.querySelector(".first-prop-count").innerText =firstPropCount;
  surveyResultWrap.querySelector(".second-prop-count").innerText = secondPropCount;
  surveyResultWrap.querySelector(".results-poll .proposition.first").style.width = `${firstPropPercent}%`;
  surveyResultWrap.querySelector(".results-poll .proposition.second").style.width = `${secondPropPercent}%`;
}

export { everyoneHasVoted, displayResult, updatePoll };
