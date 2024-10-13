class UserModel {
  UserModel({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
  });

  UserModel.fromJson(dynamic json) {
    adult = json['adult'];
    alsoKnownAs = json['also_known_as'] != null ? json['also_known_as'].cast<String>() : [];
    biography = json['biography'];
    birthday = json['birthday'];
    deathday = json['deathday'];
    gender = json['gender']; // Consider changing this to int if appropriate
    homepage = json['homepage'];
    id = json['id']; // Consider changing this to int
    imdbId = json['imdb_id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    placeOfBirth = json['place_of_birth'];
    popularity = json['popularity']; // Consider changing this to double or int based on use case
    profilePath = json['profile_path'];
  }

  bool? adult;
  List<String>? alsoKnownAs;
  String? biography;
  String? birthday;
  String? deathday;
  int? gender; // Consider changing this to int
  String? homepage;
  int? id; // Consider changing this to int
  String? imdbId;
  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  double? popularity; // Consider changing this to double for fractional values
  String? profilePath;

  UserModel copyWith({
    bool? adult,
    List<String>? alsoKnownAs,
    String? biography,
    String? birthday,
    String? deathday,
    int? gender, // Consider changing this to int
    String? homepage,
    int? id, // Consider changing this to int
    String? imdbId,
    String? knownForDepartment,
    String? name,
    String? placeOfBirth,
    double? popularity, // Consider changing this to double for fractional values
    String? profilePath,
  }) => UserModel(
    adult: adult ?? this.adult,
    alsoKnownAs: alsoKnownAs ?? this.alsoKnownAs,
    biography: biography ?? this.biography,
    birthday: birthday ?? this.birthday,
    deathday: deathday ?? this.deathday,
    gender: gender ?? this.gender, // Consider changing this to int
    homepage: homepage ?? this.homepage,
    id: id ?? this.id, // Consider changing this to int
    imdbId: imdbId ?? this.imdbId,
    knownForDepartment: knownForDepartment ?? this.knownForDepartment,
    name: name ?? this.name,
    placeOfBirth: placeOfBirth ?? this.placeOfBirth,
    popularity: popularity ?? this.popularity, // Consider changing this to double
    profilePath: profilePath ?? this.profilePath,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['also_known_as'] = alsoKnownAs;
    map['biography'] = biography;
    map['birthday'] = birthday;
    map['deathday'] = deathday;
    map['gender'] = gender; // Consider changing this to int
    map['homepage'] = homepage;
    map['id'] = id; // Consider changing this to int
    map['imdb_id'] = imdbId;
    map['known_for_department'] = knownForDepartment;
    map['name'] = name;
    map['place_of_birth'] = placeOfBirth;
    map['popularity'] = popularity; // Consider changing this to double
    map['profile_path'] = profilePath;
    return map;
  }
}