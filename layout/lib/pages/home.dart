// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail), label: "Contact"),
        ],
      ),
      appBar: AppBar(
        title: Text("WWII"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(5),
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              //var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return MyBox(
                        snapshot.data[index]['title'],
                        snapshot.data[index]['subtitle'],
                        snapshot.data[index]['img'],
                        snapshot.data[index]['detail']);
                  },
                  itemCount: snapshot.data.length);
            },
            future: getData(),
            //future:DefaultAssetBundle.of(context).loadString('assets/data.json'),
          )),
    );
  }

  Widget MyBox(String title, String subtitle, String img, String detail) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = img;
    v4 = detail;
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(10),
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(img),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.45), BlendMode.darken)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 2),
          Text(subtitle, style: TextStyle(fontSize: 16, color: Colors.white)),
          TextButton(
              onPressed: () {
                print("Next page");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetaillPage(v1, v2, v3, v4)));
              },
              child: Text(
                "???????????????????????????????????????....",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  Future getData() async {
    // https://raw.githubusercontent.com/Thanakit-Ake/BasicAPI/main/data.json
    var url = Uri.https(
        'raw.githubusercontent.com', '/Thanakit-Ake/BasicAPI/main/data.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    return result;
  }
}
