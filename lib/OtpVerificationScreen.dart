import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String verificationId;

  OtpVerificationScreen({required this.verificationId});

  // Separate controllers for each OTP field
  final List<TextEditingController> otpControllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getEnterOtpText(),
            Text(
              "Enter the OTP sent to your mobile",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => _buildOtpTextField(index, context)),
            ),
            SizedBox(height: 30),
            getOtpButton(context),
          ],
        ),
      ),
    );
  }

  Widget getEnterOtpText() {
    return Text(
      "OTP Verification",
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildOtpTextField(int index, BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: otpControllers[index],
        focusNode: focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "", // Removes the character counter
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).requestFocus(focusNodes[index + 1]);
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(focusNodes[index - 1]);
          }
        },
      ),
    );
  }

  Widget getOtpButton(context) {
    return InkWell(
      onTap: () {
        // Collect OTP from all fields
        String otp = otpControllers.map((controller) => controller.text).join();
        print("Entered OTP: $otp");

        // Perform OTP verification here
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
              "VERIFY",
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
}
