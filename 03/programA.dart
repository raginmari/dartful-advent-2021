import '../utils.dart';

void main() async {
  final result = await iterateLinesFromFile("input.txt", solve);
  print("result is $result");
}

int solve(List<String> lines) {
  final bitsPerNumber = lines[0].length;
  final numbers = lines.map((line) => int.parse(line, radix: 2));

  var e = 0, g = 0;
  final limit = (numbers.length / 2).floor();
  for (var i = 0; i < bitsPerNumber; ++i) {
    final mask = 1 << i;
    final int ones = numbers.fold(0, (p, n) => p + ((n & mask) >> i));
    if (ones > limit) {
      e |= mask;
    } else {
      g |= mask;
    }
  }

  return e * g;
}