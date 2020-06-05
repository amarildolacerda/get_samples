import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button.dart';

class ControllerX extends RxController {
  var contador = 0.obs;
  ControllerX(int v) {
    contador.value = v;
  }
  inc() {
    contador.value++;
  }

  dec() => contador.value--;
}

/// teste o '.obs como stream"
Widget everBuilder(RxInterface listener, Widget Function(dynamic) callback,
    {bool condition = true}) {
  return StreamBuilder(
      stream: listener.subject.stream,
      builder: (x, y) {
        if (y.hasData) return callback(y.data.$new);
        return Container();
      });
}

class GetXSample extends StatelessWidget {
  final bool solo;
  const GetXSample({Key key, this.solo = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// simples observer
    var contador = 0.obs;

    /// observar todos as mudanças
    ever(contador, (x) {
      print('ever: ${contador.value} - $x');

      // incrementando no controller
      Get.find<ControllerX>().inc();
    });

    return Scaffold(
      appBar:
          (solo) ? null : AppBar(title: Text('Sample usando GetX - Reativo')),
      body: Column(
        children: [
          /// usando rxcontroller
          GetX<ControllerX>(
              init: ControllerX(0),
              builder: (x) {
                print(x.contador.value);
                return Button(
                  text: 'GetX: ${x.contador.value}',
                  onPressed: () {
                    contador.value++;
                  },
                );
              }),

          /// usando StreamBuilder
          everBuilder(contador, (x) {
            return Text('$x');
          }),

          /// usando Obx(...)
          Obx(() => Text('${contador.value}'))
        ],
      ),
    );
  }
}
