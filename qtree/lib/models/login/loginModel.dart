class UserLogin {
  String? email;
  String? password;
  bool? isRemember;
  UserLogin({this.email, this.isRemember = false, this.password});

  bool validateLoginButton() {
    if (email != null &&
        email!.isNotEmpty &&
        password != null &&
        password!.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  factory UserLogin.fromJson(json) {
    return UserLogin(
      email: json['email'],
      password: json['password'],
      isRemember: json['isRemember'],
    );
  }

  toJson() => {'email': email, 'password': password, 'isRemember': isRemember};
}
