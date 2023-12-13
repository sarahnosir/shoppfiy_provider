class Advertisement {
  String? id;
  String? title;
  String? imgpath;

  Advertisement();
  Advertisement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imgpath = json['imgpath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['imgpath'] = imgpath;

    return data;
  }
}
