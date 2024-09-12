import 'package:flutter/material.dart';
import 'package:voiceradarflutter/components/ArtistSearch.dart';

class findCV extends StatefulWidget {
  const findCV({super.key});

  @override
  State<findCV> createState() => _findCVState();
}

class _findCVState extends State<findCV> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ArtistSearch(),
          Text("人气CV")
        ],
      ),
    );
  }
}