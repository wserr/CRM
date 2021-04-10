import 'dart:core';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class Config
{
  static String apiUrl = env["base_url"];
  static String authority = env["authority"];
  static String clientId = env["clientId"];
  static String clientSecret = env["clientSecret"];
  static String redirectUri = env["redirectUri"];
  static String postLogoutRedirectUri = env["postLogoutRedirectUri"];
}