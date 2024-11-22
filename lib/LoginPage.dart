import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'OtpVerificationScreen.dart';
import 'SignUpScreen.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            getLuxeLoftLogo(),

            getWelcomeText(),

            getLogInToContinueText(),

            getTextFormField(),

            getOtpButton(context),

            Text(
              "Or Continue With",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),

            getGoogleOrFaceBookLogin(),

            getSignInText(context),

          ],
        ),
      ),
    );
  }

  Widget getSignInText(context){
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "don't have an account? ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: "Sign In",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Sign In text pe click hone par Navigate karna
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
          ),
        ],
      ),
    );
  }
  Widget getLuxeLoftLogo(){
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/splash_sc01.png',
            //height: 100,
            //fit: BoxFit.contain,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              // Handle close button logic
            },
          ),
        ),
      ],
    );
  }

  Widget getWelcomeText(){
    return const Text(
      "Welcome Back!",
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget getLogInToContinueText(){
    return  const Text(
      "Login to continue",
      style: TextStyle(
          fontSize: 18,
          color: Colors.black
      ),
    );
  }

  Widget getTextFormField(){
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextField(
        controller: phoneController,
        decoration: InputDecoration(
          hintText: 'Phone Number',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/Login_Screen/phone_ic.jpg', // Replace with your phone icon path
              width: 20,
              height: 20,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),

          ),
        ),
        keyboardType: TextInputType.phone,
      ),
    );
  }

  Widget getOtpButton(context){
    return
    InkWell(
      onTap: () {
        // Navigate to the OTP Verification Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OtpVerificationScreen(verificationId: '',)),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Colors.blueAccent,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
            child: Text(
              "Get OTP",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getGoogleOrFaceBookLogin(){
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120, // Set a fixed width for the container
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/Login_Screen/google.png",
                  ),
                  const Text(
                    "Google",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 15), // Space between the two containers
          SizedBox(
            width: 120, // Set a fixed width for the container
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/Login_Screen/facebook.png",
                  ),
                  const Text(
                    "FaceBook",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
Container(
  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/Login_Screen/google.png",
                height: 40,
                width: 40,
              ),
              const SizedBox(height: 10),
              const Text(
                "Google",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/Login_Screen/facebook.png",
                height: 40,
                width: 40,
              ),
              const SizedBox(height: 10),
              const Text(
                "FaceBook",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);
*/