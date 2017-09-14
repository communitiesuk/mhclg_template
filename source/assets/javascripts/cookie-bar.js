(function () {
  "use strict"
  var root = this;
  if(typeof root.HACKNEY === 'undefined') { root.HACKNEY = {}; }

  HACKNEY.addCookieMessage = function () {
    var message = document.getElementById('global-cookie-message'),
        hasCookieMessage = (message && HACKNEY.cookie('seen_cookie_message') === null);

    if (hasCookieMessage) {
      message.style.display = 'block';
      HACKNEY.cookie('seen_cookie_message', 'yes', { days: 28 });
    }
  };
}).call(this);
