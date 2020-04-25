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
            child: RaisedButton(
                child: Text("#허쉬초콜렛"),
                onPressed: () {}),
          )
        ],
      ),
    );
  }
}
