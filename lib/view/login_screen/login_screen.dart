import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_aggregator_app/controller/login_screen_controller.dart';
import 'package:news_aggregator_app/view/registration_screen/registration_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    final providerObj = context.watch<LoginScreenController>();
    return Scaffold(
        backgroundColor: Colors.blue.withOpacity(0.5),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            height: 600,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue.shade100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login to news App",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "Get the latest news and information ...",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black.withOpacity(0.3)),
                ),
                SizedBox(height: 30),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Enter your Email",
                              prefixIcon: Icon(Icons.email),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.5),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(15)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.red.shade400,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 1)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          // Email validation
                          validator: (value) {
                            {
                              if (value == null || value.isEmpty) {
                                return 'Email cannot be empty';
                              }
                              final emailRegex =
                                  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                              if (!emailRegex.hasMatch(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: passController,
                          decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Enter your Password",
                              prefixIcon: Icon(Icons.password),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.5),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(15)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 1)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.red.shade400,
                                  )),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          // Password validation
                          validator: (value) {
                            if (value != null &&
                                value.isNotEmpty &&
                                value.length >= 6) {
                              return null;
                            } else {
                              return 'enter a valid password';
                            }
                          },
                        ),
                      ],
                    )),
                SizedBox(height: 15),
                // Login button
                providerObj.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginScreenController>().onLogin(
                                email: emailController.text,
                                password: passController.text,
                                context: context);
                          }
                        },
                        child: Center(
                          child: Container(
                            height: 50,
                            width: 350,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black.withOpacity(0.5),
                        thickness: 1,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "OR Authorised with",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black.withOpacity(0.5),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Icon(Icons.apple),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          FontAwesomeIcons.google,
                          size: 18,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  "  Forgot Password ?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account?",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 15),
                    ),
                    SizedBox(width: 6),
                    // Navigate to register screen if not registered
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationScreen()));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
