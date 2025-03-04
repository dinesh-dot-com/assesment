import 'package:flutter/material.dart';
import '../models/portfolio.dart';
import '../models/stock.dart';
import '../widgets/stock_card.dart';
import '../widgets/green_score_indicator.dart';

class PortfolioScreen extends StatelessWidget {
  final Portfolio portfolio = Portfolio(stocks: [
    Stock(symbol: 'AAPL', name: 'Apple Inc.', price: 150.0, carbonFootprint: 10.0, esgScore: 85.0),
    Stock(symbol: 'TSLA', name: 'Tesla Inc.', price: 700.0, carbonFootprint: 5.0, esgScore: 90.0),
  ]);

  final VoidCallback toggleTheme;

  PortfolioScreen({required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portfolio'),
        centerTitle: true,
        actions: [
          Switch(
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (value) {
              toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Total Portfolio Value',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      '\$${portfolio.totalValue.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Total CO₂ Impact',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      '${portfolio.totalCarbonFootprint.toStringAsFixed(2)} tons',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            GreenScoreIndicator(greenScore: portfolio.greenScore),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: portfolio.stocks.length,
                itemBuilder: (context, index) {
                  final stock = portfolio.stocks[index];
                  return StockCard(stock: stock);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
