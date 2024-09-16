import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voiceradarflutter/components/IconUser.dart';
import 'package:voiceradarflutter/components/wideUserCard.dart';
import 'package:http/http.dart' as http;
import 'package:voiceradarflutter/model/UserModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<UserModel> allUsers;
  bool isLoading = true;

  Future<void> getUsers() async {
    setState(() {
      isLoading = true;
    });
    try {
      var res = await http.get(Uri.parse(
          'https://voiceradar-ergxdlfdwj.cn-shanghai.fcapp.run/v1/getAllUsers'));
      if (res.statusCode == 200) {
        var decodedRes = json.decode(res.body);
        if (decodedRes is List) {
          setState(() {
            allUsers = decodedRes
                .map<UserModel>((item) => UserModel.fromJson(item))
                .toList();
            isLoading = false;
          });
        } else {
          print('Response is not a list');
          setState(() {
            isLoading = false;
          });
        }
      } else {
        print('Failed to load users. Status code: ${res.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching users: $e');
      setState(() {
        isLoading = false;
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
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // 设置状态栏颜色为透明
        statusBarBrightness: Brightness.light, // 根据背景颜色设置状态栏图标亮度
      ),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: const IconUser(),
              ),
            body: SingleChildScrollView(
              child: Column(children: <Widget>[
                // 背景图片
                // 内容
                Container(
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                            child: Center(
                              child: Column(
                                children: allUsers.isEmpty
                                    ? [
                                        const Center(
                                            child: Text('No users found'))
                                      ]
                                    : allUsers
                                        .map((user) => wideUserCard(user: user))
                                        .toList(),
                              ),
                            ),
                          ))
              ]),
            )),
      ),
    );
  }
}
