import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:voiceradarflutter/model/UserModel.dart';

class artistDetail extends StatefulWidget {
  final UserModel user;
  final Uint8List? avatarByte;
  const artistDetail({super.key, required this.user, required this.avatarByte});

  @override
  State<artistDetail> createState() => _artistDetailState();
}

class _artistDetailState extends State<artistDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.memory(widget.avatarByte!),
          Text(widget.user.name),
          Text(widget.user.description),
        ],
      ),
    );
  }
}
