import 'package:flutter/material.dart';
import 'package:jsonwebtoken_decode/builder/parts/jwt_parts/header_part.dart';
import 'package:jsonwebtoken_decode/builder/parts/jwt_parts/payload_part.dart';
import 'package:jsonwebtoken_decode/jwt_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JWT Decode and Claims Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'JWT Decode and Claims Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c";
  JWTApp? _app;
  Payload? _payload;
  Header? _header;
  final _headerTextStyle = const TextStyle(color: Colors.red);
  final _payloadTextStyle = const TextStyle(color: Colors.purple);
  final _verifySignatureTextStyle = const TextStyle(color: Colors.cyan);

  @override
  void initState() {
    super.initState();

    _app = JWTApp(_token);
    _payload = _app!.payload;
    _header = _app!.header;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              _buildTokenExampleText(),
              const SizedBox(height: 32),
              _buildDecodedToken(),
            ],
          ),
        ),
      ),
    );
  }

  _buildTokenExampleText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'JWT example: https://jwt.io/',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        const Text('Full token:'),
        const SizedBox(height: 8),
        const Text(
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c'),
        const SizedBox(height: 24),
        const Text('Header'),
        Text(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
          style: _headerTextStyle,
        ),
        const SizedBox(height: 24),
        const Text('Payload'),
        Text(
          'eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ',
          style: _payloadTextStyle,
        ),
        const SizedBox(height: 24),
        const Text('Verify Signature'),
        Text(
          'SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
          style: _verifySignatureTextStyle,
        ),
      ],
    );
  }

  _buildDecodedToken() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Decoded Header Claims:'),
        const SizedBox(height: 8),
        Text(
          '{',
          style: _headerTextStyle,
        ),
        Text(
          '    "alg" : "${_header!.claim('alg')}"',
          style: _headerTextStyle,
        ),
        Text(
          '    "typ" : "${_header!.claim('typ')}"',
          style: _headerTextStyle,
        ),
        Text(
          '}',
          style: _headerTextStyle,
        ),
        const SizedBox(height: 24),
        const Text('Decoded Payload Claims:'),
        Text(
          '{',
          style: _payloadTextStyle,
        ),
        Text(
          '    "sub" : "${_payload!.claim('sub')}"',
          style: _payloadTextStyle,
        ),
        Text(
          '    "name" : "${_payload!.claim('name')}"',
          style: _payloadTextStyle,
        ),
        Text(
          '    "iat" : "${_payload!.claim('iat')}"',
          style: _payloadTextStyle,
        ),
        Text(
          '}',
          style: _payloadTextStyle,
        ),
      ],
    );
  }
}
