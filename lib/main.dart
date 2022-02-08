import 'package:desktop_test/screens/All_games_screen.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: "appTitle",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (_) => const MyHomePage()},
      theme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.standard,
        focusTheme: FocusThemeData(
          glowFactor: is10footScreen() ? 2.0 : 0.0,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationView(
        appBar: const NavigationAppBar(
          automaticallyImplyLeading: true,
          leading: Center(
            child: Image(image: ExactAssetImage("assets/logo.png")),
          ),
        ),
        pane: NavigationPane(
          header: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: DefaultTextStyle(
              style: FluentTheme.of(context).typography.title!,
              child: Text(
                'Choices',
                style: GoogleFonts.getFont(
                  'Lato',
                  letterSpacing: 4,
                ),
              ),
            ),
          ),
          items: [
            PaneItem(
              icon: const Icon(FluentIcons.a_t_p_logo),
              title: const Text('Screen 1'),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.text_box),
              title: const Text('Screen 2'),
            ),
          ],
          selected: _currentIndex,
          displayMode: PaneDisplayMode.auto,
          onChanged: (i) {
            setState(() {
              _currentIndex = i;
            });
          },
        ),
        content: NavigationBody(
          index: 0,
          children: const [AllGamesScreen()],
        ));
  }
}
