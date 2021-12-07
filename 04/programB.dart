import '../utils.dart';
import 'bingo.dart';

void main() async {
  final int result = await iterateLinesFromFile("input.txt", solve);
  print("result is $result");
}

int solve(List<String> lines) {
  final drawnNumbers = lines[0].split(",").map((s) => int.parse(s));
  final boards = loadBoardsFromLines(lines.skip(2)).toList();

  var lastWinningScore = 0;
  for (final number in drawnNumbers) {
    var solvedBoards = <BingoBoard>[];
    for (final board in boards) {
      board.crossOutNumber(number);
      if (board.isSolved()) {
        lastWinningScore = board.getScore() * number;
        solvedBoards.add(board);
      }
    };

    solvedBoards.forEach(boards.remove);
  }
  
  return lastWinningScore;
}
