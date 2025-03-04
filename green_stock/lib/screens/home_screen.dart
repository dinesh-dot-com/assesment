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
        title: Text('Stock Tracker'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: Icon(Icons.search, color: Colors.green),
                title: Text('Search Stocks', style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: Icon(Icons.account_balance_wallet, color: Colors.green),
                title: Text('View Portfolio', style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
   Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => PortfolioScreen(toggleTheme: toggleTheme)),
);

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
