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

  void _searchStock() async {
    final stockService = StockService();
    final stock = await stockService.fetchStockData(_controller.text);
    setState(() {
      _stock = stock;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Stocks'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter Stock Symbol',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchStock,
              child: Text('Search'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            if (_stock != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    title: Text(
                      'Stock Price: \$${_stock!.price.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text('Symbol: ${_stock!.symbol}'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
