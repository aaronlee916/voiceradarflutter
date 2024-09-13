import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:voiceradarflutter/components/ArtistSearch.dart';
import 'package:http/http.dart' as http;
import 'package:voiceradarflutter/components/rectUserCard.dart';

class findCV extends StatefulWidget {
  const findCV({super.key});

  @override
  State<findCV> createState() => _findCVState();
}

class _findCVState extends State<findCV> {
  List<int> trendingCV = [];

  Future getTrendingCV() async {
    var response = await http.get(
        Uri.parse("https://voiceradarserver.onrender.com/v1/getTrendingCV"));
    setState(() {
      trendingCV = json.decode(response.body) as List<int>;
    });
    print(trendingCV);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTrendingCV();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ArtistSearch(),
          Text("人气CV"),
          Wrap(
            children:
                trendingCV.map((value) => rectUserCard(id: value)).toList(),
          )
        ],
      ),
    );
  }
}
