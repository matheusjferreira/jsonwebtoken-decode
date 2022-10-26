import 'package:flutter_test/flutter_test.dart';
import 'package:jsonwebtoken_decode/exception/data_extractor_token_exception.dart';

import 'implementation_decode_to_map.dart';

void main() {
  group('DecodeToMap', () {
    test('source empty', () {
      expect(
          () => ImplementationDecodeToMap().encodedToMap(''),
          throwsA(predicate((e) =>
              e is DataExtractorTokenException &&
              e.message == 'invalid decoded map')));
    });

    test('source base64 invalid', () {
      expect(() => ImplementationDecodeToMap().encodedToMap('invalid'),
          throwsA(const TypeMatcher<DataExtractorTokenException>()));
    });

    test('source base64 invalid message', () {
      expect(
          () => ImplementationDecodeToMap().encodedToMap('invalid'),
          throwsA(predicate((e) =>
              e is DataExtractorTokenException &&
              e.message == 'invalid format')));
    });

    test('source invalid json', () {
      expect(() => ImplementationDecodeToMap().encodedToMap('aW52YWxpZA=='),
          throwsA(const TypeMatcher<DataExtractorTokenException>()));
    });

    test('source invalid json message', () {
      expect(
          () => ImplementationDecodeToMap().encodedToMap('aW52YWxpZA=='),
          throwsA(predicate((e) =>
              e is DataExtractorTokenException &&
              e.message == 'invalid decoded map')));
    });
  });
}
