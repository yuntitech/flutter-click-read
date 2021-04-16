import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class YTStateWidget<T extends StatefulWidget> extends State<T> {
  /// 绘制内容
  Widget renderBody();

  /// 标题名称
  String widgetTitle();

  /// 绘制标题
  AppBar renderAppBar() {
    return AppBar(
        centerTitle: true,
        title: Text(
          widgetTitle(),
          style: TextStyle(fontSize: 21),
        ),
        leading: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                SystemNavigator.pop();
              },
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: renderBody(),
    );
  }
}
