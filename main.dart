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
      home: //Firstpage(),
      SelectCategory(),
    );
  }
}

class SelectCategory extends StatefulWidget {
  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {

  List category = [];
  bool _buttonEnabled1 = false; // 각 버튼을 처음에는 비활성화 함.
  bool _buttonEnabled2 = false;
  bool _buttonEnabled3 = false;
  int count = 0;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 160.0, 10.0, 60.0),//EdgeInsets.all (20.0),
            ),
            Text('관심 있는 상품 카테고리를 선택해 주세요.'),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text('음료'),
                  onPressed: () {
                    print(_buttonEnabled1);
                    print("음료");
                    setState(() {
                      _buttonEnabled1 = !_buttonEnabled1; // true <-> false
                      sumCount(_buttonEnabled1);
                    });
                    print(_buttonEnabled1);
                  },
                ),
                RaisedButton(
                  child: Text('즉석 조리'),
                  onPressed: () {
                    category.add('즉석 조리');
                    setState(() {
                      _buttonEnabled2 = !_buttonEnabled2; // true <-> false
                      sumCount(_buttonEnabled2);
                    });
                  },
                ),
                RaisedButton(
                  child: Text('과자'),
                  onPressed: (){
                    category.add('과자');
                    setState(() {
                      _buttonEnabled3 = !_buttonEnabled3; // true <-> false
                      sumCount(_buttonEnabled3);
                    });
                    print(category);
                  },
                ),
              ],
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text('간편 식사'),
                ),
                RaisedButton(
                  child: Text('아이스크림'),
                ),
                RaisedButton(
                  child: Text('생활용품'),
                ),
              ],
            ),
            RaisedButton(
              child: Text('저장'),
              onPressed: count==0 ? null : (){
                setState(() {
                  goFirstpage();
                });
              },
            ),
          ],
        ),
    );
  }

  void sumCount(bool b){
    if (b){count += 1;}
    else {count-=1;}
  }

  void goFirstpage(){
    Navigator.push(
        context,  // 기본 파라미터, SecondRoute로 전달
        MaterialPageRoute(builder: (context)=>Firstpage())
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
