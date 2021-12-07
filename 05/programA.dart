import 'dart:math';
import 'lines.dart';
import '../utils.dart';

void main() async {
  final result = await iterateLinesFromFile("input.txt", solve);
  print("result is $result");
}

int solve(Iterable<String> inputLines) {
  // Solution of part 1: filter diagonal lines
  // final lines = inputLines.map((s) => s.parseLine()).where((line) => !line.isDiagonal());

  // Solution of part 2
  final lines = inputLines.map((s) => s.parseLine());
  
  final points = [ 
    for (final line in lines) ...pointsOfLine(line)
  ];
  
  final grid = <Point, int>{};
  for (final point in points) {
    grid[point] = (grid[point] ?? 0) + 1;
  }
  
  final result = grid.values.where((counter) => counter > 1).length;
  
  return result;
}

Iterable<Point<int>> pointsOfLine(Line line) sync* {
  var x = line.p1.x;
  var y = line.p1.y;
  final toX = line.p2.x;
  final toY = line.p2.y;
  final dx = (toX - x).sign;
  final dy = (toY - y).sign;
  
  while (x != toX || y != toY) {
    yield Point(x, y);
    x += dx;
    y += dy;
  }

  yield Point(toX, toY);
}