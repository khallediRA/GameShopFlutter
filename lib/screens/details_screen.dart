import 'package:desktop_test/model/games_by_creator.dart';
import 'package:desktop_test/model/games_by_gender.dart';
import 'package:desktop_test/model/top_rated_games.dart';
import 'package:desktop_test/providers/list_of_games_by_rating.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class TopRatedScreen extends StatefulWidget {
  const TopRatedScreen({Key? key}) : super(key: key);

  @override
  _TopRatedScreenState createState() => _TopRatedScreenState();
}

class _TopRatedScreenState extends State<TopRatedScreen> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  final gamesByRateService = ListOfGamesByRatingService();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ScaffoldPage(
        content: FutureBuilder(
            future: Future.wait([
              gamesByRateService.getAllGamesByRate(),
              gamesByRateService.getAllGamesByGender(),
              gamesByRateService.getAllGamesByCreator(),
            ]),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData) {
                List<GamesByRate> listOfGames = snapshot.data![0];
                List<GamesByGender> gamesByGender = snapshot.data![1];
                List<GameByCreator> gamesByCreator = snapshot.data![2];
                return Column(
                  children: [
                    //Initialize the chart widget

                    Container(
                      height: screenHeight / 2,
                      child: SfCartesianChart(
                        plotAreaBorderColor: Colors.yellow,
                        title: ChartTitle(text: 'Games By Rate Analysis'),
                        legend: Legend(isVisible: true),
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <ChartSeries>[
                          BarSeries<GamesByRate, String>(
                              color: Color(0xFFB0B803),
                              name: 'Rating',
                              dataSource: listOfGames,
                              sortingOrder: SortingOrder.ascending,
                              sortFieldValueMapper: (GamesByRate game, _) {
                                int sum = 0;
                                game.rating.forEach((element) {
                                  sum = sum + element.count!;
                                });
                                return sum;
                              },
                              xValueMapper: (GamesByRate game, _) => game.name,
                              yValueMapper: (GamesByRate game, _) {
                                int sum = 0;
                                game.rating.forEach((element) {
                                  sum = sum + element.count!;
                                });
                                return sum;
                              },
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true),
                              enableTooltip: true),
                        ],
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis: NumericAxis(
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            title: AxisTitle(text: 'Sales in millions')),
                      ),
                    ),

                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: screenWidth / 2,
                            child: SfCircularChart(
                              palette: const [
                                Color(0xFFa6b59e),
                                Color(0xFFcdcd8e),
                                Color(0xFF8eb056),
                                Color(0xFF5a6914),
                                Color(0xFF556137),
                                Color(0xFF7c9461),
                                Color(0xFFffef00),
                                Color(0xFFccbf00),
                                Color(0xFF666000),
                                Color(0xFFccbf00),
                              ],
                              title:
                                  ChartTitle(text: 'Games By Gender Analysis'),
                              legend: Legend(isVisible: true),
                              tooltipBehavior: TooltipBehavior(enable: true),
                              series: <PieSeries>[
                                PieSeries<GamesByGender, String>(
                                    name: 'Rating',
                                    dataSource: gamesByGender,
                                    sortingOrder: SortingOrder.ascending,
                                    sortFieldValueMapper:
                                        (GamesByGender game, _) {},
                                    xValueMapper: (GamesByGender game, _) =>
                                        game.name,
                                    yValueMapper: (GamesByGender game, _) =>
                                        game.games_count,
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true),
                                    enableTooltip: true),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SfCartesianChart(
                              isTransposed: true,
                              plotAreaBorderColor: Colors.yellow,
                              title:
                                  ChartTitle(text: 'Games By Creator Analysis'),
                              legend: Legend(isVisible: true),
                              tooltipBehavior: TooltipBehavior(enable: true),
                              series: <ChartSeries>[
                                BarSeries<GameByCreator, String>(
                                    color: Color(0xFFB0B803),
                                    name: 'Rating',
                                    dataSource: gamesByCreator,
                                    xValueMapper: (GameByCreator game, _) =>
                                        game.name,
                                    yValueMapper: (GameByCreator game, _) =>
                                        game.games_count,
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true),
                                    enableTooltip: true),
                              ],
                              primaryXAxis: CategoryAxis(),
                              primaryYAxis: NumericAxis(
                                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                                  title: AxisTitle(text: 'Sales in millions')),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: ProgressBar(
                    backgroundColor: Colors.transparent,
                  ),
                );
              }
            }));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
