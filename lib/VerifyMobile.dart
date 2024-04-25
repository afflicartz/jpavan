import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:project/DashboardPage.dart';

class VerifyMobile extends StatelessWidget {
  final TextEditingController _mobileController = TextEditingController();
  String? selectedState;
  String? selectedCollege;

  Future<void> _submitForm(BuildContext context) async {
    final mobile = _mobileController.text;
    final state = selectedState;
    final college = selectedCollege;

    if (mobile.isNotEmpty && state != null && college != null) {
      try {
        // Store user data in Firebase Realtime Database
        await FirebaseDatabase.instance.reference().child('users').push().set({
          'mobile': mobile,
          'state': state,
          'college': college,
        });

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data stored successfully!'),
          ),
        );
      } catch (e) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to store data: $e'),
          ),
        );
      }
    } else {
      // Show error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all the fields'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> colleges = [
      "RGUKT BASAR",
      "RGUKT NUZVID",
      "RGUKT ONGOLE",
      "RGUKT RK VALLEY",
    ];

    List<String> states = [
      "Telangana",
      "Andhra Pradesh",
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(height: 9.0),
                    Container(
                      height: 150,
                      width: 150,
                      child: Image.asset('assets/images/Logo.png'),
                    ),
                    TextField(
                      controller: _mobileController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Mobile No",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.green.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.mobile_friendly),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: selectedState,
                      onChanged: (value) {
                        selectedState = value;
                      },
                      items: states.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        hintText: "Select State",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.green.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.location_on),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: selectedCollege,
                      onChanged: (value) {
                        selectedCollege = value;
                      },
                      items: colleges.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        hintText: "Select College",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.green.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.school),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  child: ElevatedButton(
                    onPressed: () => _submitForm(context),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
