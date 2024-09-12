import 'package:flutter/material.dart';

class ArtistSearch extends StatefulWidget {
  const ArtistSearch({super.key});

  @override
  State<ArtistSearch> createState() => _ArtistSearchState();
}


class _ArtistSearchState extends State<ArtistSearch> {
  late SearchController _searchController;
  @override
  void initState() {
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
            hintText: 'Search...',
            hintStyle: const TextStyle(color: Colors.white70),
            prefixIcon: const Icon(Icons.search, color: Colors.white70),
            filled: true,
            fillColor: Colors.white12,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none,
            ),
          ),
          style: const TextStyle(color: Colors.white),
          onSubmitted: (value) {
            // 处理搜索逻辑
            print('Search for: $value');
          },
        );
  }
}