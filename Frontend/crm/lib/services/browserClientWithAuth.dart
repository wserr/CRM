import 'dart:html';
import 'dart:io';

import 'package:crm/services/webAuthService.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

class BrowserClientWithAuth extends BrowserClient {
  WebAuthService service = WebAuthService();

  Future<Response> getWithAuthHeader(dynamic url,
      {Map<String, String> headers}) async {

    var accessToken = window.sessionStorage['access_token'];
    var headers = Map<String,String>();
    if(accessToken != null)
    {
      headers = {HttpHeaders.authorizationHeader: "Bearer " + window.sessionStorage['access_token']};
    }
    var response = await this.get(url,
    headers: headers);

    return response;
  }
}
