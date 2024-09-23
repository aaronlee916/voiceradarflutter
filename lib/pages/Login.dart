import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool accepted = false;

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
                  child: const TextField(
                    decoration: InputDecoration(
                        hintText: "请输入用户名", suffix: Icon(Icons.person)),
                  ),
                ),
              ),
              Container(
                width: 275,
                child: Padding(
                  padding: const EdgeInsets.only(top: 28, left: 21),
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
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
                                  child: Text(
                                    "立即注册",
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(156, 123, 248, 100)),
                                  ),
                                  onPressed: () {
                                    //登录回调函数
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 100, left: 20),
                        child: IconButton(
                            onPressed: () {},
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
