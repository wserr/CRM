
// This is an example of how the oidc_client could be used
// The index.html shows 2 simple buttons to login and logout

document
  .getElementById("login")
  .addEventListener("click", initiateLogin, false);

document.getElementById("logout").addEventListener("click", initiateLogout, false);

let settings = {
  authority: "https://keycloak.willemserruys.com/auth/realms/master",
  client_id: "testclient",
  redirect_uri: "logincallback",
  response_type: "code",
  scope: "openid profile",
  filterProtocolClaims: true,
  loadUserInfo: true,
  client_secret: "591abb2f-2291-4c9e-af7b-1376e5ea367b",
  post_logout_redirect_uri: "logoutcallback",
};

window.sessionStorage.setItem("auth_settings", JSON.stringify(settings));

function initiateLogin()
{
    let event = new CustomEvent("login");
    window.dispatchEvent(event);
}

function initiateLogout()
{
    let event = new CustomEvent("logout");
    window.dispatchEvent(event);
}

window.addEventListener("login_success", function() {
  document.getElementById("message").textContent = "Login Succeeded."
  document.getElementById("access_token").textContent = window.sessionStorage["access_token"];
});

window.addEventListener("logout_success", function() {
  document.getElementById("message").textContent = "Logout Succeeded."
  document.getElementById("access_token").textContent = window.sessionStorage["access_token"];
});