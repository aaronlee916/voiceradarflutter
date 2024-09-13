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
          Positioned(
            left: -2.75 * 0.75, // rem到逻辑像素的转换，假设1rem = 0.75 logical pixels
            right: 15.69 * 0.75,
            top: -3.19 * 0.75,
            bottom: 43.44 * 0.75,
            child: Container(
              width: 10.5 * 0.75, // rem到逻辑像素的转换
              height: 10.5 * 0.75,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(2, 132, 255, 0.12), // 转换rgba颜色
                // Flutter没有直接的filter属性，但是我们可以使用BackdropFilter来实现模糊效果
                backgroundBlendMode: BlendMode.srcOver,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 6.11 * 0.75,
                    sigmaY: 6.11 * 0.75), // rem到逻辑像素的转换，并且模糊效果应用于x和y方向
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50)
                  ),
                ),
              ),
            ),
          ),
          ...allUsers.map((user) => wideUserCard(user: user)).toList()
        ]),
      ),
      backgroundColor: Color.fromRGBO(250, 253, 255, 100),
    );
  }
}
