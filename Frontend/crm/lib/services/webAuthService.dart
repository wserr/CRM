import 'dart:convert';
import 'dart:html';

import 'package:crm/constants/config.dart';
import 'package:crm/models/authParameters.dart';

class WebAuthService {
  static final WebAuthService _instance = WebAuthService._internal();
  AuthParameters params;

  factory WebAuthService() {
    return _instance;
  }

  void login()
  {
    window.dispatchEvent(new Event("login"));
  }

  void logout()
  {
    window.dispatchEvent(new Event("logout"));
  }

  String getAccessToken()
  {
    return window.sessionStorage['access_token'];
  }

  WebAuthService._internal() {
    // This message is for testing purposes only.
    print('New instance of WebAuthService is created.');
    params = new AuthParameters(
        Config.authority,
        Config.clientId,
        Config.clientSecret,
        Config.redirectUri,
        "code",
        "openid profile",
        true,
        true,
        Config.postLogoutRedirectUri);
    window.sessionStorage['auth_settings'] = jsonEncode(params);
  }
}
