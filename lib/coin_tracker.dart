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
              children: [],
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
                    items: <String>["INR", "USD", "JPY", "CAD", "CNY"]
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
