import 'dart:convert';
import 'dart:io';
import 'package:architecture_app/models/character.dart';
import 'package:http/http.dart' as http;
import '../models/response_model.dart';

Future<List<CharacterModel>?> getCharacters() async {
  String url = "https://rickandmortyapi.com/api/character/";
  try {
    final res = await http.get(Uri.parse(url));
    final List<dynamic> charactersJson =
        jsonDecode(res.body)["results"]; //Texto de la respuesta
    // Retorna un casteo obligado
    final charactersList =
        charactersJson.map((e) => CharacterModel.fromJson(e)).toList();
    print(charactersList);
    return charactersList;
  } catch (e) {
    print(e);
  }
}

Future<Character?> getCharacter() async {
  String url = "https://rickandmortyapi.com/api/character/1";
  try {
    final res = await http.get(Uri.parse(url));
    final characterJson = jsonDecode(res.body);
    final character = Character.fromDoc(characterJson); //

    return character;
  } catch (e) {
    print(e);
  }
}
