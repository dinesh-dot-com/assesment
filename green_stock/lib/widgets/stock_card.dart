import 'package:flutter/material.dart';
import '../models/stock.dart';

class StockCard extends StatelessWidget {
  final Stock stock;

  StockCard({required this.stock});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(stock.name),
        subtitle: Text('Price: \$${stock.price.toStringAsFixed(2)}'),
      ),
    );
  }
}
