import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List search_example =['씨그램', '이천쌀콘', '코카콜라'];

  TextEditingController searchController = new TextEditingController();
  String filter;

  @override  initState() {
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _handleSubmitted(String str){
    // 검색 결과 예제
    int _index = 0;
    for(_index;_index<search_example.length;_index++){
      if (search_example[_index]==str){
        print(str);
      }
      else {
        print('검색 결과가 없습니다.');
        break;
      }
    }
    searchController.clear();  // 서치 버튼을 누르면 텍스트 사라지면서 해당 상품 리턴하게 코드 수정해야 함.
    FocusScope.of(context).requestFocus(FocusNode()); //서치 버튼 누르면 키보드 hide
  }

  //Coloumn - 검색창 & 해시태그 버튼
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 160.0, 10.0, 60.0),//EdgeInsets.all (20.0),
            child : Row(
              mainAxisSize: MainAxisSize.min,
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Container(
                  child: TextField(
                    //maxLength: 15,
                    controller: searchController,
                    cursorColor: Colors.green[900],
                    decoration: InputDecoration(
                      //icon: Icon(Icons.search,color: Colors.lightGreen),
                      hintText: '찾으시는 상품을 입력하세요.',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          borderSide: BorderSide(color: Colors.green[600])
                      ),
                    ),
                  ),
                  width: 310,
                ),
                IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.green[900],
                    iconSize: 30,
                    onPressed: () => _handleSubmitted(searchController.text)
                )
              ],
            )
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 30.0, right: 0.0, top: 20.0),
            child: Text("#추천 키워드", style: TextStyle(fontSize: 20, color: Colors.black, ),),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 0.0, top: 10.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color:Colors.green[900])
                      ),
                      color: Colors.green[900],
                      textColor: Colors.white,
                      child: Text("허쉬쿠키초콜렛"),
                      onPressed: () {}),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 0.0,top: 10.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color:Colors.green[900])
                      ),
                      color: Colors.green[900],
                      textColor: Colors.white,
                      child: Text("트레비"),
                      onPressed: () {}),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 0.0, top: 10.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color:Colors.green[900])
                      ),
                      color: Colors.green[900],
                      textColor: Colors.white,
                      child: Text("씨그램"),
                      onPressed: () {}),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
