import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/stock.dart';

class StockService {
  static const String apiKey = 'O8ZNXGR4XQ64KPJB';
  static const String baseUrl = 'https://www.alphavantage.co/query';

  Future<Stock> fetchStockData(String symbol) async {
    final response = await http.get(Uri.parse('$baseUrl?function=GLOBAL_QUOTE&symbol=$symbol&apikey=$apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final quote = data['Global Quote'];

      return Stock(
        symbol: symbol,
        name: quote['01. symbol'],
        price: double.parse(quote['05. price']),
        carbonFootprint: 0.0, // Placeholder
        esgScore: 0.0, // Placeholder
      );
    } else {
      throw Exception('Failed to load stock data');
    }
  }
}
