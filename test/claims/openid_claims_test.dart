import 'package:flutter_test/flutter_test.dart';
import 'package:jsonwebtoken_decode/builder/parts/jwt_parts/payload_part.dart';
import 'package:jsonwebtoken_decode/claims/openid_claims.dart';

void main() {
  String payloadToken =
      "eyJleHAiOjE2NjQzMTA3NzIsImlhdCI6MTY2NDMxMDQ3MiwianRpIjoiZTgyNGIxNjUtODFmYy00MjNmLTg1ZTEtOTg1M2M0OGQ0MjJiIiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo4MTgwL3JlYWxtcy90ZXJyYS1tZWRpYSIsImF1ZCI6ImFjY291bnQiLCJzdWIiOiIxMjNiYjhiZi0zMzZhLTRlYjItOTI1Zi1jODJhZjQyOGE0MjciLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJrYXpvcmRvb24iLCJzZXNzaW9uX3N0YXRlIjoiMzVmZGE3MzEtNGFmYS00YTZjLWFiOTMtYTYzMmQyNzRiYTM3IiwiYWNyIjoiMSIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJkZWZhdWx0LXJvbGVzLXRlcnJhLW1lZGlhIiwib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoicHJvZmlsZSBlbWFpbCIsInNpZCI6IjM1ZmRhNzMxLTRhZmEtNGE2Yy1hYjkzLWE2MzJkMjc0YmEzNyIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJuYW1lIjoiVG9yaW4gRXNjdWRvIGRlIENhcnZhbGhvIiwicHJlZmVycmVkX3VzZXJuYW1lIjoidG9yaW5raW5nNDEyIiwiZ2l2ZW5fbmFtZSI6IlRvcmluIiwiZmFtaWx5X25hbWUiOiJFc2N1ZG8gZGUgQ2FydmFsaG8iLCJlbWFpbCI6InRvcmluX2VzY3Vkb19jYXJ2YWxob0Bob3RtYWlsLmNvbSJ9";

  late OpenIdClaims claims;
  group('Payload openId part', () {
    setUp((() {
      claims = OpenIdClaims(Payload.fromPart(payloadToken));
    }));

    test('name', () {
      expect(claims.name, 'Torin Escudo de Carvalho');
    });

    test('email', () {
      expect(claims.email, 'torin_escudo_carvalho@hotmail.com');
    });

    test('givenName', () {
      expect(claims.givenName, 'Torin');
    });

    test('familyName', () {
      expect(claims.familyName, 'Escudo de Carvalho');
    });

    test('preferredUsername', () {
      expect(claims.preferredUsername, 'torinking412');
    });

    test('sid', () {
      expect(claims.sid, '35fda731-4afa-4a6c-ab93-a632d274ba37');
    });

    test('azp', () {
      expect(claims.azp, 'kazordoon');
    });

    test('emailVerified', () {
      expect(claims.emailVerified, true);
    });

    test('sessionState', () {
      expect(claims.sessionState, '35fda731-4afa-4a6c-ab93-a632d274ba37');
    });
  });
}
