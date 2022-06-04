class CategoryModel {
  final String id;
  final String categoryCode;
  final String thumbnail;
  final String categoryName;
  final int totalBook;
  final DateTime createAt;
  final DateTime? updateAt;
  final DateTime? deleteAt;
  final int status;

  CategoryModel(
      {required this.id,
      required this.categoryCode,
      required this.thumbnail,
      required this.categoryName,
      required this.totalBook,
      required this.createAt,
      required this.updateAt,
      this.deleteAt,
      required this.status});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'],
        categoryCode: json['categoryCode'],
        // thumbnail: json['thumbnail'],
        thumbnail: json['thumbnail'],
        categoryName: json['categoryName'],
        totalBook: json['totalBook'],
        createAt: DateTime.parse(json['createdAt']),
        updateAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
        deleteAt: json['deletedAt'] != null
            ? DateTime.parse(json['deletedAt'])
            : null,
        status: json['status']);
  }
}
