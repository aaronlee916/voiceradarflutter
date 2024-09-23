import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voiceradarflutter/model/ArtistModel.dart';
import 'package:voiceradarflutter/pages/ArtistDetail.dart';

class rectUserCard extends StatefulWidget {
  final int id;
  const rectUserCard({super.key, required this.id});

  @override
  State<rectUserCard> createState() => _rectUserCardState();
}

class _rectUserCardState extends State<rectUserCard> {
  dynamic user = ArtistModel(
      id: 0,
      name: 'name',
      phoneNumber: 'phoneNumber',
      weiboLink: 'weiboLink',
      qq: 'qq',
      email: 'email',
      avatarLink: 'avatarLink',
      isCV: true,
      isStaff: true,
      sex: 'sex',
      voiceType: 'voiceType',
      soundPressure: 'soundPressure',
      demoLink: 'demoLink',
      description: 'description',
      genre: ['genre'],
      functionType: ['functionType']);
  Uint8List? avatar;

  void _navigateToDetails(BuildContext context) {
    // 直接使用Navigator.push进行跳转，并传递参数
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => artistDetail(
          artist: user,
          avatarByte: avatar,
        ),
      ),
    );
  }

  Future getUserInfo(int id) async {
    var response = await http.get(Uri.parse(
        "https://voiceradar-ergxdlfdwj.cn-shanghai.fcapp.run/v1/getUser?id=$id"));
    user == null
        ? user = ArtistModel(
            id: 0,
            name: 'name',
            phoneNumber: 'phoneNumber',
            email: 'email',
            avatarLink: 'avatarLink',
            isCV: true,
            isStaff: true,
            sex: 'sex',
            voiceType: 'voiceType',
            soundPressure: 'soundPressure',
            demoLink: 'demoLink',
            description: 'description',
            genre: ['genre'],
            functionType: ['functionType'], weiboLink: 'weiboLink', qq: 'qq')
        : setState(() {
            user = json.decode(response.body);
          });
    response = await http.get(Uri.parse(
        "https://voiceradar-ergxdlfdwj.cn-shanghai.fcapp.run/v1/getAvatar?id=$id"));
    setState(() {
      avatar = response.bodyBytes;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 122,
        margin: EdgeInsets.all(6),
        child: Column(
          children: [
            avatar == null
                ? SizedBox(
                    child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    child: Image.asset(
                      'lib/assets/images/placeholder.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ))
                : SizedBox(
                    child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    child: Image.memory(
                      avatar!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  )),
            Text(
              user['name'],
              style: const TextStyle(fontFamily: 'PingFang SC', fontSize: 12),
            )
          ],
        ),
      ),
      onTap: () => _navigateToDetails(context),
    );
  }
}
