import 'package:flutter/material.dart';
import 'search_item.dart';
import 'search_hot_item_widget.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class SearchPageWidget extends StatefulWidget {
  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

const pushMainPlatform = const MethodChannel('com.gegejia.globalscanner.search');
class _SearchPageWidgetState extends State<SearchPageWidget> {
  List<SearchHotItem> hotItemList = [];
  List<SearchHistoryItem> historyItemList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pushMainPlatform.setMethodCallHandler(_handler);
  }

  //处理ios传给flutter的数据
  Future<dynamic> _handler(MethodCall methodCall) {
    if (methodCall.method == "search_hot_json_data") {
      Map<String, dynamic> map = {'list' : json.decode(methodCall.arguments)};
      SearchHotListItem item =  SearchHotListItem.fromJson(map);
      setState(() {
        this.hotItemList = item.list;
      });
    }else if (methodCall.method == "search_history_json_data") {
      Map<String, dynamic> map = {'list' : json.decode(methodCall.arguments)};
      print("------------   ${map}");
      SearchHistoryListItem item =  SearchHistoryListItem.fromJson(map);
      setState(() {
        this.historyItemList = item.list;
      });
    }
    // 回传给iOS的数据
    return Future.value('1');
  }

  void arrowClick(){
    SearchWidgetComponent.showAllHistory = (SearchWidgetComponent.showAllHistory == true ? false : true);
    setState(() {});
  }

  void clearHistory(){
    print('1111111');
  }

  @override
  Widget build(BuildContext context) {
    double hotItemW = (MediaQuery.of(context).size.width-15*3)/2;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        bottom: false,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index){
            if(index == 0){
              return SearchWidgetComponent.historyHeaderWidget(clearHistory);
            }
            else if(index == 1){
              return SearchWidgetComponent.historyWidget(this.historyItemList, MediaQuery.of(context).size.width, this.arrowClick);
            }
            else if(index == 2){
              if(this.hotItemList.length == 0) return Container();
              return SearchWidgetComponent.searchHotHeaderWidget();
            }
            else if(index == 3){
              if(this.hotItemList.length == 0) return SizedBox.shrink();
              return SearchWidgetComponent.searchHotWidget(this.hotItemList, hotItemW);
            }
            else{
              return Container();
            }
          },
        )
      ),
    );
  }
}
