// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DetaillPage extends StatefulWidget {
  final v1, v2, v3, v4;

  DetaillPage(this.v1, this.v2, this.v3, this.v4);

  @override
  _DetaillPageState createState() => _DetaillPageState();
}

class _DetaillPageState extends State<DetaillPage> {
  var _v1, _v2, _v3, _v4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WWII"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              _v1,
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: "lamoon"),
            ),
            SizedBox(height: 10),
            Text(
              _v2,
              style: TextStyle(
                  fontFamily: "duck", fontSize: 20, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Image.network(_v3),
            SizedBox(height: 10),
            Text(
              _v4,
              style: TextStyle(fontFamily: "lamoon", fontSize: 26),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
