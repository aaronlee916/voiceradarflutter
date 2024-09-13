import 'dart:convert';

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
  List<UserModel> allUsers = [];
  bool isLoading = true; // 新增一个标志位来表示是否正在加载数据

  Future<void> getUsers() async {
    setState(() {
      isLoading = true; // 开始加载数据
    });
    try {
      var res = await http.get(
          Uri.parse('https://voiceradar-ergxdlfdwj.cn-shanghai.fcapp.run/v1/getAllUsers'));
      if (res.statusCode == 200) {
        var decodedRes = json.decode(res.body);
        if (decodedRes is List) {
          setState(() {
            allUsers = decodedRes
                .map<UserModel>((item) => UserModel.fromJson(item))
                .toList();
            isLoading = false; // 数据加载完成
          });
        } else {
          print('Response is not a list');
          setState(() {
            isLoading = false; // 加载失败，但不再显示加载状态
          });
        }
      } else {
        print('Failed to load users. Status code: ${res.statusCode}');
        setState(() {
          isLoading = false; // 加载失败，但不再显示加载状态
        });
      }
    } catch (e) {
      print('Error fetching users: $e');
      setState(() {
        isLoading = false; // 加载失败，但不再显示加载状态
      });
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) // 显示加载指示器
          : SingleChildScrollView(
              child: Column(
                children: allUsers.isEmpty
                    ? [const Center(child: Text('No users found'))] // 如果没有用户，显示消息
                    : allUsers.map((user) => wideUserCard(user: user)).toList(),
              ),
            ),
      backgroundColor: const Color.fromRGBO(250, 253, 255, 100),
    );
  }
}
