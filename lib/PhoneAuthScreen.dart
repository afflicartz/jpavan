import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:project/DashboardPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String _verificationId = '';

  Future<void> _verifyPhoneNumber() async {
    try {
      // Proceed with phone number verification
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+${_phoneNumberController.text}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          // Navigate to dashboard or home screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardPage()),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          // Handle verification failed
          print('Verification Failed: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationId = verificationId;
          });
        },
        timeout: Duration(seconds: 60),
      );
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }



  Future<void> _signInWithPhoneNumber() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _otpController.text,
      );
      UserCredential authResult =
      await FirebaseAuth.instance.signInWithCredential(credential);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('successfully signed in'),
        ),
      );
      // Navigate to dashboard or home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );

      // Store user data in Firebase Realtime Database
      if (authResult.user != null) {
        DatabaseReference userRef = FirebaseDatabase.instance
            .reference()
            .child('users')
            .child(authResult.user!.uid);
        userRef.set({
          'phone_number': _phoneNumberController.text,
          // Add other user data fields as needed
        });
      }
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Authentication'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Enter Phone Number',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _verifyPhoneNumber,
              child: Text('Send Verification Code'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter OTP',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _signInWithPhoneNumber,
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
