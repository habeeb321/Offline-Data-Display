import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:offline_data_display/model/crypto_model.dart';

class ApiService {
  static Future<List<CryptoModel>?> getCrypto() async {
    try {
      Uri url = Uri.parse(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false');
      Response response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        List result = jsonDecode(response.body);
        return result.map((e) => CryptoModel.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
