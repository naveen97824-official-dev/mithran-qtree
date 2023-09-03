// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuList _$MenuListFromJson(Map<String, dynamic> json) => MenuList(
      menuItem: (json['menuItem'] as List<dynamic>?)
          ?.map((e) => Menu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuListToJson(MenuList instance) => <String, dynamic>{
      'menuItem': instance.menuItem,
    };

Menu _$MenuFromJson(Map<String, dynamic> json) => Menu(
      avatar: json['avatar'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'avatar': instance.avatar,
      'price': instance.price,
    };
