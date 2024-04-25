// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:project/LoginPage.dart';
// import 'package:project/VerifyMobile.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
//
//
// class SignupPage extends StatefulWidget {
//   const SignupPage({Key? key, required String title});
//
//   @override
//   _SignupPageState createState() => _SignupPageState();
// }
//
// class _SignupPageState extends State<SignupPage> {
//   bool isPasswordVisible = false;
//   bool isConfirmPasswordVisible = false;
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   bool passwordsMatch = true; // Initially assume they match
//
//   void checkPasswordMatch() {
//     if (passwordController.text != confirmPasswordController.text) {
//       setState(() {
//         passwordsMatch = false;
//       });
//     } else {
//       setState(() {
//         passwordsMatch = true;
//       });
//     }
//   }
//
//   void handleSignUp() async {
//     try {
//       if (!passwordsMatch) {
//         showToast('Passwords do not match');
//         return;
//       }
//
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text);
//
//       DatabaseReference database = FirebaseDatabase.instance.ref();
//       await database.child('users').child(userCredential.user!.uid).set({
//         'username': usernameController.text.trim(),
//         'email': emailController.text.trim(),
//       });
//
//       showToast('Signup Successful');
//
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => VerifyMobile(),
//         ),
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         showToast('The password provided is too weak');
//       } else if (e.code == 'email-already-in-use') {
//         showToast('The account already exists for that email');
//       }
//     } catch (e) {
//       showToast('Signup failed');
//     }
//   }
//
//   void showToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//     );
//   }
//
//   @override
//   void dispose() {
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 const SizedBox(height: 60.0),
//                 Container(
//                   height: 150,
//                   width: 150,
//                   child: Image.asset('assets/images/Logo.png'),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "Create your account",
//                   style: TextStyle(fontSize: 15, color: Colors.grey[700]),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: usernameController,
//                   decoration: InputDecoration(
//                     hintText: "Username",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(18),
//                       borderSide: BorderSide.none,
//                     ),
//                     fillColor: Colors.green.withOpacity(0.1),
//                     filled: true,
//                     prefixIcon: const Icon(Icons.person),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     hintText: "E-Mail",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(18),
//                       borderSide: BorderSide.none,
//                     ),
//                     fillColor: Colors.green.withOpacity(0.1),
//                     filled: true,
//                     prefixIcon: const Icon(Icons.email),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                     hintText: "Password",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(18),
//                       borderSide: BorderSide.none,
//                     ),
//                     fillColor: Colors.green.withOpacity(0.1),
//                     filled: true,
//                     prefixIcon: const Icon(Icons.lock),
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           isPasswordVisible = !isPasswordVisible;
//                         });
//                       },
//                       icon: Icon(
//                         isPasswordVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       color: Colors.black,
//                     ),
//                   ),
//                   obscureText: !isPasswordVisible,
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: confirmPasswordController,
//                   onChanged: (value) {
//                     checkPasswordMatch();
//                   },
//                   decoration: InputDecoration(
//                     hintText: "Confirm Password",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(18),
//                       borderSide: BorderSide.none,
//                     ),
//                     fillColor: Colors.green.withOpacity(0.1),
//                     filled: true,
//                     prefixIcon: const Icon(Icons.lock),
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           isConfirmPasswordVisible = !isConfirmPasswordVisible;
//                         });
//                       },
//                       icon: Icon(
//                         isConfirmPasswordVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       color: Colors.black,
//                     ),
//                     errorText:
//                     !passwordsMatch ? "Passwords don't match" : null,
//                   ),
//                   obscureText: !isConfirmPasswordVisible,
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: handleSignUp,
//                   style: ElevatedButton.styleFrom(
//                     shape: const StadiumBorder(),
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     backgroundColor: Colors.green,
//                   ),
//                   child: const Text(
//                     "Sign up",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 RichText(
//                   text: TextSpan(
//                     text: 'Continue With ',
//                     style: TextStyle(color: Colors.black),
//                     children: <TextSpan>[
//                       TextSpan(
//                         text: 'Google',
//                         style: TextStyle(color: Colors.green),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 RichText(
//                   text: TextSpan(
//                     text: 'Continue With ',
//                     style: TextStyle(color: Colors.black),
//                     children: <TextSpan>[
//                       TextSpan(
//                         text: 'SMS',
//                         style: TextStyle(color: Colors.green),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     const Text("Already have an account?"),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => LoginPage()),
//                         );
//                       },
//                       child: const Text(
//                         "Login",
//                         style: TextStyle(
//                             color: Color.fromARGB(255, 236, 143, 2)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 80),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'VerifyMobile.dart';
import 'DashboardPage.dart';
import 'LoginPage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key, required String title});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool passwordsMatch = true; // Initially assume they match

  void checkPasswordMatch() {
    if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        passwordsMatch = false;
      });
    } else {
      setState(() {
        passwordsMatch = true;
      });
    }
  }

  void handleSignUp() async {
    try {
      if (!passwordsMatch) {
        showToast('Passwords do not match');
        return;
      }

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text);

      String userId = userCredential.user!.uid; // Get the user ID

      // Store user data in Firebase Realtime Database
      DatabaseReference database = FirebaseDatabase.instance.ref();
      await database.child('users').child(userId).set({
        'username': usernameController.text.trim(),
        'email': emailController.text.trim(),
      });

      showToast('Signup Successful');

      // Pass the userId to the VerifyMobile page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => VerifyMobile(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email');
      }
    } catch (e) {
      showToast('Signup failed');
    }
  }


  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  Future<void> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

        // Create a new credentials
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in the user with the credentials
        final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

        if (userCredential.user != null) {
          // Store user data in Firebase Realtime Database
          DatabaseReference database = FirebaseDatabase.instance.ref();
          await database
              .child('users')
              .child(userCredential.user!.uid)
              .set({
            'username': userCredential.user!.displayName ?? 'No Username',
            'email': userCredential.user!.email ?? 'No Email',
            // Add more user data fields as needed
          });

          showToast('Signup Successful');

          // Navigate to dashboard page after signup
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardPage()),
          );
        } else {
          showToast('Google Sign-in failed');
        }
      } else {
        showToast('Google Sign-in canceled');
      }
    } catch (e) {
      showToast('Google Sign-in failed');
    }
  }



  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 60.0),
                Container(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/images/Logo.png'),
                ),
                const SizedBox(height: 20),
                Text(
                  "Create your account",
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.green.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "E-Mail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.green.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.green.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      color: Colors.black,
                    ),
                  ),
                  obscureText: !isPasswordVisible,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: confirmPasswordController,
                  onChanged: (value) {
                    checkPasswordMatch();
                  },
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.green.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      color: Colors.black,
                    ),
                    errorText:
                    !passwordsMatch ? "Passwords don't match" : null,
                  ),
                  obscureText: !isConfirmPasswordVisible,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: handleSignUp,
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: signInWithGoogle,
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: Colors.red, // Change color if needed
                  ),
                  child: const Text(
                    "Continue with Google",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: 'Continue With ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'SMS',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Color.fromARGB(255, 236, 143, 2)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
