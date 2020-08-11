// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchHistoryListItem _$SearchHistoryListItemFromJson(
    Map<String, dynamic> json) {
  return SearchHistoryListItem(
    list: (json['list'] as List)
        ?.map((e) => e == null
            ? null
            : SearchHistoryItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SearchHistoryListItemToJson(
        SearchHistoryListItem instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

SearchHistoryItem _$SearchHistoryItemFromJson(Map<String, dynamic> json) {
  return SearchHistoryItem(
    showWord: json['showWord'] as String,
  )
    ..jumpTypeName = json['jumpTypeName'] as String
    ..searchWordType = JsonHelper.convertString(json['searchWordType']);
}

Map<String, dynamic> _$SearchHistoryItemToJson(SearchHistoryItem instance) =>
    <String, dynamic>{
      'showWord': instance.showWord,
      'jumpTypeName': instance.jumpTypeName,
      'searchWordType': instance.searchWordType,
    };

SearchHotListItem _$SearchHotListItemFromJson(Map<String, dynamic> json) {
  return SearchHotListItem(
    list: (json['list'] as List)
        ?.map((e) => e == null
            ? null
            : SearchHotItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SearchHotListItemToJson(SearchHotListItem instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

SearchHotItem _$SearchHotItemFromJson(Map<String, dynamic> json) {
  return SearchHotItem(
    Id: JsonHelper.convertString(json['id']),
  )
    ..showWord = json['showWord'] as String
    ..jumpTypeName = json['jumpTypeName'] as String
    ..iconUrl = json['iconUrl'] as String
    ..gcm = json['gcm'] as String
    ..source = JsonHelper.convertString(json['source']);
}

Map<String, dynamic> _$SearchHotItemToJson(SearchHotItem instance) =>
    <String, dynamic>{
      'id': instance.Id,
      'showWord': instance.showWord,
      'jumpTypeName': instance.jumpTypeName,
      'iconUrl': instance.iconUrl,
      'gcm': instance.gcm,
      'source': instance.source,
    };
