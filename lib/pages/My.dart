import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voiceradarflutter/components/wideArtistCard.dart';
import 'package:voiceradarflutter/model/ArtistModel.dart';
import 'package:voiceradarflutter/pages/Settings.dart';
import 'package:http/http.dart' as http;


class My extends StatefulWidget {
  const My({super.key});

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {

  late String username;
  late String password;
  late ArtistModel artist;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRelatedArtist();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/background.png'),
              fit: BoxFit.cover)),
      child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: Colors.transparent),
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: const Text("个人中心"),
                centerTitle: true,
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Settings()));
                      },
                      child: const Text("设置"))
                ],
              ),
              body: const Column(
                children: [
                  wideArtistCard(artist: artist)
                  ,Padding(
                    padding: EdgeInsets.only(left: 15,),
                    child: Text("相关声优/STAFF"),
                  ),
                ],
              ))),
    );
  }
  
  void getRelatedArtist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> user = prefs.get('user') as List<String>;
    String token = await prefs.get('token') as String;
    username=user[0];
    password=user[1];
    artist=await http.get('')
  }
}
