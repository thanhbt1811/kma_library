class LoginModel {
  final String fullName;
  final String token;

  LoginModel({required this.fullName, required this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      fullName: json['fullName'] ?? '',
      token: json['token'] ?? '',
    );
  }
}
