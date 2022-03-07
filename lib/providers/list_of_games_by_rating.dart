import 'package:desktop_test/model/top_rated_games.dart';

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
}
