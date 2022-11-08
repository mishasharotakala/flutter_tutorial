class SecondWidget{
  String? image;
  String? name;

  SecondWidget({
    this.image,
    this.name,
  });

  SecondWidget.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
  }
}