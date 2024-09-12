import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:voiceradarflutter/components/UserCard.dart';
import 'package:http/http.dart' as http;
import 'package:voiceradarflutter/model/UserModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> allUsers = []; // Use dynamic or define a User model class

  Future<void> getUsers() async {
    try {
      var res = await http.get(Uri.parse('https://voiceradarserver.onrender.com/v1/getAllUsers'));
      if (res.statusCode == 200) {
        var decodedRes = json.decode(res.body);
        if (decodedRes is List) {
          setState(() {
            allUsers = decodedRes; // Assuming the JSON is a list of user objects
          });
        } else {
          print('Response is not a list');
        }
      } else {
        print('Failed to load users. Status code: ${res.statusCode}');
      }
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: allUsers.map((item) => UserCard(user: item as UserModel)).toList(),
      ),
    );
  }
}
