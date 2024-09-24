import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voiceradarflutter/model/ArtistModel.dart';

class artistDetail extends StatefulWidget {
  final ArtistModel artist;
  final Uint8List? avatarByte;
  artistDetail({super.key, required this.artist, required this.avatarByte});

  @override
  State<artistDetail> createState() => _artistDetailState();
}

class _artistDetailState extends State<artistDetail> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ),
      child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/images/background.png'),
                fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: BackButton(
                onPressed: () {
                  Navigator.pop(context); // 实现返回功能
                },
              ),
              backgroundColor: Colors.transparent,
            ),
            body: Column(
              children: [
                Image.memory(
                  widget.avatarByte!,
                  width: MediaQuery.of(context).size.width,
                  height: 255,
                  fit: BoxFit.cover,
                ),
                Column(children: [
                  Text(
                    widget.artist.name + '\\' + widget.artist.voiceType,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "PingFang SC",
                    ),
                  ),
                  Text(
                    widget.artist.artistDescription,
                    style: const TextStyle(
                        fontSize: 12,
                        fontFamily: "PingFang SC",
                        color: Color.fromRGBO(153, 153, 153, 70),
                        fontWeight: FontWeight.w400),
                  )
                ]),
                const Text(
                  "声线展示",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "PingFang SC",
                      fontWeight: FontWeight.w400),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    width: 345,
                    height: 59,
                    color: Color.fromRGBO(156, 123, 248, 70),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
