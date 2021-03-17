

import 'package:flutter/material.dart';
import 'package:task/widgets/OrderStatuswidget.dart';

class RunningScreen extends StatefulWidget {
  @override
  _RunningScreenState createState() => _RunningScreenState();
}

class _RunningScreenState extends State<RunningScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          OrderStatuswidget(orderStatus: "Buy Order",DateTime: "2/3/2021 - 06:00 PM",),
          OrderStatuswidget(orderStatus: "Get Cash",DateTime: "2/3/2021 - 06:00 PM",),
          OrderStatuswidget(orderStatus: "Recycling Order",DateTime: "2/3/2021 - 06:00 PM",),
        ],
      ),
    );
  }
}








