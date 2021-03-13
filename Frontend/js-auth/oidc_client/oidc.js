const Oidc = require("oidc-client");

window.addEventListener("login", function () {
  redirectToLogin();
});
window.addEventListener("logout", function () {
  redirectToLogout();
});

let settings = JSON.parse(window.sessionStorage['auth_settings']);
settings.redirect_uri = window.location.origin + "/" + settings.redirect_uri;
settings.post_logout_redirect_uri = window.location.origin + "/" + settings.post_logout_redirect_uri;
let mgr = new Oidc.UserManager(settings);

//
// Redirect to KeyCloak to authenticate the user
//
function redirectToLogin() {
  window.sessionStorage.setItem('callback_url', window.location);
  mgr
    .signinRedirect()
    .then(function () {
      console.log("signinRedirect done");
    })
    .catch(function (err) {
      console.log(err);
    });
}

//
// Look out for a authentication response
// then log it and handle it
//
if (window.location.href.indexOf("logincallback") >= 0) {
  processLoginResponse();
}

//
// Handle the authentication response returned
// by idp after the user has attempted to authenticate
//
function processLoginResponse() {
  mgr
    .signinRedirectCallback()
    .then(function (user, bb) {
      window.sessionStorage.setItem('access_token', user.access_token);
      let event = new CustomEvent("login_success");
      window.dispatchEvent(event);
      window.location = window.sessionStorage['callback_url'];
    })
    .catch(function (err) {
      console.log(err);
    });
}

//
// Logout
//
function redirectToLogout() {
  mgr
    .signoutRedirect()
    .then(function () {})
    .catch(function (err) {
      console.log(err);
    });
}

//
// Handle the authentication response returned
// by idp after the user has attempted to authenticate
//
function processLogoutResponse() {
  window.sessionStorage.removeItem('access_token');
  let event = new CustomEvent("logout_success");
  window.dispatchEvent(event);
}

//
// Look out for a authentication response
// then log it and handle it
//
if (window.location.href.indexOf("logoutcallback") >= 0) {
  processLogoutResponse();
}
