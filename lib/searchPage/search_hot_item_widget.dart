import 'package:flutter/material.dart';
import 'search_item.dart';
import '../tools/string_helper.dart';

class SearchWidgetComponent{
  static bool showAllHistory = false; //默认

  //搜索历史header
  static Widget historyHeaderWidget(Function onTapFuntion){
    return Container(
      margin: EdgeInsets.only(top: 30, left: 15, right: 15),
      child: GestureDetector(
        onTap: () => onTapFuntion(),
        child: Row(
          children: <Widget>[
            Text(
              '搜索历史',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff1e1e1e),
              ),
            ),
            Spacer(),
            Row(
              children: <Widget>[
                Image.asset(
                  'images/search_clear.png',
                  width: 16,
                  height: 16,
                ),
                Padding(padding: EdgeInsets.only(left: 2)),
                Text(
                  '清空',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff999999),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  //搜索历史itemWidget
  static Widget historyItemWidget(SearchHistoryItem historyItem){
    if(historyItem.showWord.length == 0) return Container();
    TextStyle textStyle = TextStyle(fontSize: 14, color: Color(0xff666666));
    double itemMaxW = 150;
    double itemW = 0;
    double textW = StringCaculateHelper.textWidthWithTextStyle(historyItem.showWord, textStyle);
    if(historyItem.itemType == SearchHistoryItemType.SearchHistoryItemProduct){ //商品
      itemW = textW + 20;
      if(textW > itemMaxW) itemW = itemMaxW;
      return Container(
        padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
        width: itemW,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Color.fromARGB(255, 240, 240, 240),
        ),
        child: Text(
          historyItem.showWord,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: textStyle,
        ),
      );
    }else{ //店铺
      itemW = textW + 20 + 18 + 2;
      if(textW > itemMaxW) itemW = itemMaxW;
      return Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        width: itemW,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Color.fromARGB(255, 240, 240, 240),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/search_history_shopIcon.png',
              width: 18,
              height: 18,
              fit: BoxFit.fill,
            ),
            Padding(padding: EdgeInsets.only(left: 2)),
            Container(
              width: itemW - 20 - 18 - 2,
              child: Text(
                historyItem.showWord,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: textStyle,
              ),
            )
          ],
        ),
      );
    }
  }

  //搜索历史
  static Widget historyWidget(List<SearchHistoryItem> list, double windowWidth, Function arrowClick){
    List<Widget> widgetList = historyWidgets(list, windowWidth, arrowClick);
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 10,
        runSpacing: 10,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: widgetList,
      ),
    );
  }

  //获取搜索历史需要显示的widget
  static List<Widget> historyWidgets(List<SearchHistoryItem> list,double windowWidth, Function arrowClick){
    if(list.length == 0) return [];
    List<Widget> widgetList = [];
    double arrowWH = 30;
    double maxW = windowWidth - 30;
    double itemX = 0;
    double itemPadding = 10;
    int lineCount = 1;
    int currentCount = 0;
    for(int i = 0; i < list.length; i++){
      SearchHistoryItem item = list[i];
      double itemW = historyItemWidth(item);
      if(itemX + itemPadding + itemW > maxW){
        itemX = 0;
        lineCount++;
      }
      itemX += (itemX <= 0 ? itemW : (itemPadding + itemW));
      Widget itemWidget = historyItemWidget(item);
      if(showAllHistory){ //全显示
        widgetList.add(itemWidget);
        currentCount++;
      }else{ //显示两行
        if(lineCount > 2){break;}
        currentCount++;
        widgetList.add(itemWidget);
      }
    }
    double arrowRight = (itemX + 10 + 30); //箭头
    if(currentCount != list.length){ //没有显示完， 肯定是两行
      if(arrowRight > maxW){ //加上箭头，超出最大宽度
        list.removeLast();
      }
      widgetList.add(historyArrowWidget(arrowClick));
    }else{ //不满两行或超过两行
      if(lineCount > 2){
        widgetList.add(historyArrowWidget(arrowClick));
      }
    }
    return widgetList;
  }

  static Widget historyArrowWidget(Function arrowClick){
    return GestureDetector(
      onTap: arrowClick,
      child: Container(
        width: 30,
        height: 30,
        padding: EdgeInsets.all(7),
        color: Color.fromARGB(255, 240, 240, 240),
        child: Image.asset(
          showAllHistory ? 'images/search_history_topArrow.png' : 'images/search_history_downArrow.png',
        ),
      ),
    );
  }

  //搜索历史item宽度
  static double historyItemWidth (SearchHistoryItem item){
    if(item.showWord.length == 0) return 0;
    TextStyle textStyle = TextStyle(fontSize: 14);
    double textW = StringCaculateHelper.textWidthWithTextStyle(item.showWord, textStyle);
    if(item.itemType == SearchHistoryItemType.SearchHistoryItemProduct){
      textW = textW + 20;
    }else {
      textW = textW + 20 + 18 + 2;
    }
    if(textW > 150) textW = 150;
    return textW;
  }

  //热门推荐header
  static Widget searchHotHeaderWidget(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30, left: 15),
      child: Text(
        '热门推荐',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xff1e1e1e),
      ),
      ),
    );
  }

  //热门推荐item
  static Widget searchHotItemWidget(SearchHotItem hotItem, double itemWidth){
    Color textColor = Color(0xff666666);
    if(hotItem.showStyle == SearchHotShowStyle.SearchHotShowHightLight){
      textColor = Color(0xfff1002d);
    }
    bool showIcon = false;
    if(hotItem.showStyle == SearchHotShowStyle.SearchHotShowPromot && hotItem.iconUrl?.length > 0){
      showIcon = true;
    }

    List<Widget> list = [];
    if(showIcon){
      list = [
        Image.network(
          hotItem.iconUrl,
          width: 18,
          height: 18,
          fit: BoxFit.fill,
        ),
        Padding(padding: EdgeInsets.only(left: 2)),
        Text(
          hotItem.showWord,
          textAlign: TextAlign.left,
          overflow: TextOverflow.clip,
          style: TextStyle(
              color: textColor
          ),
        ),
      ];
    }
    else{
      list.add(Container(
        width: itemWidth,
        child: Text(
          hotItem.showWord,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: TextStyle(
            color: textColor
          ),
        ),
      ));
    }

    return Container(
      width: itemWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: list,
      ),
    );
  }

  //热门推荐widget
  static Widget searchHotWidget(List<SearchHotItem> hotItemList, double itemWidth){
    List<Widget> widgetList = [];
    for(int i = 0; i < hotItemList.length; i++){
      SearchHotItem hotItem = hotItemList[i];
      Widget hotItemWidtet = SearchWidgetComponent.searchHotItemWidget(hotItem,itemWidth);
      widgetList.add(hotItemWidtet);
    }
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 10,
        runSpacing: 23,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: widgetList,
      ),
    );
  }
}