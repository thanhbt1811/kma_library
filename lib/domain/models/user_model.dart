class UserModel {
  final String id;
  final String studentIdenitify;
  final String name;
  final String password;
  final String email;
  final String phone;
  final String? avatar;
  final String? passwordHash;
  final bool isLocked;

  UserModel(
      {required this.id,
      required this.studentIdenitify,
      required this.name,
      required this.password,
      required this.email,
      required this.phone,
      required this.avatar,
      this.passwordHash,
      required this.isLocked});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        studentIdenitify: json['studentIdentify'],
        name: json['name'],
        password: json['password'],
        email: json['email'],
        phone: json['numberPhone'],
        avatar: json['thumbnail'],
        passwordHash: json['passwordHash'],
        isLocked: json['isLocked']);
  }
}
