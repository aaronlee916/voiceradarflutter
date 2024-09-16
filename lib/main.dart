import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voiceradarflutter/pages/HomePage.dart';
import 'package:voiceradarflutter/pages/My.dart';
import 'package:voiceradarflutter/pages/Search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(153, 121, 247, 75)),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: "你好"));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  void _onItemTapped(int index) {
    setState(() {
      currTab = index;
    });
    _pageController.jumpToPage(index);
  }

  final List<Widget> _pages = [
    const HomePage(),
    const Search(),
    const My(),
  ];
  int currTab = 0;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light), child: 
    Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/background.png'),fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currTab = index;
            });
          },
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currTab,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: '搜索'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的')
            ]),
      ),
    ));
  }
}
