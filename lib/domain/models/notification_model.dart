class NotificationModel {
  final String id;
  final String title;
  final String content;
  final String image;
  final DateTime sentDate;
  final String toUser;

  NotificationModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.image,
      required this.sentDate,
      required this.toUser});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        image: json['image'],
        sentDate: DateTime.parse(json['sentDate']),
        toUser: json['toUser']);
  }
}
