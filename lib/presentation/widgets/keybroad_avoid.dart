import 'package:flutter/material.dart';

class KeyBroadAvoid extends StatelessWidget {
  final Widget body;
  const KeyBroadAvoid({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: body,
            ),
          ),
        );
      },
    );
  }
}
