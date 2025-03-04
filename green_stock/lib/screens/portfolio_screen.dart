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
        title: Text('Portfolio', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Theme.of(context).brightness == Brightness.dark ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: () {
              toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Total Portfolio Value Card
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Portfolio Value',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$${portfolio.totalValue.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Total CO₂ Impact Card
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total CO₂ Impact',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${portfolio.totalCarbonFootprint.toStringAsFixed(2)} tons',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Green Score Indicator
            GreenScoreIndicator(greenScore: portfolio.greenScore),
            SizedBox(height: 20),
            // Stock List
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: portfolio.stocks.length,
              itemBuilder: (context, index) {
                final stock = portfolio.stocks[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: StockCard(stock: stock),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
