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
* Get Header and Payload claims;
* Get OpenID claims;
* Get Keycloak claims;
* Get custom claims;

![example](https://user-images.githubusercontent.com/59848966/198104955-e53f6b7a-4299-43f7-b2ab-4c97732ea648.png)

## Usage

```dart
// ...

final String _token ='valid_token';
JwtBuilder? _jwtBuilder;
Payload? _payload;
Header? _header;

@override
void initState() {
    super.initState();
    _jwtBuilder = JwtBuilder.fromToken(_token);
    _payload = _jwtBuilder!.payload;
    _header = _jwtBuilder!.header;
}

// ...

Text('${_payload!.claim('name')}'),
```



## Usage Claims

```dart
// ...

final String _token ='valid_token';
JwtBuilder? _jwtBuilder;
PayloadClaims? _payloadClaims;
OpenIdClaims? _openIdClaims;
KeycloakClaims? _keycloakClaims;
HeaderClaims? _headerClaims;

@override
void initState() {
    super.initState();
    _jwtBuilder = JwtBuilder.fromToken(_token);
    _payloadClaims = PayloadClaims(_jwtBuilder!);
    _openIdClaims = OpenIdClaims(_jwtBuilder!);
    _keycloakClaims = KeycloakClaims(_jwtBuilder!);
    _headerClaims = HeaderClaims(_jwtBuilder!);
}

// ...

Text('${_payloadClaims!.sub}'),
Text('${_openIdClaims!.name}'),
Text('${_keycloakClaims!.rolesRealmAccess}'),
Text('${_headerClaims!.typ}'),
```



## Create your own PayloadClaims class

```dart
class MyClaims extends PayloadClaims {
  MyClaims(super.jwtBuilder);

  get myPublicClaim => claim('my_public_claim');
}
```



See more: [example](/example/lib/main.dart);

Created following iana guidelines: https://www.iana.org/assignments/jwt/jwt.xhtml;

Sample token from jwt official website: https://jwt.io/;
