const initDisableVote = () => {
  const voteBtn = document.querySelector('#vote-btn');
  const voteElement = document.querySelector('.ongoing-vote');
  if (voteBtn) {
    voteBtn.addEventListener('click', (event) => {
      voteElement.classList.add("vote-hide")
    })
  }
}

export { initDisableVote }