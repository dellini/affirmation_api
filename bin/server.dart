import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'data.dart';

// Configure routes.
final _router = Router()..get('/randomAffirmation', _randomAffirmationHandler);

Response _randomAffirmationHandler(Request request) {
  final randomIndex = Random().nextInt(affirmations.length);
  return Response.ok(
    affirmations[randomIndex].toString(),
    headers: {'Content-Type': 'text/plain'},
  );
}

Future<void> main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final _handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(_handler, ip, port);
}
