class DataExtractorTokenException implements Exception {
  final String message;
  DataExtractorTokenException._internal(this.message);

  factory DataExtractorTokenException.fromMessage(String message) =>
      DataExtractorTokenException._internal(message);
}
