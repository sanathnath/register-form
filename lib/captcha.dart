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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      color: Colors.white,
      child: Container(
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
              JavascriptChannel(
                  name: "check",
                  onMessageReceived: (JavascriptMessage response) {
                    if (response.message == 'visible') {
                      print("visible");
                      setState(() {
                        isVerifying = true;
                      });
                    } else if (response.message == 'hidden') {
                      print("hidden");
                      setState(() {
                        isVerifying = false;
                      });
                    }
                    print(response.message);
                  })
            ],
          ),
          onWebViewCreated: (WebViewController w) async {
            webViewController = w;
          },
        ),
      ),
    );
  }
}
