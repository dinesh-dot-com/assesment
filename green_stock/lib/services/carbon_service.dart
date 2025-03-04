import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/stock.dart';

class CarbonService {
  static const String baseUrl = 'https://api.example.com/carbon'; // Replace with actual API

  Future<void> fetchCarbonData(Stock stock) async {
    final response = await http.get(Uri.parse('$baseUrl/${stock.symbol}'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      stock.carbonFootprint = data['carbonFootprint'];
      stock.esgScore = data['esgScore'];
    } else {
      throw Exception('Failed to load carbon data');
    }
  }
}
