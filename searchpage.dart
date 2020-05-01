import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

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
    searchController.clear();  // 서치 버튼을 누르면 텍스트 사라지면서 해당 상품 리턴하게 코드 수정해야 함.
  }

  //Coloumn - 검색창 & 해시태그 버튼
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 50.0),//EdgeInsets.all (20.0),
            child : TextField(
              controller: searchController,
              cursorColor: Colors.green[900],
              decoration: InputDecoration(
                icon: Icon(Icons.search,color: Colors.lightGreen),
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
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 0.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color:Colors.green[900])
                      ),
                      color: Colors.green[900],
                      textColor: Colors.white,
                      child: Text("#허쉬초콜렛"),
                      onPressed: () {}),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 0.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color:Colors.green[900])
                      ),
                      color: Colors.green[900],
                      textColor: Colors.white,
                      child: Text("#트레비"),
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
