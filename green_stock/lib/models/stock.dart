class Stock {
  final String symbol;
  final String name;
  final double price;
  double carbonFootprint; // Not final
  double esgScore; // Not final

  Stock({
    required this.symbol,
    required this.name,
    required this.price,
    required this.carbonFootprint,
    required this.esgScore,
  });
}
