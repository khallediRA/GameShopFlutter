import 'package:desktop_test/model/game.dart';
import 'package:desktop_test/widgets/game_card.dart';
import 'package:desktop_test/widgets/shimmer_builder.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:shimmer/shimmer.dart';

import '../providers/list_of_games.dart';

class GameGridView extends StatefulWidget {
  const GameGridView({Key? key}) : super(key: key);

  @override
  _GameGridViewState createState() => _GameGridViewState();
}

class _GameGridViewState extends State<GameGridView> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final gameService = ListOfGamesService();
    double screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder(
        future: gameService.getAllGames(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Game> listOfGames = snapshot.data;
            return Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                controller: _controller,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth <= 900 ? 1 : 3,
                  crossAxisSpacing: screenWidth <= 900 ? 60 : 60,
                  mainAxisSpacing: 30,
                ),
                itemCount: listOfGames.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GameCard(
                      game: listOfGames[index],
                    ),
                  );
                },
              ),
            ));
          } else {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  controller: _controller,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenWidth <= 900 ? 1 : 3,
                    crossAxisSpacing: screenWidth <= 900 ? 60 : 60,
                    mainAxisSpacing: 30,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ShimmerBuilder();
                  },
                ),
              ),
            );
          }
        });
  }
}
