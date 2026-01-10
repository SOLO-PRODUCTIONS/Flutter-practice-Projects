import 'dart:io';

void main() {
  // --------------------------------------
  var first_map = {
    "description": "map is same as the objects in js",
    "Structure of data": "key:value pair",
    "disadvantage":"we can't fetch value using map.key we have to write like map[key in String type]",
    "nested_map" : {
      "nested_Object_key":"wrest syntax possible to write to get the nested object"
    }
  };

  stdout.writeln(first_map["description"]);
  final nested_map = first_map["nested_map"] as Map<String, dynamic>;
  stdout.writeln(nested_map["nested_Object_key"]);
  // ----------------------------------------------------
  var user = {
    "userName":"",
    "email":"",
    "age":18,
    "is_logged_in":false,
    "Profile" : {
      "name" : "",
      "avatar" : "",
      "Experience_in_year": 0
    }
  };

  user["userName"] = "soloedits" ;
  user["email"] = "solo@solo.com";
  user["password"] = "";
  user["is_logged_in"] = true ;
  var profile = user["Profile"] as Map<String, dynamic>;
  profile["name"] = "SOLOEDITS" ;
  profile["avatar"] = "https://yt3.googleusercontent.com/mu3cCH1RjrYCGrZD0n3k41tLPInFisJrpwS3sy4_o9ZG0BzGv1-Xwh4rR0l5AJc5Tkkrmhca=s160-c-k-c0x00ffffff-no-rj";
  profile["password"] = "solo123" ;

  stdout.writeln("user ${user} type ${user.runtimeType}");

  // to check if the map is not empty:
  stdout.writeln(user.isNotEmpty);
  // to check if the map is empty:
  stdout.writeln(user.isEmpty);
  // to check the length of the map:
  stdout.writeln(user.length);
  // to check the keys of the map:
  stdout.writeln(user.keys);
  // to check the values of the map:
  stdout.writeln(user.values);
  // to check the map contains this specific keys or not
  stdout.writeln(user.values);
  // to check the map contains this specific values or not
  stdout.writeln(user.values);
  // to remove any specific value by giving key
  stdout.writeln(user.remove("password"));
}