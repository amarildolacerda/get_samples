import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding.dart';
import 'bottom_sheet.dart';
import 'button.dart';
import 'change_notifier.dart';
import 'controller.dart';
import 'getx.dart';
import 'snackbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// GetMaterialApp -> inicializa do Get
    ///
    ///

    //Get.lazyPut<Controller>(() => Controller(0));  -- transferido para o binding
    //Get.put<Controller>(Controller(0)); -- transferido para o binding
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Get'),
      namedRoutes: {
        '/': GetRoute(
          page: MyHomePage(title: 'Flutter Demo Get'),
          binding: Setup(),
        ),
        '/2': GetRoute(
          page: MyHomePage(title: 'Flutter Demo Get'),
          binding: Setup(),
        ),
      },
      initialRoute: '/',
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Setup();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Vezes pressionado (State):',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Wrap(
              children: [
                SnackbarSample(),
                ControllerSample(),
                CnBuilderNotifierSample(),
                Controller2Sample(),
                BottomSheetSample(),
                Button(
                    text: 'defaultDialog',
                    onPressed: () {
                      Get.defaultDialog(
                          confirm: Button(
                              text: 'OK',
                              onPressed: () {
                                Get.back();
                              }),
                          middleText: "Dialog made in 3 lines of code");
                    }),
                Container(
                  child: GetXSample(solo: true),
                  width: 120,
                  height: 100,
                ),
                Button(
                    text: 'dialog',
                    onPressed: () {
                      /// usando dialog para chamar nova janela
                      Get.dialog(GetXSample(), barrierDismissible: false);
                    })
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
