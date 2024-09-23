import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:voiceradarflutter/components/ArtistSearch.dart';
import 'package:http/http.dart' as http;
import 'package:voiceradarflutter/components/rectArtistCard.dart';

class findCV extends StatefulWidget {
  const findCV({super.key});

  @override
  State<findCV> createState() => _findCVState();
}

class _findCVState extends State<findCV> {
  List<dynamic> trendingCV = [];



  Future getTrendingCV() async {
    var response = await http.get(Uri.parse(
        "https://voiceradar-ergxdlfdwj.cn-shanghai.fcapp.run/v1/getTrendingCV"));
    setState(() {
      trendingCV = json.decode(response.body);
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTrendingCV();
  }




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArtistSearch(queryType: '找CV'),
        Text("人气CV"),
        Wrap(
          children: trendingCV.map((value) => rectUserCard(id: value)).toList(),
        )
      ],
    );
  }
}
