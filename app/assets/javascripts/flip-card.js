'use strict';

(function () {
  document.addEventListener('turbolinks:load', function () {
    var flipButtons = document.querySelectorAll('.flip-btn');

    if (flipButtons.length > 0) {
      flipButtons.forEach(function (btn) {
        var flipper = btn.closest('.flipper');
        btn.addEventListener('click', function () {
          flipper.classList.toggle('flip');
        });
      })
    }
  })
})();
