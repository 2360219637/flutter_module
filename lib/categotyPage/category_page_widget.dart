import 'dart:ui' as ui; // 调用window拿到route判断跳转哪个界面
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'category_item.dart';
import 'dart:convert';


const double leftListWidth = 80;

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CategoryPage createState() => _CategoryPage();
}

const pushMainPlatform = const MethodChannel('com.gegejia.globalscanner.category');
class _CategoryPage extends State<CategoryPage> {
  CategoryFirstModel firstModelData = null;
  List<dynamic> secondCategoryDataList = [];
  int selectLeftIndex = 0;

  @override
  void initState() {
    super.initState();
    pushMainPlatform.setMethodCallHandler(_handler);

    this.setState(() {
      this.selectLeftIndex = 0;
    });
  }

  //处理ios传给flutter的数据
  Future<dynamic> _handler(MethodCall methodCall) {
    if (methodCall.method == "left_cagegory_json_data") {
      Map<String, dynamic> map = {'list' : json.decode(methodCall.arguments)};
      CategoryFirstModel model = CategoryFirstModel.fromJson(map);
      setState(() {
        this.firstModelData = model;
      });
    }else if(methodCall.method == "second_category_data"){
      List<dynamic> secondDataList = [];
      List<dynamic> listData = json.decode(methodCall.arguments);
      for(int i = 0; i < listData.length;i++){
          Map<String, dynamic> map = listData[i];
          CategorySecondModel secondModel = CategorySecondModel.fromJson(map);
          if(secondModel.appThirdItem != null) {
            secondDataList.add(secondModel.itemName);
            secondDataList.addAll(secondModel.appThirdItem);
          }
      }
      setState(() {
        this.secondCategoryDataList = secondDataList;
      });
    }
    // 回传给iOS的数据
    return Future.value('1');
  }

  //点击左侧列表item
  void leftListItemClick(int index){
    CategoryFirstItem item = this.firstModelData?.list[index];
    Map<String, dynamic> codeMap = {'code': item?.nextLevelCode};
    pushMainPlatform.invokeMethod('second_category_code', codeMap);
    this.setState(() {
      this.selectLeftIndex = index;
    });
  }

  void rightListItemClick(String detailUrl){
    Map<String, dynamic> detailMap = {'url': detailUrl};
    pushMainPlatform.invokeMethod('third_item_detaulUrl', detailMap);
  }

  Widget leftListWidget(){
    if(this.firstModelData == null || this.firstModelData.list?.length == 0){
      return Container(width: leftListWidth);
    }
    return Container(
      width: leftListWidth,
      child: ListView.builder(
        itemCount: this.firstModelData?.list?.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: ()=> this.leftListItemClick(index),
            child: Container(
              height: 45,
              color: Color(this.selectLeftIndex == index ? 0xFFFFFFFF : 0xfff5f5f5),
              child: Center(
                  child: Text(
                    this.firstModelData?.list[index]?.itemName ?? '',
                    maxLines:2,
                    style: TextStyle(
                      color: Color(this.selectLeftIndex == index ? 0xff1a1a1a : 0xff666666),
                      fontSize: 13,
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }

  Widget rightListItemWidget(Object data){
    if(data is String){
      return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Center(
          child: Text(
            data,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff666666),
            ),
          ),
        ),
      );
    }else{
      CategoryThirdModel model = data;
      return GestureDetector(
        onTap: () => this.rightListItemClick(model.detailUrl ?? ''),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                model.itemImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 4)),
            Center(
              child: Text(
                model.itemName,
                maxLines: 2,
                softWrap: true,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff666666),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  Widget rightListWidget() {
    double rightListW = MediaQuery.of(context).size.width-leftListWidth;
    int itemColumnCount = 3;
    double itemW = 62;
    double itemPadding = (rightListW - itemW * itemColumnCount)/(itemColumnCount+1);
    if(this.secondCategoryDataList == null || this.secondCategoryDataList.length == 0){
      return Container(width: rightListW,);
    }
    return Container(
      color: Colors.white,
      width: rightListW,
      child: StaggeredGridView.countBuilder(
        crossAxisCount: itemColumnCount,
        itemCount: this.secondCategoryDataList.length,
        itemBuilder: (context, index){
          return rightListItemWidget(this.secondCategoryDataList[index]);
        },
        mainAxisSpacing: 14,
        crossAxisSpacing: itemPadding,
        padding: EdgeInsets.symmetric(horizontal: itemPadding),
        staggeredTileBuilder: (int i){
          Object data = this.secondCategoryDataList[i];
          int width = (data is String) ? itemColumnCount : 1;
          double height = 0.0;
          if(data is String){
            height = 35;
          }else{
            height = 100;
          }
          return StaggeredTile.extent(width, height);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        bottom: false,
        child: Row(
          children: [
            this.leftListWidget(),
            this.rightListWidget(),
          ],
        ),
      ),
    );
  }
}