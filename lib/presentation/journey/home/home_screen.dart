import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/injector/bindings/book_bindings.dart';
import 'package:getx_base_code/presentation/journey/book/book_detail/book_detail_screen.dart';
import 'package:getx_base_code/presentation/journey/book/book_list/book_list_screen.dart';
import 'package:getx_base_code/presentation/journey/book/read_book/read_book_screen.dart';
import 'package:getx_base_code/presentation/journey/home/category/category_screen.dart';
import 'package:getx_base_code/presentation/journey/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>().context = context;
    return Navigator(
      key: Get.nestedKey(BottomNavigationType.home.index),
      onGenerateRoute: (settings) {
        Get.routing.args = settings.arguments;
        switch (settings.name) {
          case AppRoutes.bookList:
            return GetPageRoute(
              settings: settings,
              routeName: AppRoutes.bookList,
              page: () => BookListScreen(),
              binding: BookListBindings(),
            );
          case AppRoutes.bookDetail:
            return GetPageRoute(
              settings: settings,
              routeName: AppRoutes.bookDetail,
              page: () => const BookDetailScreen(),
              binding: BookDetailBinding(),
            );
          case AppRoutes.overViewBook:
            return GetPageRoute(
                settings: settings,
                routeName: AppRoutes.overViewBook,
                page: () => const ReadBookScreen(),
                binding: ReadBookBinding());
          default:
            return GetPageRoute(
              settings: settings,
              routeName: AppRoutes.home,
              page: () => CategoryScreen(),
              binding: CategoryBindings(),
            );
        }
      },
    );
  }
}
