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
        title: Text(
          'Stock Tracker', 
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildHomeCard(
                  context: context, 
                  icon: Icons.search, 
                  title: 'Search Stocks', 
                  onTap: () => Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => SearchScreen())
                  ),
                ),
                SizedBox(height: 20),
                _buildHomeCard(
                  context: context, 
                  icon: Icons.account_balance_wallet, 
                  title: 'View Portfolio', 
                  onTap: () => Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => PortfolioScreen(toggleTheme: toggleTheme)
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHomeCard({
    required BuildContext context, 
    required IconData icon, 
    required String title, 
    required VoidCallback onTap
  }) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.0),
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
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(
                  icon, 
                  color: Colors.white, 
                  size: 36
                ),
                SizedBox(width: 20),
                Text(
                  title, 
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios, 
                  color: Colors.white, 
                  size: 24
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}