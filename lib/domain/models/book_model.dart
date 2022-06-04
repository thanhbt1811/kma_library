class BookModel {
  final String id;
  final String title;
  final String? subTitle;
  final int quantity;
  final String? description;
  final String categoryCode;
  final String categoryId;
  final String thumbnail;
  final String pdfFile;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final int term;
  final int status;

  BookModel({
    required this.id,
    required this.title,
    this.subTitle,
    required this.quantity,
    this.description,
    required this.categoryCode,
    required this.categoryId,
    required this.thumbnail,
    required this.pdfFile,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.term,
    required this.status,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
        id: json['id'],
        title: json['title'],
        quantity: json['quantity'],
        description: json['description'],
        categoryCode: json['categoryCode'],
        categoryId: json['categoryId'],
        thumbnail: json['thumbnail'],
        pdfFile: json['pdfFile'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
        deletedAt: json['deletedAt'] != null
            ? DateTime.parse(json['deletedAt'])
            : null,
        term: json['term'],
        status: json['status'],
        subTitle: json['subTitle']);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "subTitle": subTitle,
      "quantity": quantity,
      "description": description,
      "categoryCode": categoryCode,
      "categoryId": categoryId,
      "thumbnail": thumbnail,
      "pdfFile": pdfFile,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt?.toIso8601String(),
      "deletedAt": deletedAt?.toIso8601String(),
      "term": term,
      "hiredFrom": null,
      "status": status
    };
  }
}
