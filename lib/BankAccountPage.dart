import 'package:project/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:project/UpiPage.dart';

class BankAccountPage extends StatelessWidget {
  const BankAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const SizedBox(height: 60.0),

                    Container(
                      height: 150,
                      width: 150,
                      child: Image.asset('assets/images/Logo.png'),
                      
                    ),
                    
                    Text(
                      "Enter Your Account Details",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Enter your Account Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.green.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.account_balance), // Change the icon to represent account balance
                        ),
                      ),


                    const SizedBox(height: 20),

                    TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Your IFS Code",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.green.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.account_balance), // Change the icon to represent account balance
                        ),
                      ),

                    const SizedBox(height: 20),

                    TextField(
                          decoration: InputDecoration(
                            hintText: "Enter College Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.green.withOpacity(0.1),
                            filled: true,
                            prefixIcon: const Icon(Icons.school), // Use the college icon here
                          ),
                    ),
                    
                    
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Continue",
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
                    )),
                const SizedBox(height: 10),
                // Container(
                //     padding: const EdgeInsets.only(top: 3, left: 3),

                //     child: ElevatedButton(
                //       onPressed: () {
                //       },
                //       style: ElevatedButton.styleFrom(
                //         shape: const StadiumBorder(),
                //         padding: const EdgeInsets.symmetric(vertical: 1),
                //         backgroundColor: Colors.green,
                //       ),
                //       child: const Text(
                //         "Continue With Google",
                //         style: TextStyle(
                //           fontSize: 18,
                //           color: Colors.white,
                //         ),
                //       ),
                //     )
                // ),
                  ],
                ),
                

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Continue with"),
                    TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UpiPage()),
                            );
                          },
                        child: const Text("UPI ID", style: TextStyle(color: Color.fromARGB(255, 236, 143, 2)  )
                        )
                    )
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                        child: const Text("Skip now", style: TextStyle(color: Color.fromARGB(255, 141, 141, 141)  )
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
