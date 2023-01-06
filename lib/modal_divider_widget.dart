import 'package:flutter/material.dart';

import 'config/evrika_colors.dart';

class ModalDivider extends StatelessWidget {
  const ModalDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0,
      thickness: 0.5,
    );
  }
}
