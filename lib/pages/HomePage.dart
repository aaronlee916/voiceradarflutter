import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voiceradarflutter/components/IconUser.dart';
import 'package:voiceradarflutter/components/wideArtistCard.dart';
import 'package:http/http.dart' as http;
import 'package:voiceradarflutter/model/ArtistModel.dart';
import 'package:voiceradarflutter/pages/GeneralRegister.dart';
import 'package:voiceradarflutter/pages/Login.dart';
import 'package:voiceradarflutter/pages/QueryResult.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ArtistModel> allUsers = [];
  bool isLoading = true;
  String? token;

  Future<void> getLoginState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //currUser[0]是用户名 currUser[1]是密码
    final List<String>? currUser = prefs.getStringList('user');
    token = prefs.getString('token');
    if (token == null || !await checkTokenValidity(token)) {
      AlertDialog(title: Text("登陆状态失效，请重新登录！"));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    } else {
      var res = await http.get(Uri.parse(
              "https://voiceradar-ergxdlfdwj.cn-beijing.fcapp.run/v1/login")
          .replace(queryParameters: {
        'name': currUser![0],
        'password': currUser[1]
      }));
      token = res.body;
    }
  }

  Future<bool> checkTokenValidity(String? token) async {
    var res = await http.get(
        Uri.parse(
            'https://voiceradar-ergxdlfdwj.cn-shanghai.fcapp.run/v1/getAllArtists'),
        headers: {HttpHeaders.authorizationHeader: 'Bearer ${token!}'});
    if (res.statusCode != 200) {
      return false;
    }
    return true;
  }

  Future<void> bootWork() async {
    await getLoginState();
    await getArtists();
  }

  Future<void> getArtists() async {
    setState(() {
      isLoading = true;
    });
    try {
      var res = await http.get(
          Uri.parse(
              'https://voiceradar-ergxdlfdwj.cn-shanghai.fcapp.run/v1/getAllArtists'),
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${token!}'});
      
      if (res.statusCode == 200) {
        var decodedRes = json.decode(res.body);
        if (decodedRes is List) {
          setState(() {
            allUsers = decodedRes
                .map<ArtistModel>((item) => ArtistModel.fromJson(item))
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
        print('Failed to load artists. Status code: ${res.statusCode}');
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
    bootWork();
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
                                        .map((artist) =>
                                            wideArtistCard(artist: artist))
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
