import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart';

class GeneralRegister extends StatefulWidget {
  const GeneralRegister({super.key});

  @override
  State<GeneralRegister> createState() => _GeneralRegisterState();
}

class _GeneralRegisterState extends State<GeneralRegister> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
        ),
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => {Navigator.pop(context)},
                  icon: const Icon(Icons.arrow_back)),
              title: const Text("创建个人资料"),
            ),
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "手机号",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "PingFang SC",
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 345,
                  height: 39,
                  child: const TextField(
                    decoration: InputDecoration(hintText: "请输入手机号"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "邮箱",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "PingFang SC",
                      ),
                    ),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(hintText: "请输入邮箱"),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "密码",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "PingFang SC",
                      ),
                    ),
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "请输入密码"),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "确认密码",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "PingFang SC",
                      ),
                    ),
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "请输入密码"),
                ),
                // const Radio(value: 0, groupValue: 0, onChanged: ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("下一步"),
                  style: ButtonStyle(
                      ),
                )
              ],
            )));
  }
}
