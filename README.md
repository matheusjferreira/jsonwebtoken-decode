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

![example](https://user-images.githubusercontent.com/59848966/198104486-fbaaaeaf-e257-4400-8ec3-427c282019dc.png)

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
