import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'searchpage.dart';

class FirstProductpage extends StatefulWidget {
  @override
  _FirstProductpageState createState() => _FirstProductpageState();
}

class _FirstProductpageState extends State<FirstProductpage>  with TickerProviderStateMixin {

  TabController ctr;

  @override
  void initState(){
    super.initState();
    ctr = TabController(vsync: this,length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: (Text('Discount',style:TextStyle(color: Colors.black))),
          bottom:TabBar(
            //labelColor: Colors.teal,
            labelColor: Colors.green[900],
            unselectedLabelColor: Colors.black12,
            //indicatorSize: TabBarIndicatorSize.tab,
            /*indicator: BoxDecoration(borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)),
              color: Colors.white
          ),*/
            indicatorColor: Colors.green,
            indicatorSize: TabBarIndicatorSize.label,
            controller: ctr,
            tabs: <Widget>[
              Tab(child: Text('Products',)),
              Tab(child:Text('Convenience Stores'))
            ],
          )
      ),
      body:TabBarView(
        controller: ctr,
        children: <Widget>[
          CardView(),
          Icon(Icons.add),
        ],
      ),
    );
  }
}





class CardView extends StatefulWidget {
  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Align(
        alignment: Alignment.center,
        child: GridView.count(
          crossAxisCount: 1,
          padding: EdgeInsets.all(50.0),
          childAspectRatio: 1.0 / 1.5 ,

          children: <Widget>[Card()],
        ),
      )
    );
  }
}
