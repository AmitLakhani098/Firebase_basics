class Place {
  String title;
  String address;
  String imgUrl;

  Place({
    this.title,
    this.address,
    this.imgUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': this.title,
      'address': this.address,
      'ImgUrl': this.imgUrl,
    };
  }

  static Place fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }
    return Place(
      title: map['title'],
      address: map['address'],
      imgUrl: map['ImgUrl'],
    );
  }
}
