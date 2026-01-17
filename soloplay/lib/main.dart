import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> _launchYoutube() async{
    final Uri url = Uri.parse("https://www.youtube.com/@SOLOEDITS7");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)){
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        // App bar
        appBar: AppBar(
          backgroundColor:Colors.transparent,
          toolbarHeight: 55,
          elevation: 0,
          title: const Text(
            "SOLOPLAY",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: "elemental",
              fontSize: 23,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsGeometry.only(right: 8),
              child: IconButton(
                  iconSize: 26,
                  onPressed: _launchYoutube,
                  icon: FaIcon(
                    FontAwesomeIcons.youtube,
                    color: Color.fromARGB(255, 255, 255, 255)
                  )
              )
            )
          ],
        ),

        // Main Body
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Interstaller black hole.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment(-0.4,0.0),

                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),BlendMode.darken
                  )
              )
          ),
          child: Stack(
            children: [
              Center(
                child:
                Container(
                  width: 300,
                  height: 450,
                  padding: const EdgeInsets.only(top:10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 255, 255, 255),
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
                            color: Color.fromARGB(255, 255, 255, 255),
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
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(100, 50),
                            backgroundColor: Color.fromARGB(100, 0, 0, 0),
                            foregroundColor: Color.fromARGB(255, 255, 255, 255),
                            side: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                              width: 2,
                            ),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            )
                          ).copyWith(
                            overlayColor: WidgetStateProperty.resolveWith((status){
                              if(status.contains(WidgetState.pressed)){
                                return Color.fromARGB(255, 255, 255, 255);
                              }else{
                                return Colors.transparent;
                              }
                            })
                          ),
                          child:Text(
                              "Login",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "elemental",
                              color: Color.fromARGB(255, 255, 255, 255)
                            ),
                          )
                        ),
                      ]
                    )
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 20.0),
                  child: Text(
                    "©SOLO-PRODUCTIONS",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)
                    ),
                  ),
                )
              )
            ],
          ),
        )
      ),
    );
  }
}