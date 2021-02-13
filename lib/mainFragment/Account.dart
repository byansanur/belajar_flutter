import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AccountState();
}

class AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SiMotor'),
        centerTitle: true,
      ),
      body: Text('Account', textAlign: TextAlign.center),
    );
  }
}