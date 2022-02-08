import 'dart:async';

import 'package:desktop_test/model/game.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GameCard extends StatefulWidget {
  final Game game;
  const GameCard({Key? key, required this.game}) : super(key: key);

  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  bool? isHovered;
  Timer? _timer;
  int? _pos;
  @override
  void initState() {
    _pos = 0;
    isHovered = false;
    super.initState();
  }

  void startTime() {
    _timer = Timer.periodic(const Duration(milliseconds: 1500), (Timer t) {
      setState(() {
        _pos = (_pos! + 1) % widget.game.short_screenshots!.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> listOfavailablePlateforms = [
      "android",
      "commodore-amiga",
      "ios",
      "linux",
      "mac",
      "nintendo",
      "pc",
      "playstation",
      "sega",
      "web",
      "xbox"
    ];
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: ((event) {
        setState(() {
          isHovered = true;
        });
        startTime();
      }),
      onExit: ((event) {
        setState(() {
          _timer!.cancel();
          _pos = 0;
          isHovered = false;
        });
      }),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: ThemeData.dark().scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                  offset:
                      isHovered! ? const Offset(10, 11) : const Offset(6, 7),
                  blurRadius: 10,
                  color: Colors.yellow)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: isHovered! && widget.game.short_screenshots!.isNotEmpty
                    ? Image.network(
                        widget.game.short_screenshots![_pos!].image!,
                        gaplessPlayback: true,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: ProgressRing(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      )
                    : Image.network(
                        widget.game.background_image!,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: ProgressRing(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.game.name!,
                      style: GoogleFonts.getFont("Josefin Sans",
                          fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (widget.game.platforms!.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Available On :",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ...widget.game.parent_platforms!.map((e) {
                            if (listOfavailablePlateforms
                                .contains(e.platform!.slug!)) {
                              return Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/platforms/${e.platform!.slug!}.svg",
                                      height: 25,
                                      width: 20),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          }),
                        ],
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
