import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'firstproductpage.dart';
import 'searchpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Firstpage(),
    );
  }
}

class Firstpage extends StatefulWidget {
  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage>  {
  int _selectedIndex=0;

  List _pages=[
    FirstProductpage(),
    SearchPage(),
    Text("yet1"),
    Text("yet2")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body : Center(
          child: _pages[_selectedIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onitemTapped,
        selectedItemColor: Colors.green[900],
        selectedFontSize: 15,
        unselectedItemColor: Colors.black45,
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon:Icon(Icons.home),title: Text('Home')),
        BottomNavigationBarItem(icon:Icon(Icons.search),title: Text('Search')),
        BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), title: Text('PB')),
        BottomNavigationBarItem(icon:Icon(Icons.person),title: Text('My')),
      ],
      ),
    );
  }

 void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
 }
}
