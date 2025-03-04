import 'package:flutter/material.dart';
import '../models/stock.dart';

class CarbonInfoCard extends StatelessWidget {
  final Stock stock;

  CarbonInfoCard({required this.stock});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Carbon Footprint'),
        subtitle: Text('${stock.carbonFootprint.toStringAsFixed(2)} tons'),
      ),
    );
  }
}
