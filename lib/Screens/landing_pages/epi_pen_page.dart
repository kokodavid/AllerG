import 'package:flutter/material.dart';

class EpiPenPage extends StatefulWidget {
  const EpiPenPage({Key? key}) : super(key: key);

  @override
  _EpiPenPageState createState() => _EpiPenPageState();
}

class _EpiPenPageState extends State<EpiPenPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
            child: Text("EpiPen Page")),
      ),
    );
  }
}
