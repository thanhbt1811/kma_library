class LoginRequest {
  final String studentId;
  final String password;

  LoginRequest({
    required this.studentId,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {'studentIdentify': studentId, 'password': password};
  }
}
