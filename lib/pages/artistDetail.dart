import 'dart:typed_data';

import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            BackButton(
              onPressed: () {},
            ),
            Image.memory(
              widget.avatarByte!,
              width: 100,
              height: 100,
            ),
            Text(widget.user.name),
            Text(widget.user.description),
          ],
        ),
      ),
    );
  }
}
