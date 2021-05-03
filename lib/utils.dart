const String API_KEY = "EF55E320-AD93-44DD-9F94-6A1B8BB84645";

Uri getURI() => Uri.parse(
      "https://rest.coinapi.io/v1/exchangerate/BTC/USD",
    );

// header "X-CoinAPI-Key", "73034021-THIS-IS-SAMPLE-KEY":

const List<String> CURRENCY_LIST = <String>["INR", "USD", "JPY", "CAD", "CNY"];
