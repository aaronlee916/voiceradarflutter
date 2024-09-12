import 'package:flutter/material.dart';
import 'package:voiceradarflutter/components/ArtistSearch.dart';

class findStaff extends StatefulWidget {
  const findStaff({super.key});

  @override
  State<findStaff> createState() => _findStaffState();
}

class _findStaffState extends State<findStaff> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ArtistSearch(),
          Text("人气STAFF")
          
        ],
      ),
      
    );
  }
}