import 'claims.dart';

class OpenIdClaims extends Claims {
  OpenIdClaims(super.payload);

  String get name => part.claim("name");

  String get email => part.claim("email");

  String get givenName => part.claim("given_name");

  String get familyName => part.claim("family_name");

  String get preferredUsername => part.claim("preferred_username");

  String get sid => part.claim("sid");

  String get azp => part.claim("azp");

  String get sessionState => part.claim("session_state");

  bool get emailVerified => part.claim("email_verified");
}
