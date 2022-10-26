<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# JSONWEBTOKEN DECODE

Package for decoding Json Web Token (JWT), and selecting specific claims.

## Features

* Decode jwt;
* Get header and payload claims;

<img src="/assets/images/example.png" width="432px" height="768px">

<!-- ## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package. -->

## Usage

```dart
// ...

final String _token ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c";
JWTApp? _app;
Payload? _payload;
Header? _header;

@override
void initState() {
    super.initState();
    _app = JWTApp(_token);
    _payload = _app!.payload;
    _header = _app!.header;
}

// ...

Text('${_payload!.claim('name')'),
```

See more: [example](/example/lib/main.dart);

<!-- ## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more. -->
