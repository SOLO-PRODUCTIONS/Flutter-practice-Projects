import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // App bar
        appBar: AppBar(
          backgroundColor:Colors.black,
          shape: const Border(
            bottom: BorderSide(
              color: Color.fromARGB(255, 29, 51, 108),
              width: 2
            )
          ),
          title: const Text(
            "SOLOPLAY",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: "elemental"
            ),
          ),
        ),

        // Main Body
        body: Container(
          color:Colors.black,
          child: Center(
            child:
            Container(
              width: 300,
              height: 450,
              padding: const EdgeInsets.only(top:10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 135, 139, 152),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      "Admin",
                      style: TextStyle(
                        color: Color.fromARGB(255, 211, 213, 234),
                        fontSize: 20,
                        fontFamily: "elemental",
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ]
                )
              ),
            ),
          ),
        )
      ),
    );
  }
}