document.addEventListener('turbolinks:load', function () {
  const flipButtons = document.querySelectorAll('.flip-btn');

  if (flipButtons.length > 0) {
    flipButtons.forEach(btn => {
      const flipper = btn.closest('.flipper');
      btn.addEventListener('click', () => {
        flipper.classList.toggle('flip');
      });
    })
  };
});
