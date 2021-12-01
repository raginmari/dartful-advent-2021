import 'dart:io';

void main() {
  File("input.txt").readAsLines().then((lines) {
    var sw = Stopwatch()..start();

    var numbers = slidingWindow(lines.map(int.parse).toList());
    var prev = numbers.first;
    var incs = 0;

    for (var n in numbers) {
      if (n > prev) { incs += 1; }
      prev = n;
    }

    sw.stop();
    print("result is $incs, computed in ${sw.elapsedMicroseconds} µs");
  });
}

Iterable<int> slidingWindow(List<int> numbers) sync* {
  for (var i = 0; i < numbers.length - 2; ++i) {
    yield numbers[i] + numbers[i + 1] + numbers[i + 2];
  }
}
