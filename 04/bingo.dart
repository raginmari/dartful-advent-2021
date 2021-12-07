import 'dart:math' as math;

class BingoBoard {

  // Please note: 0 is a valid Bingo number but crossed out numbers are represented by 0.
  // Therefore, all numbers in 'cells' are incremented by 1 when the board is initialized.
  final List<int> cells;
  final int size;
  
  BingoBoard.fromString(String string, this.size) 
    : cells = string.split(" ").map((s) => int.parse(s) + 1).toList();

  void crossOutNumber(int number) {
    final n = number + 1;
    for (var i = 0; i < cells.length; ++i) {
      if (cells[i] == n) cells[i] = 0;
    }
  }

  bool isSolved() {
    return [
      for (var i = 0; i < size; ++i) row(i),
      for (var i = 0; i < size; ++i) column(i)
    ].any((e) => e.reduce((p, n) => p + n) == 0);
  }

  Iterable<int> row(int index) sync* {
    final firstInRow = index * size;
    for (var i = 0; i < size; ++i) {
      yield cells[firstInRow + i];
    }
  }

  Iterable<int> column(int index) sync* {
    for (var i = 0; i < size; ++i) {
      yield cells[i * size + index];
    }
  }

  int getScore() => cells.fold(0, (p, n) => p + math.max(0, n - 1));
}

Iterable<BingoBoard> loadBoardsFromLines(Iterable<String> lines) {
  final iterator = lines.iterator;
  final buffer = <String>[];
  final boards = <BingoBoard>[];
  while (iterator.moveNext()) {
    if (iterator.current.trim().isEmpty && !buffer.isEmpty) {
      boards.add(BingoBoard.fromString(buffer.join(" "), buffer.length));
      buffer.clear();
    } else {
      buffer.add(sanitizeLine(iterator.current));
    }
  }

  return boards;
}

final multipleWhitespacesRegExp = RegExp(r"\s{2,}");
String sanitizeLine(String line) => line.trim().replaceAll(multipleWhitespacesRegExp, " ");