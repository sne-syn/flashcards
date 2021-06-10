document.addEventListener("DOMContentLoaded", function () {
  const flipCards = document.querySelectorAll('.flip-container');

  flipCards.forEach(card => {
    const flipBtn = card.querySelectorAll('.flip-btn');
    flipBtn.forEach(btn => {
      btn.addEventListener('click', () => {
        card.querySelector('.flipper').classList.toggle('flip');
      })
    })

  })
})
