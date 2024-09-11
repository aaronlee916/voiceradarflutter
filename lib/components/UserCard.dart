import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserCard extends StatefulWidget {
  final dynamic id;

  const UserCard({super.key, required this.id});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  Uint8List? avatarByte;

  @override
  void initState() {
    super.initState();
    getAvatar();
  }

  void getAvatar() async {
    try {
      var response = await http.get(Uri.parse("https://voiceradarserver.onrender.com/v1/getAvatar?id=${widget.id}"));
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
    return Center(
      child: Column(
        children: [
          Image.memory(avatarByte!,
          width: 100,
          height: 100,
          )
        ],
      )
    );
  }
}
