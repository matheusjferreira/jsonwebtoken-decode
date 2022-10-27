import 'package:jsonwebtoken_decode/jsonwebtoken_decode.dart';

class HeaderClaims extends Claims {
  late Header header;

  HeaderClaims(super.jwtBuilder) {
    header = jwtBuilder.header;
  }

  claim(String value) => header.claim(value);

  get typ => claim("typ");

  get alg => claim("alg");

  get kid => claim("kid");
}
