import 'package:flutter/material.dart';
import 'package:flutter_recaptcha_v3/flutter_recaptcha_v2.dart';

import 'captcha.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Google ReCaptcha Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String verifyResult = "";

  RecaptchaV2Controller recaptchaV2Controller = RecaptchaV2Controller();
  @override
  @override
  Widget build(BuildContext context) {
    recaptchaV2Controller.show();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "enter",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "enter",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "enter",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "enter",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "enter",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              // const SizedBox(
              //   height: 120,
              // ),
              SizedBox(
                height: 520,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Positioned(
                      top: 120,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("button"),
                      ),
                    ),
                    Positioned(
                      top: 2,
                      child: Captcha(
                        (String code) => print("Code returned: " + code),
                      ),
                    ),
                    // Container(
                    //   height: 300,
                    //   color: Colors.blue,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

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
