import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:voiceradarflutter/model/UserModel.dart';

class artistDetail extends StatefulWidget {
  final dynamic user;
  final Uint8List? avatarByte;
  artistDetail({super.key, required this.user, required this.avatarByte});

  @override
  State<artistDetail> createState() => _artistDetailState();
}

class _artistDetailState extends State<artistDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.memory(widget.avatarByte!,width: 100,height: 100,),
          Text(widget.user['name']),
          Text(widget.user['description']),
        ],
      ),
    );
  }
}
