import 'dart:math';

final twoPointsRegExp = RegExp(r"^(\d+,\d+)\D+(\d+,\d+)$");

extension LineFromString on String {
  Line parseLine() {
    final match = twoPointsRegExp.allMatches(this).toList().first;
    if (match.groupCount < 2) throw FormatException("malformed line description '$this'");
    final p1 = (match.group(1) ?? "0,0").parsePoint();
    final p2 = (match.group(2) ?? "0,0").parsePoint();
    return Line(p1, p2);
  }
}

extension PointFromString on String {
  Point<int> parsePoint() {
    final coordinates = this.split(",").map(int.parse).toList();
    if (coordinates.length != 2) throw FormatException("malformed Point description '$this'");
    return Point<int>(coordinates[0], coordinates[1]);
  }
}

class Line {
  final Point<int> p1;
  final Point<int> p2;
  
  Line(this.p1, this.p2);

  bool isDiagonal() => (p2.x - p1.x != 0) && (p2.y - p1.y != 0);

  @override
  String toString() => "(${p1.x},${p1.y}) -> (${p2.x},${p2.y})";
}