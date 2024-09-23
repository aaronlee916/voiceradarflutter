import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voiceradarflutter/model/ArtistModel.dart';
import 'package:voiceradarflutter/pages/ArtistDetail.dart';

class wideArtistCard extends StatefulWidget {
  final ArtistModel artist;

  const wideArtistCard({super.key, required ArtistModel this.artist});

  @override
  State<wideArtistCard> createState() => _wideArtistCardState();
}

class _wideArtistCardState extends State<wideArtistCard> {
  File imageFile = new File('../assets/images/placeholder.png');
  Uint8List? avatarByte;

  void _navigateToDetails(BuildContext context) {
    // 直接使用Navigator.push进行跳转，并传递参数
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => artistDetail(
          artist: widget.artist,
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
          "https://voiceradar-ergxdlfdwj.cn-beijing.fcapp.run/v1/getAvatar?id=${widget.artist.id}"));
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
    return SingleChildScrollView(
      child: GestureDetector(
        child: Container(
          width: 345,
          height: 290,
          margin: EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                offset: Offset(0, 4), color: Color.fromARGB(25, 221, 221, 208))
          ]),
          child: Column(
            children: [
              SizedBox(
                width: 345,
                height: 141,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: avatarByte == null
                      ? SizedBox(
                          child: Image.asset(
                          'lib/assets/images/placeholder.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ))
                      : SizedBox(
                          child: Image.memory(
                            avatarByte!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              SizedBox(
                  child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                child: Container(
                  color: Colors.white,
                  height: 149,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 265, 0),
                        width: 70,
                        child: Text(
                          widget.artist.name,
                          style: const TextStyle(
                              fontFamily: 'PingFang SC', fontSize: 16 * 0.88),
                        ),
                      ),
                      SizedBox(
                        width: 325,
                        child: Text(
                          widget.artist.artistDescription,
                          style: const TextStyle(
                              fontFamily: 'PingFang SC',
                              fontSize: 16 * 0.75,
                              color: Color.fromRGBO(153, 153, 153, 100)),
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
        onTap: () {
          _navigateToDetails(context);
        },
      ),
    );
  }
}
