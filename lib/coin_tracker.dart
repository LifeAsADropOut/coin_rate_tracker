import 'package:coin_rate_tracker/utils.dart';
import 'package:flutter/material.dart';

class CoinTracker extends StatefulWidget {
  CoinTracker({Key? key}) : super(key: key);

  @override
  _CoinTrackerState createState() => _CoinTrackerState();
}

class _CoinTrackerState extends State<CoinTracker> {
  String? _dropdownValue = "INR";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 18, 18, 0),
                  child: Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      child: Text(
                        "1 BTC = ? USD",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue.shade400,
              child: Center(
                child: DropdownButton(
                    value: _dropdownValue,
                    onChanged: (String? value) =>
                        setState(() => _dropdownValue = value),
                    iconSize: 30.0,
                    icon: const Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                    items: CURRENCY_LIST
                        .map((e) => DropdownMenuItem(child: Text(e), value: e))
                        .toList()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
