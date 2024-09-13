import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voiceradarflutter/components/wideUserCard.dart';
import 'package:http/http.dart' as http;
import 'package:voiceradarflutter/model/UserModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> allUsers = []; // 确保列表只包含UserModel类型的对象
  Future<void> getUsers() async {
    try {
      var res = await http.get(
          Uri.parse('https://voiceradarserver.onrender.com/v1/getAllUsers'));
      if (res.statusCode == 200) {
        var decodedRes = json.decode(res.body);
        if (decodedRes is List) {
          setState(() {
            // 将每个元素从Map转换为UserModel对象
            allUsers = decodedRes
                .map<UserModel>((item) => UserModel.fromJson(item))
                .toList();
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          ...allUsers.map((user) => wideUserCard(user: user)).toList()
        ]),
      ),
      backgroundColor: Color.fromRGBO(250, 253, 255, 100),
    );
  }
}
