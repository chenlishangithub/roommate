import 'package:flutter/material.dart';
import 'package:roommate_app/page/RentList/RentList.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex =0;
  var pageList = [
    {"page":new RentListPage(), "title":'找室友'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[tabIndex]['page'],
      appBar: AppBar(
        title: Text(pageList[tabIndex]['title'],style: TextStyle(color:Colors.white))
      ),
      bottomNavigationBar:BottomNavigationBar(
        items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(icon:Icon(Icons.face,color:Color(0XFFDDDDDD)),title:Text('找室友')),
          BottomNavigationBarItem(icon:Icon(Icons.home,color:Color(0XFFDDDDDD)),title:Text('找房源')),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(index){
    setState(() {
      tabIndex = index;
    });
  }
}