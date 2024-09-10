import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserCard extends StatefulWidget {
  final int id;

  const UserCard({super.key, required this.id});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  Uint8List? _imageBytes;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchAvatar(widget.id);
  }

  Future<void> _fetchAvatar(int id) async {
    try {
      final response = await http.get(Uri.parse("https://voiceradarserver.onrender.com/v1/getAvatar?id=$id"));
      if (response.statusCode == 200) {
        setState(() {
          _imageBytes = response.bodyBytes;
          _isLoading = false;
        });
      } else {
        setState(() {
          _hasError = true;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (_hasError) {
      return Center(child: Text('Failed to load avatar'));
    } else if (_imageBytes != null) {
      return Center(
        child: Column(
          children: [
            Image.memory(_imageBytes!),
          ],
        ),
      );
    } else {
      return Center(child: Text('No avatar available'));
    }
  }
}