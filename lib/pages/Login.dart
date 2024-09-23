import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voiceradarflutter/pages/HomePage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool accepted = false;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String capturedUsername = "";
  String capturedPassword = "";

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 21, top: 158),
                child: Text(
                  "中抓雷达",
                  style: TextStyle(fontFamily: "PingFang SC", fontSize: 36),
                ),
              ),
              Container(
                width: 275,
                child: Padding(
                  padding: const EdgeInsets.only(top: 28, left: 21),
                  child: TextField(
                    controller: _userNameController,
                    decoration: const InputDecoration(
                        hintText: "请输入用户名", suffix: Icon(Icons.person)),
                  ),
                ),
              ),
              Container(
                width: 275,
                child: Padding(
                  padding: const EdgeInsets.only(top: 28, left: 21),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "请输入密码", suffix: Icon(Icons.visibility_off)),
                  ),
                ),
              ),
              Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 21),
                        child: Row(
                          children: [
                            Checkbox(
                              value: accepted,
                              onChanged: (bool? value) {
                                setState(() {
                                  accepted = !accepted;
                                });
                              },
                            ),
                            const Text(
                              "请阅读并同意隐私协议",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(153, 153, 153, 70),
                                letterSpacing: 0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextButton(
                                  child: const Text(
                                    "立即注册",
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(156, 123, 248, 100)),
                                  ),
                                  onPressed: () {
                                    //注册回调函数
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 110, left: 0),
                        child: IconButton(
                            onPressed: () async {
                              if (accepted) {
                                setState(() {
                                  capturedUsername = _userNameController.text;
                                  capturedPassword = _passwordController.text;
                                });
                                var res = await http.get(Uri.parse('https://voiceradar-ergxdlfdwj.cn-beijing.fcapp.run/v1/login').replace(queryParameters: {
                                  'name':capturedUsername,
                                  'password':capturedPassword
                                }));
                                String? token = res.body;
                                if(res.statusCode==200 ){
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('token', token);
                                  prefs.setStringList('user', [capturedUsername,capturedPassword]);
                                  Fluttertoast.showToast(msg:"登陆成功！");
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                                }
                                else{
                                  Fluttertoast.showToast(msg: "用户名或密码错误！");
                                }
                                
                              }
                              else{
                                Fluttertoast.showToast(msg: "请阅读并同意用户协议！");
                              }
                            },
                            icon: Image(
                                image: AssetImage(
                                    'lib/assets/images/loginButton.png'))),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
