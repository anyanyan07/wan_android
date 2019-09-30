import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WrappedImage extends StatelessWidget {
  String _imageUrl;
  double _width;
  double _height;

  WrappedImage(this._imageUrl, this._width, this._height);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: _imageUrl,
      width: _width,
      height: _height,
      fit: BoxFit.fill,
      placeholder: (context, url) {
        return SizedBox(
          width: _width,
          height: _height,
          child: CupertinoActivityIndicator(
            radius: min(10, _width / 3),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Icon(Icons.error);
      },
    );
  }
}
