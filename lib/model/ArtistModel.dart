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
  final String id;
  final String name;
  final String weiboLink;
  final String qq;
  final String email;
  final bool isCV;
  final bool isStaff;
  final String sex;
  final String voiceType;
  final String soundPressure;
  final String demoLink;
  final String artistDescription;
  final List<String> genre;
  final List<String> functionType;

  ArtistModel({
    required this.id,
    required this.name,
    required this.weiboLink,
    required this.qq,
    required this.email,
    required this.isCV,
    required this.isStaff,
    required this.sex,
    required this.voiceType,
    required this.soundPressure,
    required this.demoLink,
    required this.artistDescription,
    required this.genre,
    required this.functionType,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) {
    return ArtistModel(
      id: json['id'] as String,
      name: json['name'] as String,
      weiboLink: json['weiboLink'] as String,
      qq: json['qq'] as String,
      email: json['email'] as String,
      isCV: json['isCV'] ?? false,
      isStaff: json['isStaff'] ?? false,
      sex: json['sex'] as String,
      voiceType: json['voiceType'] as String,
      soundPressure: json['soundPressure'] as String,
      demoLink: json['demoLink'] as String,
      artistDescription: json['artistDescription'] as String,
      genre: (json['genre'] as List<dynamic>)
          .map((genreJson) => Genre.fromJson(genreJson).genre)
          .toList(),
      functionType: (json['functionType'] as List<dynamic>)
          .map((functionTypeJson) => FunctionType.fromJson(functionTypeJson).functionType)
          .toList(),
    );
  }
}
