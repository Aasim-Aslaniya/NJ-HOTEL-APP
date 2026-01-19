import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:hotel_app/screens/dashboard.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF5D4037); // Dark Brown
    const Color backgroundColor = Color(0xFFFFF8E1); // Cream
    const Color cardColor = Colors.white;
    Widget loginContent = SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(24),
                color: cardColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: backgroundColor,
                      border: Border.all(color: primaryColor, width: 3),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          "NJ",
                          style: TextStyle(
                            color: backgroundColor,
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Admin Login",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter your Email Address";
                            }
                            if (!EmailValidator.validate(value.trim())) {
                              return "Please Enter a valid Email Address";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email, color: primaryColor),
                            labelText: "Email Address",
                            labelStyle: const TextStyle(color: primaryColor),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: primaryColor,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: primaryColor,
                                width: 2.5,
                              ),
                            ),
                            floatingLabelStyle: const TextStyle(color: primaryColor),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Your Password";
                            }
                            if (value.length < 6) {
                              return "Password must contain at least 6 characters";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock, color: primaryColor),
                            labelText: "Password",
                            labelStyle: const TextStyle(color: primaryColor),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: primaryColor,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: primaryColor,
                                width: 2.5,
                              ),
                            ),
                            floatingLabelStyle: const TextStyle(color: primaryColor),
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Login Successful")),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DashboardScreen(),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              padding: const EdgeInsets.all(14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            autofocus: false,
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                                indent: 10,
                                endIndent: 20,
                              ),
                            ),
                            Text("OR"),
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                                indent: 20,
                                endIndent: 10,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: primaryColor, width: 2),
                              padding: const EdgeInsets.all(14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Login with Google",
                                  style: TextStyle(color: primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if(kIsWeb){
      return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 480, ),
          child: loginContent,
          ),
        ),
      );
    }
    return loginContent;
  }
}
