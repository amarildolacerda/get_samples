import 'package:flutter/material.dart';

import 'button.dart';
import 'container_group.dart';

class CnController extends ValueNotifier<int> {
  CnController(int value) : super(value);
  inc([int v = 1]) {
    value += v;
    notifyListeners();
  }

  dec([int v = 1]) {
    inc(-v);
  }
}

class CnBuilderNotifierSample extends StatelessWidget {
  final Widget child;
  const CnBuilderNotifierSample({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = CnController(0);
    return ContainerGroup(
      width: 150,
      title: 'ValueNotifier',
      child: ValueListenableBuilder<int>(
        valueListenable: controller,
        builder: (a, b, w) => Container(
          alignment: Alignment.center,
          width: 140,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Button(
                width: 40, child: Text('+'), onPressed: () => controller.inc()),
            Text('$b'),
            Button(
                width: 40, child: Text('-'), onPressed: () => controller.dec()),
          ]),
        ),
      ),
    );
  }
}
