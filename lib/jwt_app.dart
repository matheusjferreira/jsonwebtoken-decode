import 'builder/jwt_builder.dart';
import 'claims/keycloak_claims.dart';
import 'claims/openid_claims.dart';

class JWTApp {
  late JwtBuilder jwtBuilder;

  JWTApp(String token) {
    jwtBuilder = JwtBuilder.fromToken(token);
  }

  get payload => jwtBuilder.payload;
  get header => jwtBuilder.header;

  get kecloack => KeyCloakClaims(payload);
  get openId => OpenIdClaims(payload);
}
