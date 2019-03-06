import 'package:flutter/material.dart';
import 'package:roommate_app/widget/LabelWidget.dart';

class RentItem extends StatelessWidget{
  final String portrait;
  final String name;
  final int age;
  final int sex;
  final String job;
  final List<dynamic> labelList;
  final String checkinTime;
  final int minMoney;
  final int maxMoney;

  RentItem({Key key,this.portrait,this.name,this.sex,this.age,this.job,this.labelList,this.checkinTime,this.minMoney,this.maxMoney}):super(key: key);

  List<Widget> labelWidgetList(){
   List<Widget> labels=[];
    labelList.forEach((item){
      labels.add(LabelWidget(text:item,color:Color(0XFF7ED1C9)));
    });
    return labels;
  }

  @override
  Widget build(BuildContext context) {
    return Container (
      margin:EdgeInsets.only(left: 13.0,right: 13.0,top: 13.0),
      decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: [BoxShadow(
          color:Color.fromRGBO(212,212,212,0.5),
          blurRadius: 3.0,
        )]
      ),
      child:Column(
        children: <Widget>[
          Padding(
            padding:EdgeInsets.all(11.0),
            child:Flex(
              direction:Axis.horizontal,
              children: <Widget>[
                Image(
                  image:NetworkImage(portrait),
                  height: 40.0,
                  width: 40.0,
                ),
                Expanded(
                    flex:1,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(name),
                        Text(
                          age.toString()+"岁  "+job,
                          style:TextStyle(
                              fontSize: 12.0,
                              color: Color(0XFF666666)
                          ) ,
                        ),
                      ],
                    )
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(checkinTime+"入住",style: TextStyle(fontSize: 12.0),),
                    Text("预算 ￥"+minMoney.toString() + "~" + maxMoney.toString(),style:TextStyle(fontSize: 12.0,color: Color(0XFF4A4A4A))),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding:EdgeInsets.all(8.0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border(top:BorderSide(color:Color(0XFFEEEEEE),width: 1.0))
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Wrap(
                    spacing:7.0,
                    direction: Axis.horizontal,
                    children: labelWidgetList(),
                  ),
                ),
                LabelWidget(text:"${labelList.length}个标签",color: Color(0XFF666666),)
              ],
             )
          )
       ],
      )
    );
  }
}