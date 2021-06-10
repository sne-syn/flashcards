document.addEventListener('turbolinks:load', function () {
  const flipBtn = document.querySelectorAll('.flip-btn');
  
  if (flipBtn.length > 0) {
    flipBtn.forEach(function (btn) {
      const flipper = btn.closest('.flipper');
      btn.addEventListener('click', function () {
        flipper.classList.toggle('flip');
      });
    })
  }
})
