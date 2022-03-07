import 'package:desktop_test/model/games_by_creator.dart';
import 'package:desktop_test/model/games_by_gender.dart';
import 'package:desktop_test/model/params/param.dart';
import 'package:desktop_test/model/top_rated_games.dart';
import 'package:http/http.dart' as http;
import '../model/game.dart';
import 'list_of_games.dart';

class ListOfGamesByRatingService {
  Future<List<GamesByRate>> getAllGamesByRate() async {
    final gamesService = ListOfGamesService();
    List<Game> games = await gamesService.getAllGames();
    List<GamesByRate> gamesByRate = [];
    games.forEach((element) {
      GamesByRate gameByRate = new GamesByRate();
      gameByRate.name = element.name!;
      gameByRate.rating = element.ratings!;
      gamesByRate.add(gameByRate);
    });
    return gamesByRate;
  }

  Future<List<GamesByGender>> getAllGamesByGender() async {
    Map<String, String> headers = {
      "x-rapidapi-key": xrapidapikey,
      "x-rapidapi-host": xrapidapiHost,
    };
    Map<String, String> queryparam = {"key": paramKey};
    var uri = Uri.https(
        'rawg-video-games-database.p.rapidapi.com', '/genres', queryparam);
    final res = await http.get(uri, headers: headers);
    final response = ListOfGamesByGender.fromJson(res.body);
    return response.results;
  }

  Future<List<GameByCreator>> getAllGamesByCreator() async {
    Map<String, String> headers = {
      "x-rapidapi-key": xrapidapikey,
      "x-rapidapi-host": xrapidapiHost,
    };
    Map<String, String> queryparam = {"key": paramKey};
    var uri = Uri.https(
        'rawg-video-games-database.p.rapidapi.com', '/creators', queryparam);
    final res = await http.get(uri, headers: headers);
    final response = ListOfGamesByCreator.fromJson(res.body);
    return response.results;
  }
}
