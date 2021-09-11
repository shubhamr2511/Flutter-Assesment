import 'package:flutter/material.dart';
import 'package:transition/transition.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'const.dart';

buildRoundTextButton({
  String text = "button",
  EdgeInsets margin = const EdgeInsets.all(4),
  EdgeInsets padding = const EdgeInsets.all(4),
  required VoidCallback onTap,
}) {
  return Padding(
      padding: margin,
      child: TextButton(
        onPressed: onTap,
        child: Padding(
          padding: padding,
          child: Text(text),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: Colors.blue)))),
      ));
}

stockScreenerButton(context) {
  return buildRoundTextButton(
    padding: EdgeInsets.all(8),
    text: "Stock Screener",
    onTap: () {
      Navigator.push(
          context,
          Transition(
            child: WebPage(
                url: constants.urlForStockScreener, title: "Stock Screener"),
            transitionEffect: TransitionEffect.LEFT_TO_RIGHT,
          ));
    },
  );
}

forexScreenerButton(context) {
  return buildRoundTextButton(
    padding: EdgeInsets.all(8),
    text: "Forex Screener",
    onTap: () {
      Navigator.push(
          context,
          Transition(
            arguments: Duration(seconds: 2),
            child: WebPage(
                url: constants.urlForForexScreener, title: "Forex Screener"),
            transitionEffect: TransitionEffect.LEFT_TO_RIGHT,
          ));
    },
  );
}

cryptoScreenerButton(context) {
  return buildRoundTextButton(
    padding: EdgeInsets.all(8),
    text: "Crypto Screener",
    onTap: () {
      Navigator.push(
          context,
          Transition(
            child: WebPage(
                url: constants.urlForCryptoScreener, title: "Crypto Screener"),
            transitionEffect: TransitionEffect.LEFT_TO_RIGHT,
          ));
    },
  );
}

cancelButton(VoidCallback onTap) {
  return IconButton(
    onPressed: onTap,
    icon: Icon(
      Icons.cancel,
    ),
    iconSize: 50,
    color: Colors.red,
  );
}

class WebPage extends StatelessWidget {
  final String url;
  final String title;
  WebPage({required this.url, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
          width: double.infinity,
          // height: 600,
          // the most important part of this example
          child: WebView(
            initialUrl: url,
            // Enable Javascript on WebView
            javascriptMode: JavascriptMode.unrestricted,
          )),
    );
  }
}

class WebViewContainer extends StatelessWidget {
  final String url;
  const WebViewContainer({required this.url, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        // height: 600,
        // the most important part of this example
        child: WebView(
          initialUrl: url,
          // Enable Javascript on WebView
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
