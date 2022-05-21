import 'package:flutter/material.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';

class AppScaffold extends StatelessWidget {
  final Color? backgroundColor;
  final AppBarWidget? appBar;
  final Widget body;
  const AppScaffold(
      {Key? key, required this.body, this.backgroundColor, this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.white,
      appBar: appBar,
      body: body,
    );
  }
}
