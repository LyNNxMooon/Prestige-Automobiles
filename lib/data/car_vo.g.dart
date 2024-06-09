// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarVO _$CarVOFromJson(Map<String, dynamic> json) => CarVO(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String,
      model: json['model'] as String,
      name: json['name'] as String,
      purchasePrice: (json['purchase_price'] as num).toInt(),
      sellingPrice: (json['selling_price'] as num).toInt(),
      category: json['category'] as String,
      year: (json['year'] as num).toInt(),
    );

Map<String, dynamic> _$CarVOToJson(CarVO instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'model': instance.model,
      'name': instance.name,
      'purchase_price': instance.purchasePrice,
      'selling_price': instance.sellingPrice,
      'category': instance.category,
      'year': instance.year,
    };
