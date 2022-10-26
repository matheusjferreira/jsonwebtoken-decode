import 'dart:convert';

import '../../exception/data_extractor_token_exception.dart';

mixin DecodeToMap {
  Map<String, dynamic> encodedToMap(String encodedStr) {
    String decoded = _decode(encodedStr);
    return _toMap(decoded);
  }

  String _decode(String encodedStr) {
    String normalizedSource = base64Url.normalize(encodedStr);
    try {
      List<int> codeUnits = base64Url.decode(normalizedSource);
      return utf8.decode(codeUnits);
    } on FormatException {
      throw DataExtractorTokenException.fromMessage('invalid format');
    }
  }

  Map<String, dynamic> _toMap(String decodedStr) {
    try {
      return json.decode(decodedStr);
    } on FormatException {
      throw DataExtractorTokenException.fromMessage('invalid decoded map');
    }
  }
}
