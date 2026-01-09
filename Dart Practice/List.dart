import 'dart:io';

void main(){
  List a = [1,2,3,4,5];
  List b = [6,7,8,9,10];

  stdout.writeln(a);

  // adds element at the last of list
  a.add(6);
  stdout.writeln(a);

  // adds all element from different list
  a.addAll(b);
  stdout.writeln(a);

  //insert will add element at particular index
  a.insert(0, 0);
  stdout.writeln(a);

  //inserts all element from different list to particular index.
  a.insertAll(a.length, b);
  stdout.writeln(a);

  // can update the element
  a[0] = 1;
  // to replace element based on the rage of element
  a.replaceRange(0, 8, ["s","o","l","o","e","d","i","t","s"]);
  stdout.writeln(a);

  // removes element from last
  a.removeLast();
  stdout.writeln(a);
  // removes element from particular index
  a.removeAt(9);
  stdout.writeln(a);
  // removes element based on range:
  a.removeRange(9, a.length);
  stdout.writeln(a);

  // to check the length of list (output will be number)
  stdout.writeln(a.length);
  // to reverse the list
  stdout.writeln("${a.reversed} Data type : ${a.runtimeType}"); // output : (s, t, i, d, e, o, l, o, s) Data type : List<dynamic>
  // to get the first element of the List
  stdout.writeln(a.first);
  // to get the last element of the List
  stdout.writeln(a.last);
  // to check if the List is empty or not also the return value will be bool value
  stdout.writeln(a.isEmpty);
  // also to check that the List is not Empty
  stdout.writeln(a.isNotEmpty);
}