import 'dart:convert';
import 'package:coin_rate_tracker/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoinTracker extends StatefulWidget {
  CoinTracker({Key? key}) : super(key: key);

  @override
  _CoinTrackerState createState() => _CoinTrackerState();
}

class _CoinTrackerState extends State<CoinTracker> {
  String? _dropdownValue = "USD";
  String? currency = "USD";
  int? BTC_rate;
  int? LTC_rate;
  int? ETH_rate;

  Future getExchangeRate(String e) async {
    http.Response _res = await http.get(getURI(e, _dropdownValue!), headers: {
      "X-CoinAPI-Key": API_KEY,
    });

    if (_res.statusCode == 200) {
      var _data = jsonDecode(_res.body);
      print(_data);
      return _data['rate'];
    } else
      print("something went wrong...");
  }

  Future testingFutureWait(String e) async {
    var _data = await Future.wait(
      [
        getExchangeRate("BTC"),
        getExchangeRate("LTC"),
        getExchangeRate("ETH"),
      ],
    );
    // setState(() {
    //   currency = e;
    //   BTC_rate = _data[0]!.round();
    //   LTC_rate = _data[1]!.round();
    //   ETH_rate = _data[2]!.round();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                getCoinCard(currency!, BTC_rate, "BTC"),
                getCoinCard(currency!, LTC_rate, "LTC"),
                getCoinCard(currency!, ETH_rate, "ETH"),
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
                        .map(
                          (e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                              onTap: () => testingFutureWait(e)),
                        )
                        .toList()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getCoinCard(String currency, int? rate, String coin) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 18, 18, 0),
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: Text(
            "1 $coin = ${rate == null ? "?" : rate} $currency",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        color: Colors.lightBlueAccent,
      ),
    );
  }
}
