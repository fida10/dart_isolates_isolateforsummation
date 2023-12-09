/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'dart:isolate';

export 'src/isolates_isolateforsummation_base.dart';

/*
Practice Question 3: Isolate for Summation

Task:

Implement a function sumListInIsolate that takes a list of integers and 
calculates their sum in a separate isolate. 
The function should return a Future<int> with the sum.
 */

Future<dynamic> sumListInIsolate(List<int> input) async {
  final receivePort = ReceivePort();
  final newIsolate = await Isolate.spawn(
     _isolateItself,
     [receivePort.sendPort, input]
  );

  final sum = await receivePort.first;
  receivePort.close();
  newIsolate.kill();
  return sum;
}

void _isolateItself(List<dynamic> input){
  int sum = input[1].fold(0, (previousValue, element) => previousValue + element);
  Isolate.exit(input[0], sum);
}
