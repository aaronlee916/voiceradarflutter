import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ArtistSearch extends StatefulWidget {
  final String queryType;
  const ArtistSearch({super.key, required this.queryType});

  @override
  State<ArtistSearch> createState() => _ArtistSearchState();
}

class _ArtistSearchState extends State<ArtistSearch> {
  late SearchController _searchController;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _searchController = SearchController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none, // 移除边框
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(69.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(69.0),
          borderSide: BorderSide.none
        ),
      ),
      style: TextStyle(color: Colors.grey[800]),
      onSubmitted: (value) async {
        // 处理搜索逻辑
        if(widget.queryType=="找CV"){
          await http.get(Uri.parse('https://voiceradar-ergxdlfdwj.cn-shanghai.fcapp.run/v1/searchCV'));
        }
        else if(widget.queryType=='找STAFF'){
          await http.get(Uri.parse('https://voiceradar-ergxdlfdwj.cn-shanghai.fcapp.run/v1/searchStaff'));
        }
      },
    );
  }
}
