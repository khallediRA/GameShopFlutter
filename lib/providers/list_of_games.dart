import 'package:desktop_test/model/game.dart';
import 'package:desktop_test/model/params/param.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ListOfGamesService {
  Future<List<Game>> getAllGames() async {
    Map<String, String> headers = {
      "x-rapidapi-key": xrapidapikey,
      "x-rapidapi-host": xrapidapiHost,
    };
    Map<String, String> queryparam = {"key": paramKey};
    var uri = Uri.https(
        'rawg-video-games-database.p.rapidapi.com', '/games', queryparam);
    final res = await http.get(uri, headers: headers);
    final response = ListOfGames.fromJson(res.body);
    return response.results;
  }
}
