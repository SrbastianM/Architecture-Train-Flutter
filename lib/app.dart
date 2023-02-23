import 'dart:convert';

import 'package:architecture_app/models/response_model.dart';
import 'package:architecture_app/repository/api-conection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String test = "Hello world";
  String url = "https://rickandmortyapi.com/api/character/";
  List<CharacterModel> characters = [];

  @override // es una mala practica llamar asincronas dentro del init state
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    // Si get caracters retorna un null use el valor de la derecha
    var charactersResponse = await getCharacters() ?? [];

    setState(() {
      characters = charactersResponse;
    });
    print(characters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: characters.length,
        itemBuilder: (BuildContext context, int index) {
          final userComment = Container(
            margin: const EdgeInsets.only(top: 10.0, left: 20.0),
            child: Text(
              characters[index].origin.name,
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
              characters[index].name,
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
                image: NetworkImage(characters[index].image),
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
