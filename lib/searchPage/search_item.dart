import 'package:json_annotation/json_annotation.dart';
import '../tools/json_helper.dart';

part 'search_item.g.dart';

enum SearchItemJumpType{
  jumpToSearchResult,
  jumpUrl,
}

enum SearchHotShowStyle{
  SearchItemShowNormal,
  SearchHotShowHightLight,
  SearchHotShowPromot
}

enum SearchHistoryItemType{
  SearchHistoryItemProduct,
  SearchHistoryItemShop,
}

@JsonSerializable()
class SearchHistoryListItem{
  List<SearchHistoryItem> list;
  SearchHistoryListItem({
    this.list,
  });
  factory SearchHistoryListItem.fromJson(Map<String, dynamic> json) => _$SearchHistoryListItemFromJson(json);
}

@JsonSerializable()
class SearchHistoryItem{
  String showWord;
  String jumpTypeName;
  @JsonKey(fromJson: JsonHelper.convertString)
  String searchWordType;
  SearchHistoryItemType get itemType{
    if(searchWordType == '1'){
      return SearchHistoryItemType.SearchHistoryItemShop;
    }
    return SearchHistoryItemType.SearchHistoryItemProduct;
  }
  SearchHistoryItem({this.showWord,});
  factory SearchHistoryItem.fromJson(Map<String, dynamic> json) => _$SearchHistoryItemFromJson(json);
}

@JsonSerializable()
class SearchHotListItem{
  List<SearchHotItem> list;
  SearchHotListItem({
    this.list,
});
  factory SearchHotListItem.fromJson(Map<String, dynamic> json) => _$SearchHotListItemFromJson(json);
}


@JsonSerializable()
class SearchHotItem {

  @JsonKey(fromJson: JsonHelper.convertString,name: 'id')
  String Id;

  String showWord;
  String jumpTypeName;
  String iconUrl;
  String gcm;

  @JsonKey(fromJson: JsonHelper.convertString)
  String source;

  @JsonKey(ignore:true)
  int wordType;//这个字段没用

  @JsonKey(name: 'showStyle')
  int _showStyle;

  @JsonKey(name: 'jumpType')
  int _jumpType;

  SearchHotShowStyle get showStyle {
    switch (_showStyle) {
      case 1:
        return SearchHotShowStyle.SearchItemShowNormal;
      case 2:
        return SearchHotShowStyle.SearchHotShowHightLight;
      case 3:
        return SearchHotShowStyle.SearchHotShowPromot;
    }
  }

  SearchItemJumpType get jumpType {
    switch (_jumpType) {
      case 1:
        return SearchItemJumpType.jumpToSearchResult;
      case 2:
        return SearchItemJumpType.jumpUrl;
    }
  }

  SearchHotItem({
    this.Id,
  });

  factory SearchHotItem.fromJson(Map<String, dynamic> json) => _$SearchHotItemFromJson(json);
}