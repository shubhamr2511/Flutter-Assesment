import 'package:flutter/material.dart';

import 'const.dart';
import 'myWidgets.dart';

class Screeners extends StatefulWidget {
  final List<Widget> tabs = [
    WebViewContainer(url: constants.urlForStockScreener),
    WebViewContainer(url: constants.urlForForexScreener),
    WebViewContainer(url: constants.urlForCryptoScreener),
  ];

  @override
  _ScreenersState createState() => _ScreenersState();
}

class _ScreenersState extends State<Screeners> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screeners"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: "Stock", icon: Icon(Icons.analytics_outlined)),
          BottomNavigationBarItem(
              label: "Forex", icon: Icon(Icons.attach_money)),
          BottomNavigationBarItem(
              label: "Crypto", icon: Icon(Icons.album_outlined))
        ],
        currentIndex: _currentTab,
        onTap: (int i) {
          setState(() {
            _currentTab = i;
            print(_currentTab);
          });
        },
      ),
      body:IndexedStack(
                  children: widget.tabs,
                  index: _currentTab,
                ),
    );
  }
}
