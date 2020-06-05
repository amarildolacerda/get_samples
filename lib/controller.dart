import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_samples/button.dart';

import 'container_group.dart';

///
class Controller extends GetController {
  int value;
  Controller(this.value) {
    print('Controller $value foi criado');
  }
  inc([int v = 1]) {
    value += v;
    update();
  }

  dec([int v = 1]) {
    inc(-v);
  }
}

class ControllerSample extends StatelessWidget {
  const ControllerSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerGroup(
      title: 'GetBuilder',
      width: 150,
      child: GetBuilder<Controller>(
          // init: Controller(0),   // transferido para o binding (Setup() na carga no main.dart)
          builder: (a) => Container(
                alignment: Alignment.center,
                width: 140,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                          width: 40,
                          child: Text('+'),
                          onPressed: () => a.inc()),
                      Text('${a.value}'),
                      Button(
                          width: 40,
                          child: Text('-'),
                          onPressed: () => a.dec()),
                    ]),
              )),
    );
  }
}

/// deixando o GetBuilder cria o controller;
class Controller2Sample extends StatelessWidget {
  const Controller2Sample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerGroup(
      title: 'GetBuilder',
      width: 150,
      child: GetBuilder<Controller>(
          autoRemove: true,
//          init: Controller(0),  // ja foi instanciado no binding
          builder: (a) => Container(
                alignment: Alignment.center,
                width: 140,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                          width: 40,
                          child: Text('+'),
                          onPressed: () => a.inc()),
                      Text('${a.value}'),
                      Button(
                          width: 40,
                          child: Text('-'),
                          onPressed: () => a.dec()),
                    ]),
              )),
    );
  }
}
