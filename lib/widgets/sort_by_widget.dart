import 'package:fluent_ui/fluent_ui.dart';

class SortByWidget extends StatefulWidget {
  const SortByWidget({Key? key}) : super(key: key);

  @override
  _SortByWidgetState createState() => _SortByWidgetState();
}

class _SortByWidgetState extends State<SortByWidget> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text("Sort By"),
      PillButtonBar(
          selected: index,
          onChanged: (i) => {
                setState(() {
                  index = i;
                })
              },
          items: const [
            PillButtonBarItem(text: Text('All')),
            PillButtonBarItem(text: Text('Mail')),
            PillButtonBarItem(text: Text('Peopl')),
            PillButtonBarItem(text: Text('Events')),
          ]),
    ]);
  }
}
