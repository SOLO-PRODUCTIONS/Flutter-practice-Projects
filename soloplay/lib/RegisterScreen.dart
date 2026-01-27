import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPasswordHidden = true;
  final inputUserName = TextEditingController();
  final inputPassword = TextEditingController();
  final inputEmail = TextEditingController();

  Future<void> _launchYoutube() async {
    final Uri url = Uri.parse("https://www.youtube.com/@SOLOEDITS7");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  @override
  void dispose() {
    inputUserName.dispose();
    inputPassword.dispose();
    inputEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,

      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
              icon: const FaIcon(
                FontAwesomeIcons.youtube,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/images/PhotonCloud_black_hole.png"),
                fit: BoxFit.cover,
                alignment: const Alignment(-0.4, 0.0),
              ),
            ),
          ),

          // Register Card
          Center(
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Container(
                width: 330, // Slightly wider for Register
                height: 420,
                padding: const EdgeInsets.only(top: 14),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(82, 0, 0, 0),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "elemental",
                        ),
                      ),

                      // Username Input
                      Theme(
                        data: Theme.of(context).copyWith(
                            textSelectionTheme: TextSelectionThemeData(
                                selectionColor: Colors.lightBlue.withAlpha(130),
                                selectionHandleColor: const Color.fromARGB(255, 0, 236, 255)
                            )
                        ),
                        child: Container(
                          width: 280,
                          margin: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,

                            // Controller
                            controller: inputUserName,

                            // Curser :
                            cursorColor: const Color.fromARGB(255, 255, 255, 255),
                            cursorWidth: 1.5,
                            cursorHeight: 20,
                            cursorRadius: const Radius.circular(10),

                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 14.5, horizontal: 15.0),
                                isDense:true,

                                //Text :
                                hintText: "Username",
                                hintStyle: const TextStyle(
                                    fontSize: 13.9,
                                    color: Color.fromARGB(255, 255, 255, 255)
                                ),

                                // Border :
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 116, 216, 124),
                                      width: 2
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 255, 255, 255)
                                    )
                                ),

                                //Icon :
                                prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.white
                                )
                            ),
                          ),
                        ),
                      ),

                      //Email :
                      Theme(
                        data: Theme.of(context).copyWith(
                            textSelectionTheme: TextSelectionThemeData(
                                selectionColor: Colors.lightBlue.withAlpha(130),
                                selectionHandleColor: const Color.fromARGB(255, 0, 236, 255)
                            )
                        ),
                        child: Container(
                          width: 280,
                          margin: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,

                            // Controller
                            controller: inputEmail,

                            // Curser :
                            cursorColor: const Color.fromARGB(255, 255, 255, 255),
                            cursorWidth: 1.5,
                            cursorHeight: 20,
                            cursorRadius: const Radius.circular(10),

                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 14.5, horizontal: 15.0),
                                isDense:true,

                                //Text :
                                hintText: "Email",
                                hintStyle: const TextStyle(
                                    fontSize: 13.9,
                                    color: Color.fromARGB(255, 255, 255, 255)
                                ),

                                // Border :
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 116, 216, 124),
                                      width: 2
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 255, 255, 255)
                                    )
                                ),

                                //Icon :
                                prefixIcon: const Icon(
                                    Icons.email_rounded,
                                    color: Colors.white
                                )
                            ),
                          ),
                        ),
                      ),

                      // Password Input
                      Theme(
                        data: Theme.of(context).copyWith(
                            textSelectionTheme: TextSelectionThemeData(
                                selectionColor: Colors.lightBlue.withAlpha(130),
                                selectionHandleColor: const Color.fromARGB(255, 0, 236, 255)
                            )
                        ),
                        child: Container(
                          width: 280,
                          margin: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                          child: TextField(
                            controller: inputPassword,
                            textAlignVertical: TextAlignVertical.center,

                            // Curser :
                            cursorColor: const Color.fromARGB(255, 255, 255, 255),
                            cursorWidth: 1.5,
                            cursorHeight: 20,
                            cursorRadius: const Radius.circular(10),

                            //Text hider :
                            obscureText: _isPasswordHidden,
                            obscuringCharacter: "•",

                            style: const TextStyle(
                                color: Colors.white
                            ),

                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 14.5, horizontal: 15.0),
                              isDense:true,

                              //Text :
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                  fontSize: 13.9,
                                  color: Color.fromARGB(255, 255, 255, 255)
                              ),

                              // Border :
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 116, 216, 124),
                                    width: 2
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255)
                                  )
                              ),

                              //Icons :
                              prefixIcon: const Icon(
                                  Icons.lock_rounded,
                                  color: Colors.white
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isPasswordHidden = !_isPasswordHidden;
                                  });
                                },
                                icon: Icon(
                                  _isPasswordHidden? Icons.visibility_rounded : Icons.visibility_off_rounded,
                                  color: Colors.white,
                                ),
                              )
                            ),
                          ),
                        ),
                      ),

                      // Sign Up Button
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ElevatedButton(
                          onPressed: () {
                            // Register Logic
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(120, 50),
                            backgroundColor: const Color.fromARGB(100, 0, 0, 0),
                            side: const BorderSide(color: Colors.white, width: 2),
                            elevation: 5,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          ).copyWith(
                            foregroundColor: WidgetStateProperty.all(Colors.white),
                            overlayColor: WidgetStateProperty.all(Color.fromARGB(116, 255, 255, 255)
                            )
                          )
                          ,
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 14, fontFamily: "elemental", color: Colors.white),
                          ),
                        ),
                      ),

                      // Link Back to Login
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account? ",
                              style: TextStyle(color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Since we Pushed to get here, we Pop to go back
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Login here",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 5, 223, 255),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}