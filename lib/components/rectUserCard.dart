import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voiceradarflutter/model/UserModel.dart';


class rectUserCard extends StatefulWidget {
  final int id;
  const rectUserCard({super.key, required this.id});

  @override
  State<rectUserCard> createState() => _rectUserCardState();
}

class _rectUserCardState extends State<rectUserCard> {
  late UserModel user;
  late Uint8List avatar;

  Future getUserInfo(int id) async {
    var response = await http.get(Uri.parse("https://voiceradarserver.onrender.com/v1/getAllUsers"));
    user=json.decode(response.body) as UserModel;
    response=await http.get(Uri.parse("https://voiceradarserver.onrender.com/v1/getAvatar?id=${widget.id}"));
    avatar=response.bodyBytes;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.memory(avatar),
          Text(user.name)
        ],
      ),
    );
  }
}
