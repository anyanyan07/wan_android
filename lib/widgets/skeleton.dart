import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

///骨架屏
class Skeleton extends StatelessWidget {
  int length;
  WidgetBuilder builder;

  Skeleton(this.length, this.builder);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Shimmer.fromColors(
            period: Duration(milliseconds: 1200),
            baseColor: Colors.grey[350],
            highlightColor: Colors.grey[200],
            child: Column(
                children: List.generate(length, (index) => builder(context)))));
  }
}
