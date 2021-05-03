const String API_KEY = "EF55E320-AD93-44DD-9F94-6A1B8BB84645";

Uri getURI(String coin, String param) => Uri.parse(
      "https://rest.coinapi.io/v1/exchangerate/$coin/$param",
    );

// header "X-CoinAPI-Key":"73034021-THIS-IS-SAMPLE-KEY"

const List<String> CURRENCY_LIST = <String>["INR", "USD", "JPY", "CAD", "CNY"];
const List<String> COIN_LIST = [
  "BTC",
  "LTC",
  "ETH",
];
