
class Genre {
  final String id;
  final String genre;

  Genre({required this.id, required this.genre});
  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      genre: json['genre'],
    );
  }
}

class FunctionType {
  final String id;
  final String functionType;

  FunctionType({required this.id, required this.functionType});
  factory FunctionType.fromJson(Map<String, dynamic> json) {
    return FunctionType(
      id: json['id'],
      functionType: json['functionType'],
    );
  }
}



class ArtistModel {
  final int id;
  final String name;
  final String weiboLink;
  final String qq;
  final String email;
  final String avatarLink;
  final bool isCV;
  final bool isStaff;
  final String sex;
  final String voiceType;
  final String soundPressure;
  final String demoLink;
  final String artistDescription;
  final List<Object> genre;
  final List<Object> functionType;
  ArtistModel(
      {required this.id,
      required this.name,
      required this.weiboLink,
      required this.qq,
      required this.email,
      required this.avatarLink,
      required this.isCV,
      required this.isStaff,
      required this.sex,
      required this.voiceType,
      required this.soundPressure,
      required this.demoLink,
      required this.artistDescription,
      required this.genre,
      required this.functionType});
  factory ArtistModel.fromJson(Map<String, dynamic> json) {
    return ArtistModel(
      id: json['id'],
      name: json['name'],
      weiboLink: json['weiboLink'],
      qq: json['qq'],
      email: json['email'],
      avatarLink: json['avatarLink'],
      isCV: json['isCV'] ?? false,
      isStaff: json['isStaff'] ?? false,
      sex: json['sex'],
      voiceType: json['voiceType'],
      soundPressure: json['soundPressure'],
      demoLink: json['demoLink'],
      artistDescription: json['artistDescription'],
      genre: (json['genre'] as List<dynamic>? ?? [])
          .map<Genre>((genreJson) => Genre.fromJson(genreJson))
          .toList(),
      functionType: (json['functionType'] as List<dynamic>? ?? [])
          .map<FunctionType>(
              (functionTypeJson) => FunctionType.fromJson(functionTypeJson))
          .toList(),
    );
  }
}
