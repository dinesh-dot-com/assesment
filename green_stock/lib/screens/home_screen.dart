import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'portfolio_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme;

  HomeScreen({required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Tracker', style: TextStyle(fontWeight: FontWeight.bold)),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Search Stocks Card
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()),
                  );
                },
                borderRadius: BorderRadius.circular(15.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.green, size: 32),
                      SizedBox(width: 16),
                      Text('Search Stocks', style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // View Portfolio Card
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PortfolioScreen(toggleTheme: toggleTheme)),
                  );
                },
                borderRadius: BorderRadius.circular(15.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.account_balance_wallet, color: Colors.green, size: 32),
                      SizedBox(width: 16),
                      Text('View Portfolio', style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
