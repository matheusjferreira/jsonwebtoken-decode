import '../part.dart';

class Payload extends Part {
  Payload(super.part);

  factory Payload.fromPart(String part) => Payload(part);
}
