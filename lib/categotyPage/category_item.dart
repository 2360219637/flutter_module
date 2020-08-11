import 'package:json_annotation/json_annotation.dart';
import '../tools/json_helper.dart';

part 'category_item.g.dart';

//一级分类
@JsonSerializable()
class CategoryFirstModel{
  List<CategoryFirstItem> list;
  CategoryFirstModel({
    this.list,
  });
  factory CategoryFirstModel.fromJson(Map<String, dynamic> json) => _$CategoryFirstModelFromJson(json);
}

//一级分类
@JsonSerializable()
class CategoryFirstItem{
  String itemName;
  String nextLevelCode;
//  @JsonKey(name: 'id')
  @JsonKey(fromJson: JsonHelper.convertString)
  String id;
  String st;
  String et;
  String gcm;
  CategoryFirstItem({
    this.itemName,
    this.nextLevelCode,
    this.id,
    this.st,
    this.et,
    this.gcm
  });
  factory CategoryFirstItem.fromJson(Map<String, dynamic> json) => _$CategoryFirstItemFromJson(json);
}

//二级分类
@JsonSerializable()
class CategorySecondModel{
  String itemName;
  List<CategoryThirdModel> appThirdItem;
//  @JsonKey(name: 'id')
  @JsonKey(fromJson: JsonHelper.convertString)
  String id;
  String st;
  String et;
  String gcm;
  CategorySecondModel({
    this.itemName,
    this.appThirdItem,
    this.id,
    this.st,
    this.et,
    this.gcm
  });
  factory CategorySecondModel.fromJson(Map<String, dynamic> json) => _$CategorySecondModelFromJson(json);
}

//三级分类
@JsonSerializable()
class CategoryThirdModel{
  String itemName;
  String itemImage;
  double width;
  double height;
  String detailUrl;
//  @JsonKey(name: 'id')
  @JsonKey(fromJson: JsonHelper.convertString)
  String id;
  String st;
  String et;
  String gcm;
  CategoryThirdModel({
    this.itemName,
    this.itemImage,
    this.width,
    this.height,
    this.detailUrl,
    this.id,
    this.st,
    this.et,
    this.gcm
  });
  factory CategoryThirdModel.fromJson(Map<String, dynamic> json) => _$CategoryThirdModelFromJson(json);
}














