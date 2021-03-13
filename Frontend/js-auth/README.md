# Readme

This is a vanilla javascript implementation of the authentication code flow with PKCE.
It is developed to be able to use this authentication flow with flutter.

## Use this with flutter application

1. Run the publish script
2. Copy the `oidc.js` script to the flutter application
3. Set the `auth_settings` in the session storage of the browser
4. Call the `login` and `logout` events on the browser window
5. Get the access token from the `access_token` property in the session storage
