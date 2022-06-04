class HireModel {
  final String id;
  final String bookId;
  final String title;
  final String? studentName;
  final String? studentIdentify;
  final String? subTitle;
  final int quantity;
  final String description;
  final String categoryCode;
  final String categoryId;
  final String thumbnail;
  final String pdfFile;
  final int term;
  final DateTime? hiredFrom;
  final DateTime? returnedDate;
  final DateTime? expiredDate;
  final String? note;

  HireModel(
      {required this.id,
      required this.bookId,
      required this.title,
      this.studentName,
      this.studentIdentify,
      this.subTitle,
      required this.quantity,
      required this.description,
      required this.categoryCode,
      required this.categoryId,
      required this.thumbnail,
      required this.pdfFile,
      required this.term,
      required this.hiredFrom,
      this.returnedDate,
      this.expiredDate,
      this.note});
  factory HireModel.fromJson(Map<String, dynamic> json) {
    return HireModel(
        id: json['id'],
        bookId: json['bookId'],
        title: json['title'],
        studentName: json['studentName'],
        studentIdentify: json['studentIdentify'],
        subTitle: json['subTitle'],
        quantity: json['quantity'],
        description: json['description'],
        categoryCode: json['categoryCode'],
        categoryId: json['categoryId'],
        thumbnail: json['thumbnail'],
        pdfFile: json['pdfFile'],
        term: json['term'],
        hiredFrom: json['hiredFrom'] != null
            ? DateTime.parse(json['hiredFrom'])
            : null,
        returnedDate: json['returnedDate'] != null
            ? DateTime.parse(json['returnedDate'])
            : null,
        expiredDate: json['expiredDate'] != null
            ? DateTime.parse(json['expiredDate'])
            : null,
        note: json['note']);
  }
}
