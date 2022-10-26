import 'package:flutter_test/flutter_test.dart';
import 'package:jsonwebtoken_decode/builder/parts/part.dart';
import 'package:jsonwebtoken_decode/exception/data_extractor_token_exception.dart';

void main() {
  String payloadToken =
      "eyJleHAiOjE2NjQzMTA3NzIsImlhdCI6MTY2NDMxMDQ3MiwianRpIjoiZTgyNGIxNjUtODFmYy00MjNmLTg1ZTEtOTg1M2M0OGQ0MjJiIiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo4MTgwL3JlYWxtcy90ZXJyYS1tZWRpYSIsImF1ZCI6ImFjY291bnQiLCJzdWIiOiIxMjNiYjhiZi0zMzZhLTRlYjItOTI1Zi1jODJhZjQyOGE0MjciLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJrYXpvcmRvb24iLCJzZXNzaW9uX3N0YXRlIjoiMzVmZGE3MzEtNGFmYS00YTZjLWFiOTMtYTYzMmQyNzRiYTM3IiwiYWNyIjoiMSIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJkZWZhdWx0LXJvbGVzLXRlcnJhLW1lZGlhIiwib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoicHJvZmlsZSBlbWFpbCIsInNpZCI6IjM1ZmRhNzMxLTRhZmEtNGE2Yy1hYjkzLWE2MzJkMjc0YmEzNyIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJuYW1lIjoiVG9yaW4gRXNjdWRvIGRlIENhcnZhbGhvIiwicHJlZmVycmVkX3VzZXJuYW1lIjoidG9yaW5raW5nNDEyIiwiZ2l2ZW5fbmFtZSI6IlRvcmluIiwiZmFtaWx5X25hbWUiOiJFc2N1ZG8gZGUgQ2FydmFsaG8iLCJlbWFpbCI6InRvcmluX2VzY3Vkb19jYXJ2YWxob0Bob3RtYWlsLmNvbSJ9";

  group('Part', () {
    test('claim', () {
      Part payload = Part(payloadToken);
      expect(payload.claim('aud'), 'account');
    });

    test('claim non exists', () {
      Part payload = Part(payloadToken);
      expect(payload.claim('non_exists'), isNull);
    });

    test('claim empty', () {
      Part payload = Part(payloadToken);
      expect(payload.claim(''), isNull);
    });

    test('expiration date', () {
      Part payload = Part(payloadToken);
      expect(
          payload.claimDate("exp"), DateTime.parse('2022-09-27 17:32:52.000'));
    });

    test('expiration date invalid', () {
      Part payload = Part(payloadToken);
      expect(
          () => payload.claimDate("aud"),
          throwsA(predicate((e) =>
              e is DataExtractorTokenException &&
              e.message == 'invalid claim date')));
    });

    test('expiration date invalid non exists', () {
      Part payload = Part(payloadToken);
      expect(
          () => payload.claimDate("non_exists"),
          throwsA(predicate((e) =>
              e is DataExtractorTokenException &&
              e.message == 'invalid claim date')));
    });
  });
}
