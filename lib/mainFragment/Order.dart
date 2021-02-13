import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OrderState();
}

class OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SiMotor'),
        centerTitle: true,
      ),
      body: Text('Order', textAlign: TextAlign.center),
    );
  }
}