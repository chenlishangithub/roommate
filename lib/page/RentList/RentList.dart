import 'package:flutter/material.dart';
import 'package:roommate_app/widget/PullLoadWidget.dart';
import 'package:roommate_app/service/request.dart';
import 'package:roommate_app/page/RentList/RentItem.dart';


class RentListPage extends StatefulWidget {
  @override
  _RentListPageState createState() => _RentListPageState();
}

class _RentListPageState extends State<RentListPage> with AutomaticKeepAliveClientMixin {
  final List rentList = new List();
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  final PullLoadWidgetControl pullLoadWidgetControl =new PullLoadWidgetControl();
  @override
  bool get wantKeepAlive => true;

  @override
  void initState(){
    new Future.delayed(const Duration(seconds: 0), () {
      refreshIndicatorKey.currentState.show().then((e) {});
    });
    super.initState();
  }



  Future<Null> onRefresh() async{
    await Request.getRoommateList().then((res){
      print('租客列表'
          '${res.data}');
      if(res.code == 0){
      setState(() {
        pullLoadWidgetControl.dataList = res.data;
      });}
    });
    return null;
  }

  Future<Null> onLoadMore() async{
    await Request.getRoommateList().then((res){
      print('租客列表'
          '${res.data}');
      if(res.code == 0){
        setState(() {
          pullLoadWidgetControl.dataList.addAll(res.data);
        });}
    });
    return null;
  }

  Widget _itemBuilder(BuildContext context, int index){
    var data = pullLoadWidgetControl.dataList[index];
    return RentItem(portrait:data["portrait"],name:data["name"],age:data["age"],sex:data["sex"],job:data["job"],labelList: data["labelList"],checkinTime: data["checkinTime"],minMoney: data["minMoney"], maxMoney:  data["maxMoney"],);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFFF5F5F5),
      child:PullLoadWidget(_itemBuilder, onRefresh, onLoadMore,refreshIndicatorKey,pullLoadWidgetControl) ,
    );
  }
}
