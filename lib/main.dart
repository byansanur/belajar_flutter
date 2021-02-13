import 'package:flutter/material.dart';
import 'package:flutter_belajar/mainFragment/Account.dart';
import 'package:flutter_belajar/mainFragment/Activity.dart';
import 'package:flutter_belajar/mainFragment/Home.dart';
import 'package:flutter_belajar/mainFragment/Order.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'SiMotor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  final registryFragment = [
    Home(),
    Activity(),
    Order(),
    Account()
  ];

  void onMoveFragment(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: registryFragment.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Beranda')),
          BottomNavigationBarItem(icon: Icon(Icons.local_activity), title: Text('Aktivitas')),
          BottomNavigationBarItem(icon: Icon(Icons.reorder), title: Text('Transaksi')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('Akun')),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onMoveFragment,
      ),
    );
  }
}
