import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/colors.dart';
import 'package:food_delivery/home_screen.dart';

import 'constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _email, _pwd;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(height);
    print(width);
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        bgImage,
                        height: height * 0.40,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: height * 0.42,
                        width: width,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          stops: [0.3, 0.7],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.white],
                        )),
                        //color: Colors.orange.withOpacity(0.3),
                      ),
                      Positioned(
                        bottom: 45,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            const Text(
                              appName,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w700),
                            ),
                            Center(
                              child: Text(
                                slogan,
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              primaryColor.withOpacity(0.3),
                              Colors.transparent
                            ],
                          ),
                          border: const Border(
                              left: BorderSide(color: primaryColor, width: 5))),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          loginString,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: TextFormField(
                      controller: emailController,
                      onSaved: (newValue) {
                        _email = newValue;
                      },
                      validator: (email) {
                        if (email!.isEmpty) {
                          return "Please Enter Email";
                        } else if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                            .hasMatch(email)) {
                          return 'Please enter a valid Email address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: primaryColor,
                          ),
                          label: Text(
                            "EMAIL ADDRESS",
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: TextFormField(
                      controller: passwordController,
                      onSaved: (newValue) {
                        _pwd = newValue;
                      },
                      validator: (pwd) {
                        if (pwd!.isEmpty) {
                          return "please Entry the password";
                        } else if (pwd.length < 8 || pwd.length > 15) {
                          return "Password length is must be 8 characters";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor)),
                          prefixIcon: Icon(
                            Icons.lock_open,
                            color: primaryColor,
                          ),
                          label: Text(
                            "PASSWORD",
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          )),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: const Text(forgetText))),
                  Center(
                    child: SizedBox(
                      height: height * 0.07,
                      width: width - 30,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            FocusScope.of(context).unfocus();
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ));
                            print(_email);
                            print(_pwd);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          loginAccount,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account ?"),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Create Account",
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          ))
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
