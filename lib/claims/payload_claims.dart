import 'package:jsonwebtoken_decode/jsonwebtoken_decode.dart';

class PayloadClaims extends Claims {
  late Payload payload;

  PayloadClaims(super.jwtBuilder) {
    payload = jwtBuilder.payload;
  }

  claim(String value) => payload.claim(value);

  get iss => claim("iss");

  get exp => claim("exp");

  get iat => claim("iat");

  get jti => claim("jti");

  get aud => claim("aud");

  get sub => claim("sub");

  get scope => claim("scope");

  DateTime? get expirationDate => payload.claimDate('exp');

  bool get isExpired {
    final expirationDateValue = expirationDate;
    return expirationDateValue != null
        ? DateTime.now().isAfter(expirationDateValue)
        : false;
  }
}
