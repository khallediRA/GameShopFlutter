import 'package:desktop_test/model/top_rated_games.dart';
import 'package:desktop_test/providers/list_of_games_by_rating.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:collection/collection.dart';

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
    return ScaffoldPage(
        content: FutureBuilder(
            future: gamesByRateService.getAllGamesByRate(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<GamesByRate> listOfGames = snapshot.data;
                return Column(
                  children: [
                    //Initialize the chart widget
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title: ChartTitle(text: 'Half yearly sales analysis'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<GamesByRate, String>>[
                        LineSeries<GamesByRate, String>(
                            dataSource: listOfGames,
                            xValueMapper: (GamesByRate gameByRate, _) =>
                                gameByRate.name,
                            yValueMapper: (GamesByRate gameByRate, _) {
                              int sum = 0;
                              gameByRate.rating.forEach((element) {
                                sum = sum + element.count!;
                              });

                              return sum;
                            },
                            name: 'Sales',
                            // Enable data label
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true))
                      ],
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
