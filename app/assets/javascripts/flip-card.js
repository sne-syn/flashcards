document.addEventListener('turbolinks:load', function () {
  const flipButtons = document.querySelectorAll('.jsFlipBtn');

  if (flipButtons.length > 0) {
    flipButtons.forEach(btn => {
      const flipper = btn.closest('.jsFlipper');
      btn.addEventListener('click', () => {
        flipper.classList.toggle('flip');
      });
    });
  }
});
