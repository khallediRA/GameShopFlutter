import 'dart:convert';

import 'package:flutter/foundation.dart';

class ListOfGamesByGender {
  List<GamesByGender> results;
  ListOfGamesByGender({
    required this.results,
  });

  ListOfGamesByGender copyWith({
    List<GamesByGender>? results,
  }) {
    return ListOfGamesByGender(
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory ListOfGamesByGender.fromMap(Map<String, dynamic> map) {
    return ListOfGamesByGender(
      results: List<GamesByGender>.from(
          map['results']?.map((x) => GamesByGender.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListOfGamesByGender.fromJson(String source) =>
      ListOfGamesByGender.fromMap(json.decode(source));

  @override
  String toString() => 'ListOfGamesByGender(results: $results)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListOfGamesByGender && listEquals(other.results, results);
  }

  @override
  int get hashCode => results.hashCode;
}

class GamesByGender {
  int? id;
  String? name;
  String? slug;
  int? games_count;
  GamesByGender({
    this.id,
    this.name,
    this.slug,
    this.games_count,
  });

  GamesByGender copyWith({
    int? id,
    String? name,
    String? slug,
    int? games_count,
  }) {
    return GamesByGender(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      games_count: games_count ?? this.games_count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'games_count': games_count,
    };
  }

  factory GamesByGender.fromMap(Map<String, dynamic> map) {
    return GamesByGender(
      id: map['id']?.toInt(),
      name: map['name'],
      slug: map['slug'],
      games_count: map['games_count']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory GamesByGender.fromJson(String source) =>
      GamesByGender.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GamesByGender(id: $id, name: $name, slug: $slug, games_count: $games_count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GamesByGender &&
        other.id == id &&
        other.name == name &&
        other.slug == slug &&
        other.games_count == games_count;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ slug.hashCode ^ games_count.hashCode;
  }
}
