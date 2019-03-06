import 'package:flutter/material.dart';

class PullLoadWidget extends StatefulWidget{
  final IndexedWidgetBuilder itemBuilder;
  //下拉刷新
  final RefreshCallback onRefresh;
  //下拉刷新
  final RefreshCallback onLoadMore;

  final Key refreshKey;

  final  PullLoadWidgetControl pullLoadWidgetControl;
  PullLoadWidget(this.itemBuilder,this.onRefresh,this.onLoadMore,this.refreshKey,this.pullLoadWidgetControl);

  @override
  _PullLoadWidgetState createState() => _PullLoadWidgetState(this.itemBuilder,this.onRefresh,this.onLoadMore,this.refreshKey,this.pullLoadWidgetControl);
}

class _PullLoadWidgetState extends State<PullLoadWidget>{
  final IndexedWidgetBuilder itemBuilder;
  final RefreshCallback onRefresh;
  final RefreshCallback onLoadMore;
  final Key refreshKey;
  final PullLoadWidgetControl  pullLoadWidgetControl;
  final ScrollController _controller = new ScrollController();

  _PullLoadWidgetState(this.itemBuilder,this.onRefresh,this.onLoadMore,this.refreshKey,this.pullLoadWidgetControl);

  @override
  void initState() {
    _controller.addListener((){
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
        if(this.pullLoadWidgetControl.needLoadMore){
          this.onLoadMore();
        }
      }
    });
    super.initState();
  }

  _getItem(BuildContext context,int index){
    if(pullLoadWidgetControl.dataList.length == 0){

    } else if(pullLoadWidgetControl.dataList.length - 1 == index && pullLoadWidgetControl.dataList.length!=0){
      return _bottomWidget();
    } else {
      return itemBuilder(context,index);
    }
  }

  Widget _bottomWidget(){
    pullLoadWidgetControl.needLoadMore? Row(
      children: <Widget>[
        
      ],
    ):Container();
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      key: refreshKey,
      onRefresh: onRefresh,
      child: new ListView.builder(
        itemCount: pullLoadWidgetControl.dataList.length,
        itemBuilder:(context,index){
          return _getItem(context, index);
        },
        controller: _controller,
      ),
    );
  }
}

class PullLoadWidgetControl {
  List dataList = new List();
  bool needLoadMore = true;
  int pageSize = 10;
}



