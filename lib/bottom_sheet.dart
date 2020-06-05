import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button.dart';

class BottomSheetSample extends StatelessWidget {
  const BottomSheetSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
        text: 'bottomSheet',
        onPressed: () => Get.bottomSheet(Material(
              child: Container(
                height: 150,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.music_note),
                        title: Text('Music'),
                        onTap: () {
                          Get.back();
                        }),
                    ListTile(
                      leading: Icon(Icons.videocam),
                      title: Text('Video'),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            )));
  }
}
