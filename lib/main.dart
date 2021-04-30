import 'package:coin_rate_tracker/coin_tracker.dart';
import 'package:flutter/material.dart';

void main() => runApp(CoinTrackerApp());

class CoinTrackerApp extends StatelessWidget {
  const CoinTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue.shade400,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.money),
          titleSpacing: -10.0,
          title: Text("Coin Tracker"),
        ),
        body: CoinTracker(),
      ),
    );
  }
}
