class UserModel {
  final String id;
  final String email;
  final String role;
  final String token;

  UserModel({
    required this.id,
    required this.email,
    required this.role,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      role: json['role'],
      token: json['token'],
    );
  }
}
