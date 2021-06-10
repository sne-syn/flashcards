document.addEventListener("turbolinks:load", function () {
  const flipBtn = document.querySelectorAll('.flip-btn');
  
  if (flipBtn.length > 0) {
    flipBtn.forEach(btn => {
      const flipper = btn.closest('.flipper');
      btn.addEventListener('click', () => {
        flipper.classList.toggle('flip');
      })
    })
  }
})
