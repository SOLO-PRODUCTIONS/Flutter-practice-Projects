import 'dart:io';

import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:soloplay/Widgets/button.dart';
import 'package:soloplay/home.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const SoloPlayApp());
}

// 1. APP ENTRY POINT & THEME
class SoloPlayApp extends StatelessWidget {
  const SoloPlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SOLOPLAY",
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.dark,
        ),

        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MainScreen(),
    );
  }
}

// 2. MAIN SCREEN (STATEFUL - Holds Background & Layout)
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Logic screen state
  Future<void> _launchYoutube() async {
    final Uri url = Uri.parse("https://www.youtube.com/@SOLOEDITS7");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset:
          false, // Prevents pixel overflow when keyboard opens
      // AppBar
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
          ),
        ],
      ),

      // Body with Stack
      body: Stack(
        children: [
          // LAYER 1: The Background Image (Reusable & Static)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                  "assets/images/PhotonCloud_black_hole.png",
                ),
                fit: BoxFit.cover,
                alignment: const Alignment(-0.4, 0.0),
              ),
            ),
          ),

          // LAYER 2: The Login Class (Centered)
          const Center(child: LoginScreen()),

          // LAYER 3: Copyright Footer
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                "©SOLO-PRODUCTIONS",
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 3. SEPARATE LOGIN CLASS
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Variables :
  bool _isPasswordHidden = true;

  // Controllers defined here to persist state
  final inputUserNameOrEmail = TextEditingController();
  final inputPassword = TextEditingController();

  //Dispose controllers to prevent memory leaks
  @override
  void dispose() {
    inputUserNameOrEmail.dispose();
    inputPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },

      child: Container(
        width: 320,
        height: 320,
        padding: const EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          color: Color.fromARGB(82, 0, 0, 0),
          border: Border.all(
            color: const Color.fromARGB(255, 255, 255, 255),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const Text(
                "Admin",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontFamily: "elemental",
                ),
              ),

              // Username/Email Input
              Theme(
                data: Theme.of(context).copyWith(
                  textSelectionTheme: TextSelectionThemeData(
                    selectionColor: Colors.lightBlue.withAlpha(130),
                    selectionHandleColor: const Color.fromARGB(
                      255,
                      0,
                      236,
                      255,
                    ),
                  ),
                ),
                child: Container(
                  width: 270,
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,

                    // Controller
                    controller: inputUserNameOrEmail,

                    // Curser :
                    cursorColor: const Color.fromARGB(255, 255, 255, 255),
                    cursorWidth: 1.5,
                    cursorHeight: 20,
                    cursorRadius: const Radius.circular(10),

                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 14.5,
                        horizontal: 15.0,
                      ),
                      isDense: true,

                      //Text :
                      hintText: "Username/Email",
                      hintStyle: const TextStyle(
                        fontSize: 13.9,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),

                      // Border :
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 116, 216, 124),
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),

                      //Icon :
                      prefixIcon: const Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                ),
              ),

              // Password / Second Input Placeholder
              Theme(
                data: Theme.of(context).copyWith(
                  textSelectionTheme: TextSelectionThemeData(
                    selectionColor: Colors.lightBlue.withAlpha(130),
                    selectionHandleColor: const Color.fromARGB(
                      255,
                      0,
                      236,
                      255,
                    ),
                  ),
                ),
                child: Container(
                  width: 270,
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: TextField(
                    // Controller
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

                    style: const TextStyle(color: Colors.white),

                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 14.5,
                        horizontal: 15.0,
                      ),
                      isDense: true,

                      //Text :
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        fontSize: 13.9,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),

                      // Border :
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 116, 216, 124),
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),

                      //Icons :
                      prefixIcon: const Icon(
                        Icons.lock_rounded,
                        color: Colors.white,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordHidden = !_isPasswordHidden;
                          });
                        },
                        icon: Icon(
                          _isPasswordHidden
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Login Button
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SoloButton(
                  text: "Login",
                  FontFamily: "elemental",
                  onTapped: () {
                    // Add login logic here
                    String usernameOrEmail = inputUserNameOrEmail.text;
                    String password = inputPassword.text;

                    debugPrint("Username/Email: $usernameOrEmail");
                    debugPrint("Password: $password");

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => homePage()),
                    );
                  },
                  backGroundColor: const Color.fromARGB(14, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Registration link code :
/* Container(
    margin: const EdgeInsets.only(top: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have account ?"),
        GestureDetector(
          onTap: () {
            // Add register logic here
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterScreen(),
              ),
            );
          },
          child: Text(
            " Register here",
            style: TextStyle(
              color: Color.fromARGB(255, 5, 223, 255),
            ),
          ),
        ),
      ],
    ),
  ),
*/

// Old Login widgit :
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Container(
//         width: 300,
//         height: 350,
//         padding: const EdgeInsets.only(top: 14),
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: const Color.fromARGB(255, 255, 255, 255),
//             width: 2,
//           ),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Align(
//           alignment: Alignment.topCenter,
//           child: Column(
//             children: [
//               const Text(
//                 "Admin",
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 255, 255, 255),
//                   fontSize: 20,
//                   fontFamily: "elemental",
//                 ),
//               ),
//
//               // Username/Email Input
//               Theme(
//                 data: Theme.of(context).copyWith(
//                     textSelectionTheme: TextSelectionThemeData(
//                         selectionColor: Colors.lightBlue.withAlpha(130),
//                         selectionHandleColor: Color.fromARGB(255, 0, 236, 255)
//                     )
//                 ),
//                 child: Container(
//                   width: 250,
//                   margin: const EdgeInsets.fromLTRB(0, 15, 0, 10),
//                   child: TextField(
//                     controller: userNameOrEmail,
//                     textAlignVertical: TextAlignVertical.center,
//
//                     // Curser :
//                     cursorColor: Color.fromARGB(255, 255, 255, 255),
//                     cursorWidth: 1.5,
//                     cursorHeight: 20,
//                     cursorRadius: const Radius.circular(10),
//
//                     decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(vertical: 14.5, horizontal: 15.0),
//                         isDense:true,
//
//                         //Text :
//                         hintText: "Username/email",
//                         hintStyle: const TextStyle(
//                             fontSize: 12.9,
//                             color: Color.fromARGB(255, 255, 255, 255)
//                         ),
//
//                         // Border :
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(14),
//                           borderSide: const BorderSide(
//                               color: Color.fromARGB(255, 116, 216, 124),
//                               width: 2
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: const BorderSide(
//                                 color: Color.fromARGB(255, 255, 255, 255)
//                             )
//                         ),
//
//                         //Icon :
//                         prefixIcon: Icon(
//                             Icons.person,
//                             color: Colors.white
//                         )
//                     ),
//                   ),
//                 ),
//               ),
//
//               // Password / Second Input Placeholder
//               Theme(
//                 data: Theme.of(context).copyWith(
//                     textSelectionTheme: TextSelectionThemeData(
//                         selectionColor: Colors.lightBlue.withAlpha(130),
//                         selectionHandleColor: Color.fromARGB(255, 0, 236, 255)
//                     )
//                 ),
//                 child: Container(
//                   width: 250,
//                   margin: const EdgeInsets.fromLTRB(0, 15, 0, 10),
//                   child: TextField(
//                     controller: password,
//                     textAlignVertical: TextAlignVertical.center,
//
//                     // Curser :
//                     cursorColor: Color.fromARGB(255, 255, 255, 255),
//                     cursorWidth: 1.5,
//                     cursorHeight: 20,
//                     cursorRadius: const Radius.circular(10),
//
//                     decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(vertical: 14.5, horizontal: 15.0),
//                         isDense:true,
//
//                         //Text :
//                         hintText: "Password",
//                         hintStyle: const TextStyle(
//                             fontSize: 12.9,
//                             color: Color.fromARGB(255, 255, 255, 255)
//                         ),
//
//                         // Border :
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(14),
//                           borderSide: const BorderSide(
//                               color: Color.fromARGB(255, 116, 216, 124),
//                               width: 2
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: const BorderSide(
//                                 color: Color.fromARGB(255, 255, 255, 255)
//                             )
//                         ),
//
//                         //Icon :
//                         prefixIcon: Icon(
//                             Icons.lock,
//                             color: Colors.white
//                         ),
//                         suffixIcon: IconButton(
//                           onPressed: () {},
//                           icon: const Icon(
//                             Icons.remove_red_eye_rounded,
//                             color: Colors.white,
//                           ),
//                         )
//                     ),
//                   ),
//                 ),
//               ),
//
//               // Login Button
//               Padding(
//                 padding: const EdgeInsets.only(top: 15),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Add login logic here
//                   },
//
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(100, 50),
//                     backgroundColor: const Color.fromARGB(100, 0, 0, 0),
//                     side: const BorderSide(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       width: 2,
//                     ),
//                     elevation: 5,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ).copyWith(
//                     foregroundColor: WidgetStateProperty.resolveWith<Color>(
//                           (states) {
//                         if (states.contains(WidgetState.pressed)) {
//                           return Colors.black;
//                         }
//                         return Colors.white;
//                       },
//                     ),
//                     overlayColor: WidgetStateProperty.resolveWith(
//                           (status) {
//                         if (status.contains(WidgetState.pressed)) {
//                           return const Color.fromARGB(255, 255, 255, 255);
//                         } else {
//                           return Colors.transparent;
//                         }
//                       },
//                     ),
//                   ),
//                   child: const Text(
//                     "Login",
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontFamily: "elemental",
//                     ),
//                   ),
//                 ),
//               ),
//
//               Container(
//                 margin: const EdgeInsets.only(top: 20),
//                 child: Text(
//                     "Don't have an account?",
//                     style: TextStyle(
//                         color: Color.fromARGB(255, 255, 255, 255)
//                     )
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Old code :

// import 'package:flutter/material.dart';
// import "package:font_awesome_flutter/font_awesome_flutter.dart";
// import 'package:url_launcher/url_launcher.dart';
//
// void main() {
//   runApp(const Login());
// }
//
// class Login extends StatelessWidget {
//   const Login({super.key});
//
//   Future<void> _launchYoutube() async{
//     final Uri url = Uri.parse("https://www.youtube.com/@SOLOEDITS7");
//     if (!await launchUrl(url, mode: LaunchMode.externalApplication)){
//       throw Exception("Could not launch $url");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // title of app
//       title: "SOLOPLAY",
//
//       // main theme of app
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.black,
//           brightness: Brightness.dark
//         )
//       ),
//
//       debugShowCheckedModeBanner: false,
//
//       // main app functionality
//       home: Scaffold(
//         extendBodyBehindAppBar: true,
//         resizeToAvoidBottomInset: false,
//
//         // App bar
//         appBar: AppBar(
//           backgroundColor:Colors.transparent,
//           toolbarHeight: 55,
//           elevation: 0,
//           title: const Text(
//             "SOLOPLAY",
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 255, 255),
//               fontFamily: "elemental",
//               fontSize: 23,
//             ),
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsetsGeometry.only(right: 8),
//               child: IconButton(
//                   iconSize: 26,
//                   onPressed: _launchYoutube,
//                   icon: FaIcon(
//                     FontAwesomeIcons.youtube,
//                     color: Color.fromARGB(255, 255, 255, 255)
//                   )
//               )
//             )
//           ],
//         ),
//
//         // Main Body
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/images/PhotonCloud_black_hole.png"),
//                   fit: BoxFit.cover,
//                   alignment: Alignment(-0.4,0.0),
//
//                   colorFilter: ColorFilter.mode(
//                     Colors.black.withOpacity(0.2),BlendMode.darken
//                   )
//               )
//           ),
//           child: Stack(
//             children: [
//               Center(
//                 child:
//                 Container(
//                   width: 300,
//                   height: 450,
//                   padding: const EdgeInsets.only(top:10),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       width: 2,
//                     ),
//                     borderRadius: BorderRadius.circular(20)
//                   ),
//                   child: Align(
//                     alignment: Alignment.topCenter,
//                     child: Column(
//                       children: [
//                         Text(
//                           "Admin",
//                           style: TextStyle(
//                             color: Color.fromARGB(255, 255, 255, 255),
//                             fontSize: 20,
//                             fontFamily: "elemental",
//                           ),
//                         ),
//                         Container(
//                           height: 50,
//                           width: 250,
//                           margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//                           child: TextField(
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10)
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(13),
//                                 borderSide: BorderSide(
//                                   color: Color.fromARGB(255, 116, 216, 124)
//                                 )
//                               )
//                             )
//                           ),
//                         ),
//                         Container(
//                           height: 50,
//                           width: 250,
//                           margin: const EdgeInsets.fromLTRB(0, 10, 0, 15),
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: Color.fromARGB(255, 255, 255, 255),
//                               ),
//                               borderRadius: BorderRadius.circular(10)
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: (){},
//                           style: ElevatedButton.styleFrom(
//                             minimumSize: const Size(100, 50),
//                             backgroundColor: Color.fromARGB(100, 0, 0, 0),
//                             side: BorderSide(
//                               color: Color.fromARGB(255, 255, 255, 255),
//                               width: 2,
//                             ),
//                             elevation: 5,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15)
//                             )
//                           ).copyWith(
//                             // text colour change logic
//                             foregroundColor: WidgetStateProperty.resolveWith<Color>(
//                                     (states){
//                                   if (states.contains(WidgetState.pressed)){
//                                     return Colors.black;
//                                   }
//                                   return Colors.white;
//                                 }
//                             ),
//                             // button colour change logic
//                             overlayColor: WidgetStateProperty.resolveWith((status){
//                               if(status.contains(WidgetState.pressed)){
//                                 return Color.fromARGB(255, 255, 255, 255);
//                               }else{
//                                 return Colors.transparent;
//                               }
//                             })
//                           ),
//                           child:Text(
//                               "Login",
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontFamily: "elemental",
//                             ),
//                           )
//                         ),
//                       ]
//                     )
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Padding(
//                   padding: EdgeInsetsGeometry.only(bottom: 20.0),
//                   child: Text(
//                     "©SOLO-PRODUCTIONS",
//                     style: TextStyle(
//                         color: Color.fromARGB(255, 255, 255, 255)
//                     ),
//                   ),
//                 )
//               )
//             ],
//           ),
//         )
//       ),
//     );
//   }
// }
