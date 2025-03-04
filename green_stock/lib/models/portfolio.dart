import 'stock.dart';

class Portfolio {
  final List<Stock> stocks;

  Portfolio({required this.stocks});

  double get totalValue => stocks.fold(0, (sum, stock) => sum + stock.price);

  double get totalCarbonFootprint =>
      stocks.fold(0, (sum, stock) => sum + stock.carbonFootprint);

  double get greenScore {
    // Calculate green score based on total carbon footprint
    return 100 - (totalCarbonFootprint / stocks.length);
  }
}
