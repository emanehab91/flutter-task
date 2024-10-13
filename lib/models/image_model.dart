/// id : 4
/// profiles : [{"aspect_ratio":0.666,"height":839,"iso_639_1":null,"file_path":"/2vmMjXMFW9ebX9VNKPW7WD6HLOR.jpg","vote_average":5.454,"vote_count":3,"width":559},{"aspect_ratio":0.666,"height":913,"iso_639_1":null,"file_path":"/mchDTZRNAC8YZvZZyhSNq8X5zkV.jpg","vote_average":5.388,"vote_count":4,"width":608},{"aspect_ratio":0.667,"height":1210,"iso_639_1":null,"file_path":"/of4yHmryKPy92eeskUQ7MRmjC3l.jpg","vote_average":5.318,"vote_count":3,"width":807},{"aspect_ratio":0.667,"height":1638,"iso_639_1":null,"file_path":"/gsaTC69E7j5YEUM8dwJ5aRFeCpz.jpg","vote_average":5.27,"vote_count":10,"width":1093},{"aspect_ratio":0.667,"height":960,"iso_639_1":null,"file_path":"/crDHAR22rsscqpPSBLd76B9lR1t.jpg","vote_average":5.258,"vote_count":6,"width":640},{"aspect_ratio":0.667,"height":594,"iso_639_1":null,"file_path":"/aCAmlmqgxJLruaCzL1gYlRtwiZ0.jpg","vote_average":5.252,"vote_count":4,"width":396},{"aspect_ratio":0.667,"height":702,"iso_639_1":null,"file_path":"/jU8Bu6fNyhlfguWd74KGPIz0vhu.jpg","vote_average":5.246,"vote_count":2,"width":468},{"aspect_ratio":0.667,"height":2908,"iso_639_1":null,"file_path":"/o9J17kN5tAMrW1Ucmn6yvt9bm5R.jpg","vote_average":5.164,"vote_count":14,"width":1939},{"aspect_ratio":0.667,"height":2361,"iso_639_1":null,"file_path":"/utKPqWm9MAcL6NqN0Kd71dWUmXM.jpg","vote_average":5.156,"vote_count":12,"width":1574},{"aspect_ratio":0.667,"height":2062,"iso_639_1":null,"file_path":"/rfJtncHewKVnHjqpIZvjn24ESeC.jpg","vote_average":5.154,"vote_count":40,"width":1375},{"aspect_ratio":0.666,"height":872,"iso_639_1":null,"file_path":"/awb4UqzT6meD3JiQlraIzAqcRtH.jpg","vote_average":5.146,"vote_count":10,"width":581},{"aspect_ratio":0.667,"height":1251,"iso_639_1":null,"file_path":"/745jo3MsIZm53PWvZiFxwKuQVxt.jpg","vote_average":5.146,"vote_count":10,"width":834},{"aspect_ratio":0.667,"height":983,"iso_639_1":null,"file_path":"/8DOzF5eQMWdFwkVIevaEfrYXtLx.jpg","vote_average":5.128,"vote_count":19,"width":656},{"aspect_ratio":0.666,"height":833,"iso_639_1":null,"file_path":"/d60ZwPUoizvw1gdU6dXvKUOeoDK.jpg","vote_average":5.128,"vote_count":6,"width":555},{"aspect_ratio":0.667,"height":883,"iso_639_1":null,"file_path":"/btYcHz6xZvYjkBZ9PiBapF3sO12.jpg","vote_average":0.0,"vote_count":0,"width":589},{"aspect_ratio":0.667,"height":861,"iso_639_1":null,"file_path":"/1Wg02cCjPJdS7pEx00IjbgjfhKn.jpg","vote_average":0.0,"vote_count":0,"width":574},{"aspect_ratio":0.666,"height":1226,"iso_639_1":null,"file_path":"/5aBOYGZ2ZkBBEVsMjrR5y6UZLHs.jpg","vote_average":0.0,"vote_count":0,"width":817}]

class ImageModel {
  ImageModel({
      this.id, 
      this.profiles,});

  ImageModel.fromJson(dynamic json) {
    id = json['id'];
    if (json['profiles'] != null) {
      profiles = [];
      json['profiles'].forEach((v) {
        profiles?.add(Profiles.fromJson(v));
      });
    }
  }
  num? id;
  List<Profiles>? profiles;
ImageModel copyWith({  num? id,
  List<Profiles>? profiles,
}) => ImageModel(  id: id ?? this.id,
  profiles: profiles ?? this.profiles,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (profiles != null) {
      map['profiles'] = profiles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// aspect_ratio : 0.666
/// height : 839
/// iso_639_1 : null
/// file_path : "/2vmMjXMFW9ebX9VNKPW7WD6HLOR.jpg"
/// vote_average : 5.454
/// vote_count : 3
/// width : 559

class Profiles {
  Profiles({
      this.aspectRatio, 
      this.height, 
      this.iso6391, 
      this.filePath, 
      this.voteAverage, 
      this.voteCount, 
      this.width,});

  Profiles.fromJson(dynamic json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }
  num? aspectRatio;
  num? height;
  dynamic iso6391;
  String? filePath;
  num? voteAverage;
  num? voteCount;
  num? width;
Profiles copyWith({  num? aspectRatio,
  num? height,
  dynamic iso6391,
  String? filePath,
  num? voteAverage,
  num? voteCount,
  num? width,
}) => Profiles(  aspectRatio: aspectRatio ?? this.aspectRatio,
  height: height ?? this.height,
  iso6391: iso6391 ?? this.iso6391,
  filePath: filePath ?? this.filePath,
  voteAverage: voteAverage ?? this.voteAverage,
  voteCount: voteCount ?? this.voteCount,
  width: width ?? this.width,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aspect_ratio'] = aspectRatio;
    map['height'] = height;
    map['iso_639_1'] = iso6391;
    map['file_path'] = filePath;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    map['width'] = width;
    return map;
  }

}