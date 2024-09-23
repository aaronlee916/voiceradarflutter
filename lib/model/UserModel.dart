class UserModel {
  final int id;
  final String name;
  final String nickname;
  final String phoneNumber;
  final String email;
  final String avatarLink;
  final String sex;
  final String description;
  UserModel(
      {required this.nickname,
      required this.email,
      required this.avatarLink,
      required this.id,
      required this.name,
      required this.phoneNumber,
      required this.sex,
      required this.description});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      sex: json['sex'],
      description: json['description'],
      avatarLink: json['avatar'],
      nickname: json['nickname']
    );
  }
}
