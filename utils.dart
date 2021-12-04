import 'dart:io';

Future<T> iterateLinesFromFile<T>(String filename, T Function(List<String>) body) async {
  var lines = await File(filename).readAsLines();

  final sw = Stopwatch()..start();
  final result = body(lines);
  sw.stop();
  
  print("body execution took ${sw.elapsedMicroseconds} µs");

  return result;
}