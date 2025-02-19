class UserModel {
  final String uid;
  final String? userName;
  final String? email;

  UserModel({
    required this.uid,
    required this.userName,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'] ?? '',
      userName: data['userName'] ?? '',
      email: data['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'userName': userName,
      'email': email,
    };
  }
}
