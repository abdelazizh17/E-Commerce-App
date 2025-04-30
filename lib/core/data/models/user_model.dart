class UserModel {
  final String uid;
  final String? userName;
  final String? email;
  final String? stripeCustomerId;

  UserModel(
     {
    required this.uid,
    required this.userName,
    required this.email,
    this.stripeCustomerId,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'] ?? '',
      userName: data['userName'] ?? '',
      email: data['email'] ?? '',
      stripeCustomerId : data['stripeCustomerId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'userName': userName,
      'email': email,
       'stripeCustomerId': stripeCustomerId,
    };
  }
}
