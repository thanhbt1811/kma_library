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
        thumbnail:
            'https://book-management-storage.s3.us-east-1.amazonaws.com/thumbnails/e48cbdb2-138c-4556-e42a-08da31ee11ec/272588839_703280581054845_949684622302582365_n.jpg',
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
