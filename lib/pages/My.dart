import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voiceradarflutter/pages/Settings.dart';

class My extends StatefulWidget {
  const My({super.key});

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("个人中心"),
            centerTitle: true,
            actions: [
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
              }, child: const Text("设置"))
            ],
          ),
        ));
  }
}
