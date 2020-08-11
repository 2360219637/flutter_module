import 'dart:ui' as ui; // 调用window拿到route判断跳转哪个界面
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'categotyPage/category_page_widget.dart';
import 'searchPage/search_page_widget.dart';

//执行命令：flutter packages pub run build_runner build —delete-conflicting-output

void main() {
  runApp(MyApp(pageRoute:ui.window.defaultRouteName));
//  runApp(MyApp(pageRoute:'GGJCategoryPage'));
}

class MyApp extends StatelessWidget {
  String pageRoute;
  MyApp({this.pageRoute});
  Widget loadPageWidget(){
    switch(this.pageRoute){
      case 'GGJCategoryPage':{
        return CategoryPage();
      }
      case 'GGJSearchPageWidget':{
        return SearchPageWidget();
      }
      default:{
//        return Center(child: Text('Unknown route'),);
        return Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Text("没找到页面"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: loadPageWidget()
    );
  }
}