import 'dart:io';

void main() {
  var first_map = {
    "description": "map is same as the objects in js",
    "Structure of data": "key:value pair",
    "disadvantage":"we can't fetch value using map.key we have to write like map[key in String type]",
    "nested_map" : {
      "nested_Object_key":"wrest syntax possible to write to get the nested object"
    }
  };

  stdout.writeln(first_map["description"]);
  final disadvantage = first_map["disadvantage"] as Map<String, dynamic>;
  stdout.writeln(disadvantage["nested_Object_key"]);
}