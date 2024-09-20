
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voiceradarflutter/components/IconUser.dart';
import 'package:voiceradarflutter/components/wideUserCard.dart';
import 'package:voiceradarflutter/model/UserModel.dart';
import 'package:http/http.dart' as http;


class SearchResult extends StatefulWidget {
  final List<UserModel> queryResults;
  const SearchResult({super.key, required this.queryResults});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  bool isLoading = true;

  

  @override
  void initState() {
    super.initState();
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
                                children: widget.queryResults.isEmpty
                                    ? [
                                        const Center(
                                            child: Text('No users found'))
                                      ]
                                    : widget.queryResults
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
