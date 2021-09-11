import 'package:flutter/material.dart';
import 'package:paper_clip_1/screenersTabs.dart';
import 'package:transition/transition.dart';
import 'myWidgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Demo Screeners'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({required this.title, Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isHome = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(shadowColor: Colors.blue, title: Text("Screeners Demo")),
      body: Center(
        child: AnimatedSwitcher(
          child: isHome
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [screenersTabsButton(), screenersButton()])
              : selectorWidget(),
          duration: Duration(milliseconds: 400),
          transitionBuilder: (child, animation) => ScaleTransition(
            child: child,
            scale: animation,
          ),
        ),
      ),
    );
  }

  screenersTabsButton() {
    return buildRoundTextButton(
      padding: EdgeInsets.all(8),
      text: "Screeners Tabs",
      onTap: () {
        Navigator.push(
            context,
            Transition(
                child: Screeners(),
                transitionEffect: TransitionEffect.BOTTOM_TO_TOP));
      },
    );
  }

  screenersButton() {
    return buildRoundTextButton(
      padding: EdgeInsets.all(8),
      text: "Screeners",
      onTap: () {
        setState(() {
          isHome = false;
        });
      },
    );
  }

  selectorWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cancelButton(() {
          setState(() {
            isHome = true;
          });
        }),
        stockScreenerButton(context),
        forexScreenerButton(context),
        cryptoScreenerButton(context)
      ],
    );
  }
}
