import 'package:flutter_test/flutter_test.dart';
import 'package:jsonwebtoken_decode/builder/parts/jwt_parts/header_part.dart';

void main() {
  String payloadToken =
      "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI1dXVGYkNiR2p5ZERpODdJLXBxbjduLURZM2lqeURfS3lYeW5fR2ZSaHlnIn0";

  group('Header Part', () {
    test('claim', () {
      Header header = Header.fromPart(payloadToken);
      expect(header.claim('typ'), 'JWT');
    });
  });
}
