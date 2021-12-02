import 'dart:io';

void main() {
  File("input.txt").readAsLines().then((lines) {
    var sw = Stopwatch()..start();
    
    var x = 0, d = 0;
    
    for (var line in lines) {
      var components = line.split(" ");
      var cmd = components[0];
      var val = int.parse(components[1]);
      if (cmd.startsWith("f")) {
        x += val;
      } else 
      if (cmd.startsWith("u")) {
        d -= val;
      } else 
      if (cmd.startsWith("d")) {
        d += val;
      }
    }
    
    var result = x * d;
    
    sw.stop();
    print("result is $result, computed in ${sw.elapsedMicroseconds} µs");
  });
}