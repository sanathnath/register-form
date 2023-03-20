import 'package:flutter/material.dart';
import 'package:flutter_recaptcha_v3/flutter_recaptcha_v2.dart';

import 'captcha.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  String verifyResult = "";
  RecaptchaV2Controller recaptchaV2Controller = RecaptchaV2Controller();

  @override
  initState() {}
  @override
  Widget build(BuildContext context) {
    recaptchaV2Controller.show();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return Captcha((String code) =>
                                print("Code returned: " + code));
                          }),
                        );
                      },
                      child: Text("captcha")),
                  TextField(),
                  TextField(),
                  // RecaptchaV2(
                  //   apiKey: "6LeCwZYUAAAAAJo8IVvGX9dH65Rw89vxaxErCeou",
                  //   apiSecret: "6LeCwZYUAAAAAKGahIjwfOARevvRETgvwhPMKCs_",
                  //   controller: recaptchaV2Controller,
                  //   onVerifiedError: (err) {
                  //     print(err);
                  //   },
                  //   onVerifiedSuccessfully: (success) {
                  //     setState(() {
                  //       if (success) {
                  //         verifyResult = "You've been verified successfully.";
                  //       } else {
                  //         verifyResult = "Failed to verify.";
                  //       }
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
