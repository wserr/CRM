class AuthParameters
{
  String authority;
  String clientId;
  String clientSecret;
  String redirectUri;
  String responseType;
  String scope;
  bool filterProtocolClaims;
  bool loadUserInfo;
  String postLogoutRedirectUri;

  AuthParameters(this.authority, this.clientId, this.clientSecret, this.redirectUri,
  this.responseType, this.scope, this.filterProtocolClaims, this.loadUserInfo,
  this.postLogoutRedirectUri);
  
  Map toJson() => {
    'authority': authority,
    'client_id': clientId,
    'client_secret': clientSecret,
    'redirect_uri': redirectUri,
    'response_type': responseType,
    'scope': scope,
    'filterProtocolClaims': filterProtocolClaims,
    'loadUserInfo': loadUserInfo,
    'post_logout_redirect_uri': postLogoutRedirectUri
  };

}