import 'package:json_annotation/json_annotation.dart';
part 'car_vo.g.dart';

@JsonSerializable()
class CarVO {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'model')
  final String model;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'purchase_price')
  final int purchasePrice;
  @JsonKey(name: 'selling_price')
  final int sellingPrice;
  @JsonKey(name: 'category')
  final String category;
  @JsonKey(name: 'year')
  final int year;
  @JsonKey(name: 'description')
  final String description;

  CarVO(
      {required this.id,
      required this.url,
      required this.model,
      required this.name,
      required this.purchasePrice,
      required this.sellingPrice,
      required this.category,
      required this.year,
      required this.description});

  factory CarVO.fromJson(Map<String, dynamic> json) => _$CarVOFromJson(json);

  Map<String, dynamic> toJson() => _$CarVOToJson(this);
}
