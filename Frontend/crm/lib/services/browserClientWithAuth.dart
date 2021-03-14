import 'dart:html';
import 'dart:io';

import 'package:crm/services/webAuthService.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

class BrowserClientWithAuth extends BrowserClient {
  WebAuthService authService = WebAuthService();
  static final int _maxRetries = 2;

  Future<Response> getWithAuthHeader(dynamic url,
      {Map<String, String> headers}) async {
    var accessToken = window.sessionStorage['access_token'];
    var headers = Map<String, String>();
    if (accessToken != null) {
      headers = {
        HttpHeaders.authorizationHeader:
            "Bearer " + window.sessionStorage['access_token']
      };
    }
    var response = await this.get(url, headers: headers);

    if (response.statusCode == 401) {
      if (_getRetryValue() < _maxRetries) {
        _insertRetry();
        authService.login();
      }
      else
      {
        _clearRetry();
      }
    } else {
      _clearRetry();
    }

    return response;
  }

  int _getRetryValue() {
    int retries = 0;
    if (window.localStorage['retries'] != null) {
      retries = int.parse(window.localStorage['retries']);
    }
    return retries;
  }

  void _insertRetry() {
    int retries = _getRetryValue();
    retries++;
    window.localStorage['retries'] = retries.toString();
  }

  void _clearRetry() {
    window.localStorage.remove('retries');
  }
}
