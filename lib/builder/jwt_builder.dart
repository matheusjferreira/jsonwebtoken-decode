import '../exception/data_extractor_token_exception.dart';
import 'parts/jwt_parts/header_part.dart';
import 'parts/jwt_parts/payload_part.dart';

class JwtBuilder {
  final String headerDecoded;
  final String payloadDecoded;

  JwtBuilder._internal(this.headerDecoded, this.payloadDecoded);

  factory JwtBuilder.fromToken(String token) {
    final splittedToken = token.split('.');
    if (splittedToken.length != 3) {
      throw DataExtractorTokenException.fromMessage("invalid token");
    }
    return JwtBuilder._internal(splittedToken[0], splittedToken[1]);
  }

  Payload get payload => Payload.fromPart(payloadDecoded);

  Header get header => Header.fromPart(headerDecoded);
}
