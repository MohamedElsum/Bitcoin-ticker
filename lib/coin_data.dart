import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];
const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '340D11D8-D6AD-4BE0-9DF0-D5EC8E6E6330';

class CoinData{

  Future getCoinData(String selectedCurrency) async{

    Map<String,String> cryptoPrices = {};
    for(String crypto in cryptoList){
      String requestUrl = 'https://rest.coinapi.io/v1/exchangerate/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(Uri.parse(requestUrl));
      if(response.statusCode == 200){
        var decodedData = jsonDecode(response.body);
        var lastPrice = decodedData['rate'];
        cryptoPrices[crypto]=lastPrice.toStringAsFixed(0);
      }else{
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}