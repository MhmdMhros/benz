class UserModel {
  final String userName;
  final String password;

  UserModel({
    required this.userName,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'password': password,
    };
  }
}
