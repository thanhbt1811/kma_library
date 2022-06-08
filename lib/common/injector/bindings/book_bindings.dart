import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/book/book_detail/book_detail_controller.dart';
import 'package:getx_base_code/presentation/journey/book/book_list/book_list_controller.dart';
import 'package:getx_base_code/presentation/journey/book/read_book/read_book_controller.dart';

class BookListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace(() => getIt<BookListController>());
  }
}

class BookDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => getIt<BookDetailController>(),
    );
  }
}

class ReadBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace(() => getIt<ReadBookController>());
  }
}
