
import 'package:flutter/material.dart';
import 'package:task/widgets/historywidget.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          historywidget(orderStatus: "Buy Order"),
          historywidget(orderStatus: "Get Cash"),
          historywidget(orderStatus: "Recycling Order"),
        ],
      ),
    );
  }
}
