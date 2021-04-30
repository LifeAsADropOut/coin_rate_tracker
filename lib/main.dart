import 'package:coin_rate_tracker/coin_tracker.dart';
import 'package:flutter/material.dart';

void main() => runApp(CoinTrackerApp());

class CoinTrackerApp extends StatelessWidget {
  const CoinTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(),
        body: CoinTracker(),
      ),
    );
  }
}
