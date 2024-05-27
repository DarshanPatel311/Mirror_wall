import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/google_variable.dart';


Row bottomBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
          onPressed: () {
            inAppWebViewController.goBack();
          },
          icon: Icon(Icons.chevron_left,size: 30,)),
      IconButton(
          onPressed: () {
            inAppWebViewController.goForward();
          },
          icon: Icon(Icons.chevron_right,size: 30,)),
      IconButton(
          onPressed: () {
            inAppWebViewController.reload();
          },
          icon: Icon(Icons.refresh)),
      IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
      IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
    ],
  );
}