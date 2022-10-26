import '../mixin/decode_to_map.dart';

import '../../exception/data_extractor_token_exception.dart';

class Part with DecodeToMap {
  final String _source;
  late Map<String, dynamic> _sourceMap;

  Part(this._source) {
    _sourceMap = encodedToMap(_source);
  }

  dynamic claim(String claim) =>
      _sourceMap.containsKey(claim) ? _sourceMap[claim] : null;

  DateTime? claimDate(String claimDate) {
    final claimFounded = claim(claimDate);
    if (claimFounded == null || claimFounded is! int) {
      throw DataExtractorTokenException.fromMessage('invalid claim date');
    }
    return DateTime.fromMillisecondsSinceEpoch(claimFounded * 1000);
  }
}
