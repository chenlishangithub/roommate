import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final String text;
  final Color color;
  LabelWidget({Key key,this.text,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
        ),
        padding: EdgeInsetsDirectional.only(start: 4.0,end:4.0,top:2.0,bottom:2.0),
        child: Text(text,
            style: TextStyle(
              height: 1.0,
              color: color,
              fontSize: 11.0,
            )
        )
    );
  }
}
