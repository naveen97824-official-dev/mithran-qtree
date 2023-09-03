import 'package:json_annotation/json_annotation.dart';
part 'menu.g.dart';

@JsonSerializable()
class MenuList {
  List<Menu>? menuItem;
  MenuList({this.menuItem});
  factory MenuList.fromJson(Map<String, dynamic> json) =>
      _$MenuListFromJson(json);
  Map<String, dynamic> toJson() => _$MenuListToJson(this);
}

@JsonSerializable()
class Menu {
  String? title;
  String? description;
  String? avatar;
  double? price;
  Menu({this.avatar, this.description, this.price, this.title});

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  Map<String, dynamic> toJson() => _$MenuToJson(this);
}
