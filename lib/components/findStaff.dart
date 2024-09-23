import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:voiceradarflutter/components/ArtistSearch.dart';
import 'package:http/http.dart' as http;
import 'package:voiceradarflutter/components/rectArtistCard.dart';
import 'package:voiceradarflutter/pages/ArtistDetail.dart';

class findStaff extends StatefulWidget {
  const findStaff({super.key});

  @override
  State<findStaff> createState() => _findStaffState();
}

class _findStaffState extends State<findStaff> {
  List<dynamic> trendingStaff = [];



  Future getTrendingStaff() async {
    var response = await http.get(Uri.parse(
        "https://voiceradar-ergxdlfdwj.cn-beijing.fcapp.run/v1/getTrendingStaff"));
    setState(() {
      trendingStaff = json.decode(response.body);
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTrendingStaff();
  }




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArtistSearch(queryType: '找STAFF'),
        Text("人气Staff"),
        Wrap(
          children: trendingStaff.map((value) => rectUserCard(id: value)).toList(),
        )
      ],
    );
  }
}
