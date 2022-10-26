import 'package:flutter_test/flutter_test.dart';
import 'package:jsonwebtoken_decode/builder/jwt_builder.dart';
import 'package:jsonwebtoken_decode/builder/parts/jwt_parts/header_part.dart';
import 'package:jsonwebtoken_decode/builder/parts/jwt_parts/payload_part.dart';
import 'package:jsonwebtoken_decode/exception/data_extractor_token_exception.dart';

void main() {
  String token =
      "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI1dXVGYkNiR2p5ZERpODdJLXBxbjduLURZM2lqeURfS3lYeW5fR2ZSaHlnIn0.eyJleHAiOjE2NjQzMTA3NzIsImlhdCI6MTY2NDMxMDQ3MiwianRpIjoiZTgyNGIxNjUtODFmYy00MjNmLTg1ZTEtOTg1M2M0OGQ0MjJiIiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo4MTgwL3JlYWxtcy90ZXJyYS1tZWRpYSIsImF1ZCI6ImFjY291bnQiLCJzdWIiOiIxMjNiYjhiZi0zMzZhLTRlYjItOTI1Zi1jODJhZjQyOGE0MjciLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJrYXpvcmRvb24iLCJzZXNzaW9uX3N0YXRlIjoiMzVmZGE3MzEtNGFmYS00YTZjLWFiOTMtYTYzMmQyNzRiYTM3IiwiYWNyIjoiMSIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJkZWZhdWx0LXJvbGVzLXRlcnJhLW1lZGlhIiwib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoicHJvZmlsZSBlbWFpbCIsInNpZCI6IjM1ZmRhNzMxLTRhZmEtNGE2Yy1hYjkzLWE2MzJkMjc0YmEzNyIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJuYW1lIjoiVG9yaW4gRXNjdWRvIGRlIENhcnZhbGhvIiwicHJlZmVycmVkX3VzZXJuYW1lIjoidG9yaW5raW5nNDEyIiwiZ2l2ZW5fbmFtZSI6IlRvcmluIiwiZmFtaWx5X25hbWUiOiJFc2N1ZG8gZGUgQ2FydmFsaG8iLCJlbWFpbCI6InRvcmluX2VzY3Vkb19jYXJ2YWxob0Bob3RtYWlsLmNvbSJ9.JkURyot8P5s4-6-ye4QcA4wsbl_i_4mL1fPrAwV9TTq8IPEJiONBEynehgfAE5NgDC3azVCEYy7jsX4sqrmvbcF16GDHI4zI_zRK6rEo0EwaV3pDDzqRROn1N7Ce9J1F5NJo0u-87aWACkJIXb94ONdrOvpMapylnYf8BrBUVcOp69_NFyLnheWVWxW4mMjq0YtSvHaIRtL0KKtzj9W-zTiAw8nzd9RmlKfUnRFx7MsgE21Q4Hf16kUY52ZWZhGkZrdPXVlTph9cTFCJ-E-ECLgnlVq3qLm-ca-V6YgeLziY0rPwQDWlAsxT1tUBzzBnQmBmY3fBg1nWDfH-p9QoDw";

  group('JwtBuilder', () {
    test('payload', () {
      JwtBuilder jwtBuilder = JwtBuilder.fromToken(token);
      Payload payload = jwtBuilder.payload;
      expect(payload, isNotNull);
    });

    test('header', () {
      JwtBuilder jwtBuilder = JwtBuilder.fromToken(token);
      Header header = jwtBuilder.header;
      expect(header, isNotNull);
    });

    test('empty', () {
      expect(() => JwtBuilder.fromToken(''),
          throwsA(const TypeMatcher<DataExtractorTokenException>()));
    });

    test('empty message', () {
      expect(
          () => JwtBuilder.fromToken(''),
          throwsA(predicate((e) =>
              e is DataExtractorTokenException &&
              e.message == 'invalid token')));
    });
  });
}
