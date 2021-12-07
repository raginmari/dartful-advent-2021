import '../utils.dart';
import 'bingo.dart';

void main() async {
  final int result = await iterateLinesFromFile("input.txt", solve);
  print("result is $result");
}

int solve(List<String> lines) {
  final drawnNumbers = lines[0].split(",").map((s) => int.parse(s));
  final boards = loadBoardsFromLines(lines.skip(2));

  for (final number in drawnNumbers) {
    for (final board in boards) {
      board.crossOutNumber(number);
      if (board.isSolved()) return board.getScore() * number;
    };
  }
  
  return 0;
}
