import '../utils.dart';

void main() async {
  final result = await iterateLinesFromFile("input.txt", solve);
  print("result is $result");
}

int solve(List<String> lines) {
  final bitsPerNumber = lines[0].length;
  final numbers = lines.map((line) => int.parse(line, radix: 2));

  final o = findNumber(numbers, bitsPerNumber, (ones, limit) => ones >= limit);
  final c = findNumber(numbers, bitsPerNumber, (ones, limit) => ones < limit);

  return o * c;
}

int findNumber(Iterable<int> numbers, int bits, bool Function(int ones, int limit) shouldPickOnes) {
  for (int i = bits - 1; i >= 0 && numbers.length > 1; --i) {
    final mask = 1 << i;
    final limit = (numbers.length / 2).floor();
    final int ones = numbers.fold(0, (p, n) => p + ((n & mask) >> i));
    if (shouldPickOnes(ones, limit)) {
      numbers = numbers.where((n) => (n & mask) > 0);
    } else {
      numbers = numbers.where((n) => (n & mask) == 0);
    }
  }
  
  return numbers.last;
}