import 'package:flutter/material.dart';

class CommonUtils {

  static Future showBottomSheet({required BuildContext context,required Widget body}) async {
     await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      builder: (_) => body,
    );
  }
}
