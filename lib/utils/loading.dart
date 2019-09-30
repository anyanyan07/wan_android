import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading {
  //网络请求加载框
  static showLoading(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () {},
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration:
                      BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SpinKitCubeGrid(
                        size: 40,
                        itemBuilder: (_, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10
                      ),
                      Text('加载中...',style: TextStyle(fontSize: 14,color: Color(0xff999999)),)
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  static closeLoading(BuildContext context){
    Navigator.pop(context);
  }
}
