import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button.dart';

class SnackbarSample extends StatelessWidget {
  const SnackbarSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      text: 'snackbar',
      onPressed: () {
        /// mostrar mensagem
        Get.snackbar('titulo', 'mensagem do snakbar',
            snackPosition: SnackPosition.BOTTOM);
      },
    );
  }
}
