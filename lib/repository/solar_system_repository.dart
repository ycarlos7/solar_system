import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../cubit/solar_system_state.dart';
import '../model/solar_system_model.dart';

abstract class SolarSystemRepository {
  Future<SolarSystemModel> getPlanets(String id);
}

class SolarSystemRepositoryImplementation implements SolarSystemRepository {
  late final BuildContext context;

  SolarSystemRepositoryImplementation(this.context);
  @override
  Future<SolarSystemModel> getPlanets(String id) async {
    var client = http.Client();
    String url = "https://api-solar-system.herokuapp.com/planet/$id";

    var response = await client.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return SolarSystemModel.fromJson(jsonResponse);
    } else {
      throw SolarSystemError("Erro");
    }
  }
}
