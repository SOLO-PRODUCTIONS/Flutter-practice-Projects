import 'dart:io';

void main () {
  stdout.write("welcome to Dart");

  stdout.write("Enter your name:"); // it will show output as it is
  var name = stdin.readLineSync();

  stdout.write(
      'your name:$name'); // will compress it and the white space will get cleared.

  // variable creation

  // int datatype
  int? soloedits; // by default the value of the variable will be null if we don't assign anuthing.
  stdout.write(soloedits
      .toString()); //to string will conver the integer to string like if the variable is 5 then it will become "5"
  soloedits = 7497;
  stdout.write(soloedits);
  stdout.write(soloedits.toString());
  soloedits = 9774;
  stdout.write(soloedits.toString());

  // Bigint datatype
  // we can only store 19 intigers in int datatype or else we need Bigint variable to store number more then that much integers.
  BigInt b;
  b = BigInt.parse("1234567891233456789112345678911234567891123456789");
  // parse will convert the string into integer
  stdout.write(b);
  stdout.write(b.runtimeType);
  // runtimeType will show the tupe of data

  //Sring datatype:
  String sologaming = "solo";
  stdout.write(sologaming);
  sologaming = "solo7497";
  stdout.write(sologaming);

  //double datatype
  double c;
  c = 9.98;
  stdout.write("Data =$c, Datatype = ${c.runtimeType}.");
  // double stores float type numbers like percentage and all

  // num datatype
  num d = 120;
  stdout.write("Data =$d, Datatype = ${d.runtimeType}.");
  d = 120.55;
  stdout.write("Data =$d, Datatype = ${d.runtimeType}.");
  // num is used when we don't know that the integer will became float type in future or not.

  // boolean datatype ;
  bool e = false ;
  if (e){
    stdout.write("boolean variable e is true");
  }
  else{
    stdout.write("boolean variablle e is false");
  }

  // var :
  var f = "String type data";
  stdout.writeln(f.runtimeType);
  // here while creating var variable we give data at same time.
  // so now the data type got set as String and if we try to assign data as different datatype like integers
  // it will throw like you have to assign this data to a integer type variable.

  // var as dynamic datatype :
  var g ;
  g = "String" ;
  stdout.writeln('data :$g datatype: ${g.runtimeType}');
  g = 67 ;
  stdout.writeln('data :$g datatype: ${g.runtimeType}');
  g = 9.98 ;
  stdout.writeln('data :$g datatype: ${g.runtimeType}');
  // as dynamic datatype we can any type of datatype at anytime it will convert it's data type

  // Class declaration :
  var solo = Solo();
  stdout.writeln("addition of solo and edits is : ${solo.add("solo","edits")}, ${solo.add("solo","edits").runtimeType}");
  stdout.writeln(solo);
}

// class creation
class Solo {

  Solo(){
    stdout.writeln("this is default constructor");
  }
  // default constructor is the constructor which get created automatically when aa new instance is created
  // it have same name as the class name also if we want that when we create the instance of this constructor some code get executed immediately then its possible with this default constructor
  // function that return Integer value

  // function inside the class:
  String add(a, b) {
    return a + b;
  }
}

// we can create multiple class for multiple type of function.