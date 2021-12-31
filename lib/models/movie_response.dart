class MovieResponse {
  List<Movie>? listMovie;
  String? query;
  int? v;

  MovieResponse({
    this.listMovie,
    this.query,
    this.v,
  });

  MovieResponse.fromJson(Map<String, dynamic> json) {
    listMovie = (json['d'] as List?)
        ?.map((dynamic e) => Movie.fromJson(e as Map<String, dynamic>))
        .toList();
    query = json['q'] as String?;
    v = json['v'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['d'] = listMovie?.map((e) => e.toJson()).toList();
    json['q'] = query;
    json['v'] = v;
    return json;
  }
}

class Movie {
  ImageMovie? imageMovie;
  String? id;
  String? title;
  String? q;
  int? rank;
  String? s;
  List<Series>? listSeries;
  int? vt;
  int? year;
  String? years;

  Movie({
    this.imageMovie,
    this.id,
    this.title,
    this.q,
    this.rank,
    this.s,
    this.listSeries,
    this.vt,
    this.year,
    this.years,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    imageMovie = (json['i'] as Map<String, dynamic>?) != null
        ? ImageMovie.fromJson(json['i'] as Map<String, dynamic>)
        : null;
    id = json['id'] as String?;
    title = json['l'] as String?;
    q = json['q'] as String?;
    rank = json['rank'] as int?;
    s = json['s'] as String?;
    listSeries = (json['v'] as List?)
        ?.map((dynamic e) => Series.fromJson(e as Map<String, dynamic>))
        .toList();
    vt = json['vt'] as int?;
    year = json['y'] as int?;
    years = json['yr'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['i'] = imageMovie?.toJson();
    json['id'] = id;
    json['l'] = title;
    json['q'] = q;
    json['rank'] = rank;
    json['s'] = s;
    json['v'] = listSeries?.map((e) => e.toJson()).toList();
    json['vt'] = vt;
    json['y'] = year;
    json['yr'] = years;
    return json;
  }
}

class ImageMovie {
  int? height;
  String? imageUrl;
  int? width;

  ImageMovie({
    this.height,
    this.imageUrl,
    this.width,
  });

  ImageMovie.fromJson(Map<String, dynamic> json) {
    height = json['height'] as int?;
    imageUrl = json['imageUrl'] as String?;
    width = json['width'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['imageUrl'] = imageUrl;
    json['width'] = width;
    return json;
  }
}

class Series {
  ImageMovie? imageMovie;
  String? id;
  String? title;
  String? s;

  Series({
    this.imageMovie,
    this.id,
    this.title,
    this.s,
  });

  Series.fromJson(Map<String, dynamic> json) {
    imageMovie = (json['i'] as Map<String, dynamic>?) != null
        ? ImageMovie.fromJson(json['i'] as Map<String, dynamic>)
        : null;
    id = json['id'] as String?;
    title = json['l'] as String?;
    s = json['s'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['i'] = imageMovie?.toJson();
    json['id'] = id;
    json['l'] = title;
    json['s'] = s;
    return json;
  }
}
