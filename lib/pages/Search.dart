import 'package:flutter/material.dart';
import 'package:voiceradarflutter/components/findCV.dart';
import 'package:voiceradarflutter/components/findStaff.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          // Background image
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: <Widget>[
                // TabBar
                Container(
                  color: Colors.transparent, // Optional: You can set a color or make it transparent
                  child: TabBar(
                    tabs: const [
                      Tab(text: "找CV"),
                      Tab(text: "找STAFF"),
                    ],
                    controller: _tabController,
                  ),
                ),
                // TabBarView
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      findCV(),
                      findStaff(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
