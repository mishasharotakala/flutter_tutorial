class ABCWidget{
  String? url;

  ABCWidget({
    required this.url,
  });

  ABCWidget.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}