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
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          tabs: const [Tab(text: "找CV"), Tab(text: "找STAFF")],
          controller: _tabController,
        ),
      ),
      body: TabBarView(controller: _tabController,children: const [findCV(), findStaff()],),
    );
  }
}
