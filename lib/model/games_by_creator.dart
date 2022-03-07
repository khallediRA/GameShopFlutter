import 'dart:convert';

import 'package:flutter/foundation.dart';

class ListOfGamesByCreator {
  List<GameByCreator> results;
  ListOfGamesByCreator({
    required this.results,
  });

  ListOfGamesByCreator copyWith({
    List<GameByCreator>? results,
  }) {
    return ListOfGamesByCreator(
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory ListOfGamesByCreator.fromMap(Map<String, dynamic> map) {
    return ListOfGamesByCreator(
      results: List<GameByCreator>.from(
          map['results']?.map((x) => GameByCreator.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListOfGamesByCreator.fromJson(String source) =>
      ListOfGamesByCreator.fromMap(json.decode(source));

  @override
  String toString() => 'ListOfGamesByCreator(results: $results)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListOfGamesByCreator && listEquals(other.results, results);
  }

  @override
  int get hashCode => results.hashCode;
}

class GameByCreator {
  String? name;
  int? games_count;
  GameByCreator({
    this.name,
    this.games_count,
  });

  GameByCreator copyWith({
    String? name,
    int? games_count,
  }) {
    return GameByCreator(
      name: name ?? this.name,
      games_count: games_count ?? this.games_count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'games_count': games_count,
    };
  }

  factory GameByCreator.fromMap(Map<String, dynamic> map) {
    return GameByCreator(
      name: map['name'],
      games_count: map['games_count']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory GameByCreator.fromJson(String source) =>
      GameByCreator.fromMap(json.decode(source));

  @override
  String toString() => 'GameByCreator(name: $name, games_count: $games_count)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameByCreator &&
        other.name == name &&
        other.games_count == games_count;
  }

  @override
  int get hashCode => name.hashCode ^ games_count.hashCode;
}
