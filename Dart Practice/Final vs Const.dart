// Final : to assign a variable which can not be modify in runtime.
// Const : to assign a constant variable which always have initial data and can not be change at runtime.

import 'dart:io';

void main() {
  final a ;
  a = 10 ; // now after this to variable can't be changed.

  const b = 10 ; // we always have to give initial value to the defined variable.
  stdout.writeln("$a $b");
}