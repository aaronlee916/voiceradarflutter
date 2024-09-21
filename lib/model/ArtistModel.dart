class ArtistModel {
  final int id;
  final String name;
  final String phoneNumber;
  final String weiboLink;
  final String qq;
  final String email;
  final String avatarLink;
  final int linkedUserId;
  final bool isCV;
  final bool isStaff;
  final String sex;
  final String voiceType;
  final String soundPressure;
  final String demoLink;
  final String description;
  final List<String> genre;
  final List<String> functionType;
  ArtistModel(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.weiboLink,
      required this.qq,
      required this.email,
      required this.avatarLink,
      required this.linkedUserId,
      required this.isCV,
      required this.isStaff,
      required this.sex,
      required this.voiceType,
      required this.soundPressure,
      required this.demoLink,
      required this.description,
      required this.genre,
      required this.functionType});
  factory ArtistModel.fromJson(Map<String, dynamic> json) {
    return ArtistModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      weiboLink: json['weiboLink'],
      qq: json['qq'],
      email: json['email'],
      avatarLink: json['avatarLink'],
      linkedUserId: json['linkedUserId'],
      isCV: json['isCV'] ?? false,
      isStaff: json['isStaff'] ?? false,
      sex: json['sex'],
      voiceType: json['voiceType'],
      soundPressure: json['soundPressure'],
      demoLink: json['demoLink'],
      description: json['description'],
      genre: (json['genre'] as List<dynamic>)
          .map<String>((e) => e.toString())
          .toList(),
      functionType: (json['functionType'] as List<dynamic>)
          .map<String>((e) => e.toString())
          .toList(),
    );
  }
}
