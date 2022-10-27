import '../part.dart';

class Header extends Part {
  Header._internal(super.part);

  factory Header.fromPart(String part) => Header._internal(part);
}
