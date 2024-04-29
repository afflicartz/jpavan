import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your Mobile No:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20,),
            _MobileNumberInputField(),
            SizedBox(height: 20,),
            _OTPInputField(),
            SizedBox(height: 20,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _SendOTPButton(),
                  // SizedBox(height: 20,),
                  _SubmitButton(),
                ]
            )
          ],
        ),
      ),
    );
  }
}

class _MobileNumberInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
        hintText: "Mobile No",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none),
        fillColor: Colors.green.withOpacity(0.1),
        filled: true,
        prefixIcon: const Icon(Icons.mobile_friendly),
      ),
      obscureText: true,
    );
  }
}

class _OTPInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
        hintText: "OTP",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none),
        fillColor: Colors.green.withOpacity(0.1),
        filled: true,
        prefixIcon: const Icon(Icons.password),
      ),
      obscureText: true,
    );
  }
}

class _SendOTPButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      child: const Text(
        "send OTP",
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      child: const Text(
        "Login",
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}