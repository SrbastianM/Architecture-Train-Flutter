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
    final responseCharacter = getCharacter();
    if (responseCharacter == null) {
      return;
    }

    setState(
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
