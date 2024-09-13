import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voiceradarflutter/model/UserModel.dart';
import 'package:voiceradarflutter/pages/artistDetail.dart';

class wideUserCard extends StatefulWidget {
  final UserModel user;

  const wideUserCard({super.key, required UserModel this.user});

  @override
  State<wideUserCard> createState() => _wideUserCardState();
}

class _wideUserCardState extends State<wideUserCard> {
  Uint8List? avatarByte;

  void _navigateToDetails(BuildContext context) {
    // 直接使用Navigator.push进行跳转，并传递参数
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => artistDetail(
          user: widget.user,
          avatarByte: avatarByte,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getAvatar();
  }

  void getAvatar() async {
    try {
      var response = await http.get(Uri.parse(
          "https://voiceradarserver.onrender.com/v1/getAvatar?id=${widget.user.id}"));
      if (response.statusCode == 200) {
        // Update the state with the new image data
        setState(() {
          avatarByte = response.bodyBytes;
        });
      } else {
        // Handle the error response
        print('Failed to load avatar: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions
      print('An error occurred while getting the avatar: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
          child: Column(
        children: [
          Column(children: [
            Image.memory(avatarByte!, width: 100, height: 100),
            Text(widget.user.name),
            Text(widget.user.description)
          ]),
        ],
      )),
      onTap: () {
        _navigateToDetails(context);
      },
    );
  }
}
