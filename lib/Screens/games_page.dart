import 'package:flutter/material.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Scaffold(
        body: Center(
            child: Text("Games Page")),
      ),
    );
  }
}
