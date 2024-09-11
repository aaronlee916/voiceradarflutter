import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:voiceradarflutter/components/UserCard.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int userLength = 0;
  Future getUserLength() async {
    var res = await http
        .get(Uri.parse('https://voiceradarserver.onrender.com/v1/getAllUsers'));
    userLength = json.decode(res.body).length;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLength();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: userLength,
              itemBuilder: (context, index) => UserCard(id: index),
            ),
          )
        ],
      ),
    );
  }
}
