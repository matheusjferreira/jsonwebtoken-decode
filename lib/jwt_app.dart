import 'package:jsonwebtoken_decode/jsonwebtoken_decode.dart';

import 'builder/jwt_builder.dart';
import 'claims/keycloak_claims.dart';
import 'claims/openid_claims.dart';

class JWTApp {
  JwtBuilder? _jwtBuilder;
  Payload? _payload;
  Header? _header;

  JWTApp(String token) {
    _jwtBuilder = JwtBuilder.fromToken(token);
    _payload = _jwtBuilder!.payload;
    _header = _jwtBuilder!.header;
  }

  // get kecloack => KeyCloakClaims(payload);
  // get openId => OpenIdClaims(payload);
}
