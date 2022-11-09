



import 'package:app_news/layout/home_layout.dart';
import 'package:app_news/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';

void main ()
{
  dioHelper.init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:homeLayout() ,
    );
  }
}
