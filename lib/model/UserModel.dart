class UserModel {
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
  UserModel(
      this.id,
      this.name,
      this.phoneNumber,
      this.weiboLink,
      this.qq,
      this.email,
      this.avatarLink,
      this.linkedUserId,
      this.isCV,
      this.isStaff,
      this.sex,
      this.voiceType,
      this.soundPressure,
      this.demoLink,
      this.description,
      this.genre,
      this.functionType);
}
