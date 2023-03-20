import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Captcha extends StatefulWidget {
  Function callback;
  Captcha(this.callback);

  @override
  State<StatefulWidget> createState() {
    return CaptchaState();
  }
}

class CaptchaState extends State<Captcha> {
  late WebViewController webViewController;
  bool isVerifying = false;

  String token = "";

  @override
  initState() {
    super.initState();
  }

  void readJS() async {
    String html = await webViewController.evaluateJavascript(
        "window.document.getElementsByTagName('body')[1].innerHTML;");
    print("html: $html");
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   if (token == "") {
    //     isVerifying = true;
    //   } else {
    //     isVerifying = false;
    //   }
    // });

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print("ontap");
        setState(() {
          isVerifying = !isVerifying;
        });
      },
      onHorizontalDragUpdate: (updateDetails) {},
      child: Container(
        width: 330,
        // height: !isVerifying ? 100 : 500,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: !isVerifying ? 85 : 490,
              child: WebView(
                backgroundColor: Colors.white,
                initialUrl: "https://sample-captcha.netlify.app/",
                javascriptMode: JavascriptMode.unrestricted,
                javascriptChannels: Set.from(
                  [
                    JavascriptChannel(
                      name: 'Captcha',
                      onMessageReceived: (JavascriptMessage message) {
                        widget.callback(message.message);
                        setState(() {
                          isVerifying = false;
                        });
                        print("message: ${message.message}");
                        token = message.message;
                        print("inside");
                      },
                    ),
                  ],
                ),
                onWebViewCreated: (WebViewController w) {
                  webViewController = w;
                  w.evaluateJavascript("document.getElementById");
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                print("tap");
                setState(() {
                  isVerifying = !isVerifying;
                });
              },
              child: Container(
                width: double.infinity,
                height: 22,
                child: Center(
                  child: !isVerifying
                      ? Icon(Icons.arrow_drop_down)
                      : Icon(Icons.arrow_drop_up),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
