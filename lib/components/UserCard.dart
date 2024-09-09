import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Column(
        children: [
          Image.network("")
        ],
      ),
    );
  }
}
