import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/book/book_detal/book_detail_controller.dart';
import 'package:getx_base_code/presentation/journey/book/book_list/book_list_controller.dart';
import 'package:getx_base_code/presentation/journey/book/read_book/read_book_controller.dart';

class BookListBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(getIt<BookListController>());
  }
}

class BookDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      getIt<BookDetailController>(),
    );
  }
}

class ReadBookBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      getIt<ReadBookController>(),
    );
  }
}
