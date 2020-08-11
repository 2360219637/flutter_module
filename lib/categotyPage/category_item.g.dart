// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryFirstModel _$CategoryFirstModelFromJson(Map<String, dynamic> json) {
  return CategoryFirstModel(
    list: (json['list'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryFirstItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoryFirstModelToJson(CategoryFirstModel instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

CategoryFirstItem _$CategoryFirstItemFromJson(Map<String, dynamic> json) {
  return CategoryFirstItem(
    itemName: json['itemName'] as String,
    nextLevelCode: json['nextLevelCode'] as String,
    id: JsonHelper.convertString(json['id']),
    st: json['st'] as String,
    et: json['et'] as String,
    gcm: json['gcm'] as String,
  );
}

Map<String, dynamic> _$CategoryFirstItemToJson(CategoryFirstItem instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'nextLevelCode': instance.nextLevelCode,
      'id': instance.id,
      'st': instance.st,
      'et': instance.et,
      'gcm': instance.gcm,
    };

CategorySecondModel _$CategorySecondModelFromJson(Map<String, dynamic> json) {
  return CategorySecondModel(
    itemName: json['itemName'] as String,
    appThirdItem: (json['appThirdItem'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryThirdModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: JsonHelper.convertString(json['id']),
    st: json['st'] as String,
    et: json['et'] as String,
    gcm: json['gcm'] as String,
  );
}

Map<String, dynamic> _$CategorySecondModelToJson(
        CategorySecondModel instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'appThirdItem': instance.appThirdItem,
      'id': instance.id,
      'st': instance.st,
      'et': instance.et,
      'gcm': instance.gcm,
    };

CategoryThirdModel _$CategoryThirdModelFromJson(Map<String, dynamic> json) {
  return CategoryThirdModel(
    itemName: json['itemName'] as String,
    itemImage: json['itemImage'] as String,
    width: (json['width'] as num)?.toDouble(),
    height: (json['height'] as num)?.toDouble(),
    detailUrl: json['detailUrl'] as String,
    id: JsonHelper.convertString(json['id']),
    st: json['st'] as String,
    et: json['et'] as String,
    gcm: json['gcm'] as String,
  );
}

Map<String, dynamic> _$CategoryThirdModelToJson(CategoryThirdModel instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'itemImage': instance.itemImage,
      'width': instance.width,
      'height': instance.height,
      'detailUrl': instance.detailUrl,
      'id': instance.id,
      'st': instance.st,
      'et': instance.et,
      'gcm': instance.gcm,
    };
