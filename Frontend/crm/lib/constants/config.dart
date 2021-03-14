import 'dart:core';

class Config
{
  static const String apiUrl = String.fromEnvironment("base_url");
  static const String authority = String.fromEnvironment("authority");
  static const String clientId = String.fromEnvironment("clientId");
  static const String clientSecret = String.fromEnvironment("clientSecret");
  static const String redirectUri = String.fromEnvironment("redirectUri");
  static const String postLogoutRedirectUri = String.fromEnvironment("postLogoutRedirectUri");
}