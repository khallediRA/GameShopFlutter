import 'package:desktop_test/model/game.dart';

class GamesByRate {
  late String _name;

  late List<Rating> _rating;

  List<Rating> get rating => _rating;

  set rating(List<Rating> rating) {
    _rating = rating;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
