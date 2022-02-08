import 'package:desktop_test/widgets/game_view_widget.dart';
import 'package:desktop_test/widgets/sort_by_widget.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'package:google_fonts/google_fonts.dart';

class AllGamesScreen extends StatelessWidget {
  const AllGamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _myController = TextEditingController();
    return ScaffoldPage(
      header: PageHeader(
        title: Text(
          "All Games",
          style: GoogleFonts.getFont(
            'Lato',
            letterSpacing: 2,
            fontSize: 20,
          ),
        ),
        commandBar: Row(
          children: [
            SizedBox(
              height: 30,
              width: 300,
              child: TextBox(
                prefix: const Icon(FluentIcons.search),
                controller: _myController,
                placeholder: "Search",
              ),
            ),
            Button(
              child: const Text("Search"),
              onPressed: () {},
            ),
          ],
        ),
      ),
      content: Column(
        children: const [
          SortByWidget(),
          SizedBox(
            height: 20,
          ),
          GameGridView(),
        ],
      ),
    );
  }
}
