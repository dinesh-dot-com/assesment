import 'package:flutter/material.dart';
import '../services/stock_service.dart';
import '../models/stock.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  Stock? _stock;
  bool _isLoading = false;

  void _searchStock() async {
    setState(() {
      _isLoading = true;
    });

    final stockService = StockService();
    final stock = await stockService.fetchStockData(_controller.text);
    
    setState(() {
      _stock = stock;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Stocks', 
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            letterSpacing: 1.2
          )
        ),
        centerTitle: true,
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter Stock Symbol',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _searchStock,
                child: _isLoading 
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Search'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              if (_stock != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Card(
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
                      child: ListTile(
                        title: Text(
                          'Stock Price: \$${_stock!.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18, 
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        subtitle: Text(
                          'Symbol: ${_stock!.symbol}',
                          style: TextStyle(
                            color: Colors.white70
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}