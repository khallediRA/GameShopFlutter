import 'dart:convert';

import 'package:flutter/foundation.dart';

class ListOfGames {
  List<Game> results;
  ListOfGames({
    required this.results,
  });

  ListOfGames copyWith({
    List<Game>? results,
  }) {
    return ListOfGames(
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory ListOfGames.fromMap(Map<String, dynamic> map) {
    return ListOfGames(
      results: List<Game>.from(map['results']?.map((x) => Game.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListOfGames.fromJson(String source) =>
      ListOfGames.fromMap(json.decode(source));

  @override
  String toString() => 'ListOfGames(results: $results)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListOfGames && listEquals(other.results, results);
  }

  @override
  int get hashCode => results.hashCode;
}

class Game {
  String? background_image;
  String? name;
  String? released;
  String? metacritic_url;
  String? website;
  String? description;
  int? metacritic;
  List<Genre>? genres;
  List<Platforms>? platforms;
  List<ParentPlatForm>? parent_platforms;

  List<Publishers>? publishers;
  List<Rating>? ratings;
  List<Screenshots>? screenshots;
  List<Trailer>? trailers;
  List<ShortScreenshots>? short_screenshots;
  Game({
    this.background_image,
    this.name,
    this.released,
    this.metacritic_url,
    this.website,
    this.description,
    this.metacritic,
    this.genres,
    this.platforms,
    this.parent_platforms,
    this.publishers,
    this.ratings,
    this.screenshots,
    this.trailers,
    this.short_screenshots,
  });

  Game copyWith({
    String? background_image,
    String? name,
    String? released,
    String? metacritic_url,
    String? website,
    String? description,
    int? metacritic,
    List<Genre>? genres,
    List<Platforms>? platforms,
    List<ParentPlatForm>? parent_platforms,
    List<Publishers>? publishers,
    List<Rating>? ratings,
    List<Screenshots>? screenshots,
    List<Trailer>? trailers,
    List<ShortScreenshots>? short_screenshots,
  }) {
    return Game(
      background_image: background_image ?? this.background_image,
      name: name ?? this.name,
      released: released ?? this.released,
      metacritic_url: metacritic_url ?? this.metacritic_url,
      website: website ?? this.website,
      description: description ?? this.description,
      metacritic: metacritic ?? this.metacritic,
      genres: genres ?? this.genres,
      platforms: platforms ?? this.platforms,
      parent_platforms: parent_platforms ?? this.parent_platforms,
      publishers: publishers ?? this.publishers,
      ratings: ratings ?? this.ratings,
      screenshots: screenshots ?? this.screenshots,
      trailers: trailers ?? this.trailers,
      short_screenshots: short_screenshots ?? this.short_screenshots,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'background_image': background_image,
      'name': name,
      'released': released,
      'metacritic_url': metacritic_url,
      'website': website,
      'description': description,
      'metacritic': metacritic,
      'genres': genres?.map((x) => x?.toMap())?.toList(),
      'platforms': platforms?.map((x) => x?.toMap())?.toList(),
      'parent_platforms': parent_platforms?.map((x) => x?.toMap())?.toList(),
      'publishers': publishers?.map((x) => x?.toMap())?.toList(),
      'ratings': ratings?.map((x) => x?.toMap())?.toList(),
      'screenshots': screenshots?.map((x) => x?.toMap())?.toList(),
      'trailers': trailers?.map((x) => x?.toMap())?.toList(),
      'short_screenshots': short_screenshots?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      background_image: map['background_image'],
      name: map['name'],
      released: map['released'],
      metacritic_url: map['metacritic_url'],
      website: map['website'],
      description: map['description'],
      metacritic: map['metacritic']?.toInt(),
      genres: map['genres'] != null
          ? List<Genre>.from(map['genres']?.map((x) => Genre.fromMap(x)))
          : null,
      platforms: map['platforms'] != null
          ? List<Platforms>.from(
              map['platforms']?.map((x) => Platforms.fromMap(x)))
          : null,
      parent_platforms: map['parent_platforms'] != null
          ? List<ParentPlatForm>.from(
              map['parent_platforms']?.map((x) => ParentPlatForm.fromMap(x)))
          : null,
      publishers: map['publishers'] != null
          ? List<Publishers>.from(
              map['publishers']?.map((x) => Publishers.fromMap(x)))
          : null,
      ratings: map['ratings'] != null
          ? List<Rating>.from(map['ratings']?.map((x) => Rating.fromMap(x)))
          : null,
      screenshots: map['screenshots'] != null
          ? List<Screenshots>.from(
              map['screenshots']?.map((x) => Screenshots.fromMap(x)))
          : null,
      trailers: map['trailers'] != null
          ? List<Trailer>.from(map['trailers']?.map((x) => Trailer.fromMap(x)))
          : null,
      short_screenshots: map['short_screenshots'] != null
          ? List<ShortScreenshots>.from(
              map['short_screenshots']?.map((x) => ShortScreenshots.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Game.fromJson(String source) => Game.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Game(background_image: $background_image, name: $name, released: $released, metacritic_url: $metacritic_url, website: $website, description: $description, metacritic: $metacritic, genres: $genres, platforms: $platforms, parent_platforms: $parent_platforms, publishers: $publishers, ratings: $ratings, screenshots: $screenshots, trailers: $trailers, short_screenshots: $short_screenshots)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Game &&
        other.background_image == background_image &&
        other.name == name &&
        other.released == released &&
        other.metacritic_url == metacritic_url &&
        other.website == website &&
        other.description == description &&
        other.metacritic == metacritic &&
        listEquals(other.genres, genres) &&
        listEquals(other.platforms, platforms) &&
        listEquals(other.parent_platforms, parent_platforms) &&
        listEquals(other.publishers, publishers) &&
        listEquals(other.ratings, ratings) &&
        listEquals(other.screenshots, screenshots) &&
        listEquals(other.trailers, trailers) &&
        listEquals(other.short_screenshots, short_screenshots);
  }

  @override
  int get hashCode {
    return background_image.hashCode ^
        name.hashCode ^
        released.hashCode ^
        metacritic_url.hashCode ^
        website.hashCode ^
        description.hashCode ^
        metacritic.hashCode ^
        genres.hashCode ^
        platforms.hashCode ^
        parent_platforms.hashCode ^
        publishers.hashCode ^
        ratings.hashCode ^
        screenshots.hashCode ^
        trailers.hashCode ^
        short_screenshots.hashCode;
  }
}

class ShortScreenshots {
  int? id;
  String? image;
  ShortScreenshots({
    this.id,
    this.image,
  });

  ShortScreenshots copyWith({
    int? id,
    String? image,
  }) {
    return ShortScreenshots(
      id: id ?? this.id,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
    };
  }

  factory ShortScreenshots.fromMap(Map<String, dynamic> map) {
    return ShortScreenshots(
      id: map['id']?.toInt(),
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ShortScreenshots.fromJson(String source) =>
      ShortScreenshots.fromMap(json.decode(source));

  @override
  String toString() => 'ShortScreenshots(id: $id, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShortScreenshots && other.id == id && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ image.hashCode;
}

class Platforms {
  Platform? platform;
  Platforms({
    this.platform,
  });

  Platforms copyWith({
    Platform? platform,
  }) {
    return Platforms(
      platform: platform ?? this.platform,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'platform': platform?.toMap(),
    };
  }

  factory Platforms.fromMap(Map<String, dynamic> map) {
    return Platforms(
      platform:
          map['platform'] != null ? Platform.fromMap(map['platform']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Platforms.fromJson(String source) =>
      Platforms.fromMap(json.decode(source));

  @override
  String toString() => 'Platforms(platform: $platform)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Platforms && other.platform == platform;
  }

  @override
  int get hashCode => platform.hashCode;
}

class Platform {
  String? name;
  String? slug;
  Platform({
    this.name,
    this.slug,
  });

  Platform copyWith({
    String? name,
    String? slug,
  }) {
    return Platform(
      name: name ?? this.name,
      slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'slug': slug,
    };
  }

  factory Platform.fromMap(Map<String, dynamic> map) {
    return Platform(
      name: map['name'],
      slug: map['slug'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Platform.fromJson(String source) =>
      Platform.fromMap(json.decode(source));

  @override
  String toString() => 'Platform(name: $name, slug: $slug)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Platform && other.name == name && other.slug == slug;
  }

  @override
  int get hashCode => name.hashCode ^ slug.hashCode;
}

class ParentPlatForm {
  Platform? platform;
  ParentPlatForm({
    this.platform,
  });

  ParentPlatForm copyWith({
    Platform? platform,
  }) {
    return ParentPlatForm(
      platform: platform ?? this.platform,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'platform': platform?.toMap(),
    };
  }

  factory ParentPlatForm.fromMap(Map<String, dynamic> map) {
    return ParentPlatForm(
      platform:
          map['platform'] != null ? Platform.fromMap(map['platform']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParentPlatForm.fromJson(String source) =>
      ParentPlatForm.fromMap(json.decode(source));

  @override
  String toString() => 'ParentPlatForm(platform: $platform)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ParentPlatForm && other.platform == platform;
  }

  @override
  int get hashCode => platform.hashCode;
}

class Trailer {
  Data? data;
  Trailer({
    this.data,
  });

  Trailer copyWith({
    Data? data,
  }) {
    return Trailer(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data?.toMap(),
    };
  }

  factory Trailer.fromMap(Map<String, dynamic> map) {
    return Trailer(
      data: map['data'] != null ? Data.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Trailer.fromJson(String source) =>
      Trailer.fromMap(json.decode(source));

  @override
  String toString() => 'Trailer(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Trailer && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class Data {
  String? max;
  Data({
    this.max,
  });

  Data copyWith({
    String? max,
  }) {
    return Data(
      max: max ?? this.max,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'max': max,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      max: map['max'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() => 'Data(max: $max)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data && other.max == max;
  }

  @override
  int get hashCode => max.hashCode;
}

class Screenshots {
  String? image;
  Screenshots({
    this.image,
  });

  Screenshots copyWith({
    String? image,
  }) {
    return Screenshots(
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
    };
  }

  factory Screenshots.fromMap(Map<String, dynamic> map) {
    return Screenshots(
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Screenshots.fromJson(String source) =>
      Screenshots.fromMap(json.decode(source));

  @override
  String toString() => 'Screenshots(image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Screenshots && other.image == image;
  }

  @override
  int get hashCode => image.hashCode;
}

class Rating {
  int? id;
  int? count;
  String? title;
  Rating({
    this.id,
    this.count,
    this.title,
  });

  Rating copyWith({
    int? id,
    int? count,
    String? title,
  }) {
    return Rating(
      id: id ?? this.id,
      count: count ?? this.count,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'count': count,
      'title': title,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      id: map['id']?.toInt(),
      count: map['count']?.toInt(),
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source));

  @override
  String toString() => 'Rating(id: $id, count: $count, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Rating &&
        other.id == id &&
        other.count == count &&
        other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ count.hashCode ^ title.hashCode;
}

class Publishers {
  String? name;
  Publishers({
    this.name,
  });

  Publishers copyWith({
    String? name,
  }) {
    return Publishers(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Publishers.fromMap(Map<String, dynamic> map) {
    return Publishers(
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Publishers.fromJson(String source) =>
      Publishers.fromMap(json.decode(source));

  @override
  String toString() => 'Publishers(name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Publishers && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class Genre {
  String? name;
  Genre({
    this.name,
  });

  Genre copyWith({
    String? name,
  }) {
    return Genre(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Genre.fromMap(Map<String, dynamic> map) {
    return Genre(
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Genre.fromJson(String source) => Genre.fromMap(json.decode(source));

  @override
  String toString() => 'Genre(name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Genre && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
