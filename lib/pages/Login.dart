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
                fit: BoxFit.cover),
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
                const TextField(
                  decoration: InputDecoration(hintText: "请输入用户名",),
                ),
                const TextField(
                  decoration: InputDecoration(hintText: "请输入密码"),
                ),
                Row(
                  children: [
                    Container(
                      width: 300,
                      child: CheckboxListTile(
                        value: accepted,
                        onChanged: (bool? value) {
                          setState(() {
                            accepted = !accepted;
                          });
                        },
                        title: const Text(
                          "请阅读并同意隐私协议",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(153, 153, 153, 70)),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    const Text('立即注册',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(156, 123, 248, 100),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
