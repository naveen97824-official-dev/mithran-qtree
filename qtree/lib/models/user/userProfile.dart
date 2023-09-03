import 'package:json_annotation/json_annotation.dart';

part 'userProfile.g.dart';

@JsonSerializable()
class UserProfile {
  String? name;
  String? email;
  String? avatar;

  UserProfile({this.avatar, this.email, this.name});

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  // factory UserProfile.fromJson(json) {
  //   return UserProfile(
  //     name: json['name'],
  //     email: json['email'],
  //     avatar: json['avatar'],
  //   );
  // }
}
