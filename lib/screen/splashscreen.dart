import 'package:flutter/material.dart';
import 'package:ytsapp/screen/signinscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    // Simulate some initialization process before navigating to the main screen.
    // For example, you can load data, perform authentication, etc.
    _navigateToMainScreen();
  }

  // Simulate a delay and then navigate to the main screen.
  _navigateToMainScreen() async {
    await Future.delayed(
        Duration(seconds: 3)); // Change the duration as needed.
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignInScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(
            child: Center(
              child: Column(children: [
                Image.asset("assets/images/logo1.png"),
                SizedBox(height: 20),
                CircularProgressIndicator(),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
