import 'dart:io';

void main() {
  File("input.txt").readAsLines().then((lines) {
    var sw = Stopwatch()..start();
    
    var x = 0, a = 0, d = 0;
    
    for (var line in lines) {
      var components = line.split(" ");
      var cmd = components[0];
      var val = int.parse(components[1]);
      if (cmd.startsWith("f")) {
        x += val;
        d += val * a;
      } else 
      if (cmd.startsWith("u")) {
        a -= val;
      } else 
      if (cmd.startsWith("d")) {
        a += val;
      }
    }
    
    var result = x * d;
    
    sw.stop();
    print("result is $result, computed in ${sw.elapsedMicroseconds} µs");
  });
}