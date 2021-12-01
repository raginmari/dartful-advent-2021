// AoC 2021, day 1.1
import 'dart:io';

void main() {
  File("input.txt").readAsLines().then((lines) {
    var sw = Stopwatch()..start();

    var numbers = lines.map(int.parse).toList();
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
