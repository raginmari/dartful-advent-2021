import '../utils.dart';

void main() async {
  final result = await iterateLinesFromFile("input.txt", solve);
  print("result is $result");
}

int solve(Iterable<String> lines) {
  final fish = lines.first.split(",").map(int.parse).toList();

  for (var day = 0; day < 80; ++day) {
    var fishToCreate = 0;
    for (var i = 0; i < fish.length; ++i) {
      if (fish[i] == 0) {
        fish[i] = 6;
        fishToCreate += 1;
      } else {
        fish[i] -= 1;
      }
    }
    
    for (var i = 0; i < fishToCreate; ++i) fish.add(8);
  }

  return fish.length;
}