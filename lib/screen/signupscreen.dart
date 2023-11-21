import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ytsapp/firebase/auth.dart';
import 'package:ytsapp/screen/navbar.dart';
import 'package:ytsapp/screen/signinscreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  TextEditingController usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/images/logo11.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 25),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              controller: usernameController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.grey),
                              decoration: InputDecoration(
                                label: Text("Username"),
                                labelStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                // You can add more sophisticated email validation if needed.

                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.grey),
                              decoration: InputDecoration(
                                label: Text("Email"),
                                labelStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                // You can add more sophisticated email validation if needed.
                                if (!RegExp(
                                        r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.grey),
                              obscureText: _obscureText1,
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                label: Text("Password"),
                                labelStyle: TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText1
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText1 = !_obscureText1;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                // You can add more sophisticated email validation if needed.

                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.grey),
                              obscureText: _obscureText2,
                              controller: confirmpasswordController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                label: Text("Confirm Password"),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                labelStyle: TextStyle(color: Colors.grey),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText2
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText2 = !_obscureText2;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password again';
                                }
                                if (confirmpasswordController.text !=
                                    passwordController.text) {
                                  return "Both passwords don't match";
                                }
                                // if (passwordController ==
                                //     confirmpasswordController) {
                                //   return "Both passwords match";
                                // }
                                // You can add more sophisticated email validation if needed.

                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 26.0),
                      Container(
                        height: 50,
                        width: 130,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              // Valid form, you can handle the email here.
                              print('Email: ${_emailController.text}');
                              _signup();
                            }
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignInScreen()));
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: 12),
                                  ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signup() async {
    String username = usernameController.text;
    String email = _emailController.text;
    String password = confirmpasswordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      print("LOGIN CREATED SUCCESSFULLY!");
      Fluttertoast.showToast(
        msg: "Sign Up Created",
        toastLength: Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
        gravity:
            ToastGravity.BOTTOM, // You can set the toast gravity (position)

        backgroundColor:
            Color.fromARGB(255, 252, 108, 108), // Background color of the toast
        textColor: Colors.white, // Text color of the toast
        fontSize: 16.0, // Font size
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Navbar()));
    } else {
      print("Error Occured");
    }
  }
}
