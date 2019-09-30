import 'package:flutter/material.dart';

class SkeletonArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xffededed)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                  child: Container(
                width: 20,
                height: 20,
                color: Colors.red,
              )),
              Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Container(
                    width: 30,
                    height: 12,
                    color: Colors.red,
                  )),
              Expanded(
                child: SizedBox.shrink(),
              ),
              Container(
                width: 50,
                height: 12,
                color: Colors.red,
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: <Widget>[
                Container(
                  height: 15,
                  color: Colors.red,
                ),
                Container(
                  height: 15,
                  margin: EdgeInsets.only(right: 30,top: 5,bottom: 5),
                  color: Colors.red,
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                width: 30,
                height: 10,
                color: Colors.red,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: 60,
                height: 10,
                color: Colors.red,
              ),
            ],
          )
        ],
      ),
    );
  }
}
