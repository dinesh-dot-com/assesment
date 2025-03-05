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
        title: Text(
          'Portfolio', 
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            letterSpacing: 1.2
          )
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark 
                ? Icons.wb_sunny 
                : Icons.nightlight_round,
              color: Theme.of(context).brightness == Brightness.dark 
                ? Colors.yellow 
                : Colors.black87,
            ),
            onPressed: () {
              toggleTheme();
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).brightness == Brightness.dark 
                ? Colors.blueGrey[900]! 
                : Colors.green[50]!,
              Theme.of(context).brightness == Brightness.dark 
                ? Colors.black 
                : Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Portfolio Value Card
              _buildPortfolioCard(
                context,
                title: 'Total Portfolio Value',
                value: '\$${portfolio.totalValue.toStringAsFixed(2)}',
                icon: Icons.monetization_on_outlined,
              ),
              SizedBox(height: 20),
              // CO₂ Impact Card
              _buildPortfolioCard(
                context,
                title: 'Total CO₂ Impact',
                value: '${portfolio.totalCarbonFootprint.toStringAsFixed(2)} tons',
                icon: Icons.eco_outlined,
              ),
              SizedBox(height: 20),
              // Green Score Indicator
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.green.shade300,
                        Colors.green.shade600,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.shade200,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      )
                    ]
                  ),
                  padding: EdgeInsets.all(16),
                  child: GreenScoreIndicator(greenScore: portfolio.greenScore),
                ),
              ),
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
      ),
    );
  }

  Widget _buildPortfolioCard(
    BuildContext context, {
    required String title, 
    required String value, 
    required IconData icon
  }) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            colors: [
              Colors.green.shade400,
              Colors.green.shade600,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                icon, 
                color: Colors.white, 
                size: 36
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16, 
                      color: Colors.white70,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 24, 
                      color: Colors.white, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}