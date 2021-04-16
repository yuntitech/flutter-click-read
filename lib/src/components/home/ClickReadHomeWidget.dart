import 'package:click_read/src/components/home/ClickReadHomeScreen.dart';
import 'package:click_read/src/utils/HexColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ClickReadHomeDrawerView.dart';

class ClickReadHomeWidget extends State<ClickReadHomeScreen> {
  bool hasClickArea = false;
  Widget renderBody() {
    return Column(
      children: [Text('data')],
    );
  }

  void onPressCategory(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void onPressClickArea() {
    print('点击区域');
  }

  void onPressBuy() {
    print('点击购买');
  }

  Widget renderTitleCenterItem(
      String img, String value, bool enable, void onPress()) {
    return InkWell(
        onTap: enable ? onPress : null,
        child: Column(children: [
          Image.asset(img),
          Container(
            margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(value,
                style: TextStyle(
                    fontSize: 14,
                    color: HexColor(enable ? '#666666' : '#999999'))),
          ),
        ]));
  }

  /// 绘制标题
  AppBar renderAppBar() {
    String clickImg =
        hasClickArea ? 'images/ic_region.png' : 'images/ic_region_default.png';
    return AppBar(
        toolbarHeight: 64,
        title: Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 60, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(builder: (context) {
                  return InkWell(
                      onTap: () {
                        onPressCategory(context);
                      },
                      child: Column(children: [
                        Image.asset('images/ic_catalog.png'),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Text('目录',
                              style: TextStyle(
                                  fontSize: 14, color: HexColor('#666666'))),
                        ),
                      ]));
                }),
                renderTitleCenterItem(
                    clickImg, '点击区域', hasClickArea, onPressClickArea),
                renderTitleCenterItem(
                    'images/ic_buy.png', '购买', true, onPressBuy),
              ],
            ),
          ),
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
      drawer: ClickReadHomeDrawerView(),
      body: renderBody(),
    );
  }
}
