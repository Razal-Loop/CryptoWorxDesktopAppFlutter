import 'dart:convert';
import 'dart:io';

void main() {
  final server = HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  server.then((HttpServer srv) {
    print('Server running on localhost:${srv.port}');
    srv.listen((HttpRequest request) {
      if (request.method == 'POST' && request.uri.path == '/login') {
        handleLogin(request);
      } else if (request.method == 'POST' && request.uri.path == '/signup') {
        handleSignUp(request);
      } else {
        request.response
          ..statusCode = HttpStatus.notFound
          ..write('Not Found')
          ..close();
      }
    });
  });
}

void handleLogin(HttpRequest request) async {
  final content = await utf8.decoder.bind(request).join();
  print('Login request: $content');
  request.response
    ..statusCode = HttpStatus.ok
    ..write('Login successful')
    ..close();
}

void handleSignUp(HttpRequest request) async {
  final content = await utf8.decoder.bind(request).join();
  print('Sign up request: $content');
  request.response
    ..statusCode = HttpStatus.ok
    ..write('Sign up successful')
    ..close();
}
