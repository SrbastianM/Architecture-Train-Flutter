import 'package:architecture_app/models/character.dart';
import 'package:architecture_app/repository/api-conection.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppTest extends StatefulWidget {
  const AppTest({super.key});

  @override
  State<AppTest> createState() => _AppTestState();
}

class _AppTestState extends State<AppTest> {
  List<Character> character = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var responseCharacter = await getCharacter() ?? [];
    if (responseCharacter == null) {
      return;
    }

    setState(
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: character.length,
        itemBuilder: (BuildContext context, int index) {
          final userComment = Container(
            margin: const EdgeInsets.only(top: 10.0, left: 20.0),
            child: Text(
              character[index].id.toString(),
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 13.0,
                fontFamily: "Lato",
                fontWeight: FontWeight.w900,
              ),
            ),
          );
          final userName = Container(
            margin: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Text(
              character[index].name,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 18.0, fontFamily: "Lato"),
            ),
          );

          final photo = Container(
            margin: const EdgeInsets.only(
              top: 20.0,
              left: 20.0,
            ),
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(character[index].image),
              ),
            ),
          );

          final userInformation = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [userName, userComment],
          );
          return Row(children: [photo, userInformation]);
        },
      ),
    );
  }
}
