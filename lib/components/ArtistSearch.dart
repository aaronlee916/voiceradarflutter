import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voiceradarflutter/model/ArtistModel.dart';
import 'package:voiceradarflutter/pages/QueryResult.dart';

class ArtistSearch extends StatefulWidget {
  final String queryType;
  const ArtistSearch({super.key, required this.queryType});

  @override
  State<ArtistSearch> createState() => _ArtistSearchState();
}

class _ArtistSearchState extends State<ArtistSearch> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController, // 使用TextEditingController
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
            borderSide: BorderSide.none),
      ),
      style: TextStyle(color: Colors.grey[800]),
      onSubmitted: (value) async {
        // 处理搜索逻辑
        List<ArtistModel> queryResults = [];
        if (widget.queryType == "找CV") {
          var url = Uri.parse(
              'https://voiceradar-ergxdlfdwj.cn-beijing.fcapp.run/v1/searchCV');
          url = url.replace(queryParameters: {'name': value});
          var response = await http.get(url);
          queryResults = json.decode(response.body);
          // 这里应该有逻辑来解析response并填充queryResults
        } else if (widget.queryType == '找STAFF') {
          var url = Uri.parse(
              'https://voiceradar-ergxdlfdwj.cn-beijing.fcapp.run/v1/searchStaff');
          url = url.replace(queryParameters: {'name': value});
          var response = await http.get(url);
          queryResults = json.decode(response.body);
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QueryResult(
              queryResults: queryResults,
            ),
          ),
        );
      },
    );
  }
}
