import './payload_claims.dart';

class OpenIdClaims extends PayloadClaims {
  OpenIdClaims(super.jwtBuilder);

  String get name => claim("name");

  String get email => claim("email");

  String get givenName => claim("given_name");

  String get familyName => claim("family_name");

  String get preferredUsername => claim("preferred_username");

  String get sid => claim("sid");

  String get azp => claim("azp");

  String get sessionState => claim("session_state");

  bool get emailVerified => claim("email_verified");
}
