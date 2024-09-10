import 'package:flutter/material.dart';
import 'package:voiceradarflutter/components/UserCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          UserCard(id: 0)
        ],
      ),
    );
  }
}