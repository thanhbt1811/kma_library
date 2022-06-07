class NewModel {
  final String id;
  final String title;
  final String content;

  NewModel(this.id, this.title, this.content);

  factory NewModel.fromJson(Map<String,dynamic> json) {
    return NewModel(json['id'], json['title'], json['content']);
  }
}