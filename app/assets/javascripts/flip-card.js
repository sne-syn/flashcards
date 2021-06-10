'use strict';

(function () {
  document.addEventListener('turbolinks:load', function () {
    var flipBtn = document.querySelectorAll('.flip-btn');

    if (flipBtn.length > 0) {
      flipBtn.forEach(function (btn) {
        var flipper = btn.closest('.flipper');
        btn.addEventListener('click', function () {
          flipper.classList.toggle('flip');
        });
      })
    }
  })
})();
