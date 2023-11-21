import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ytsapp/screen/signupscreen.dart';
import 'package:ytsapp/screen/splashscreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var usernameV = "Akuma";
  var emailV = "akuma11@gmail.com";
  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text(
          "Profile Setting",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  usernameV,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  emailV,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          size: 30,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade800,
          ),
          Container(
            height: 60,
            margin: EdgeInsets.only(left: 20),
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton.icon(
                    onPressed: () {
                      print(usernameV);
                    },
                    icon: Icon(
                      Icons.favorite_outline_outlined,
                      color: Colors.red,
                    ),
                    label: Text(
                      "Favorites",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                    )),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade800,
          ),
          Container(
            height: 60,
            margin: EdgeInsets.only(left: 20),
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.copyright_rounded,
                      color: Colors.red,
                    ),
                    label: Text(
                      "Privacy Policy",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                    )),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade800,
          ),
          Container(
            height: 60,
            margin: EdgeInsets.only(left: 20),
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.description_outlined,
                      color: Colors.red,
                    ),
                    label: Text(
                      "Terms & Condition",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                    )),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade800,
          ),
          Container(
            height: 60,
            margin: EdgeInsets.only(left: 20),
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton.icon(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.signOut();
                        print("logged out");

                        // If the log out is successful, show a toast message
                        Fluttertoast.showToast(
                          msg: "Logged out",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                        );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SplashScreen()));
                      } catch (e) {
                        // Handle logout errors
                        print("Logout failed: $e");
                        Fluttertoast.showToast(
                          msg: "${e}",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    label: Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                    )),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade800,
          ),
        ],
      ),
    );
  }

  void getValue() async {
    var sharedpref = await SharedPreferences.getInstance();
    var fmV = sharedpref.getString(SignUpScreenState.USERNAMEKEY.toString());
    var emV = sharedpref.getString(SignUpScreenState.EMAILKEY.toString());
    usernameV = fmV ?? "john";
    emailV = emV ?? "235@email.com";
    setState(() {});
  }
}
