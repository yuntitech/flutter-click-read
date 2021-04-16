import 'package:click_read/src/components/home/CategoryItemWidget.dart';
import 'package:click_read/src/utils/HexColor.dart';
import 'package:flutter/material.dart';

import 'ClickReadHomeDrawerView.dart';

class ClickReadHomeDrawerWidget extends State<ClickReadHomeDrawerView> {
  var _listData = <String>['111111111111111111111111111111111111', '2222222'];
  var _selectedIndex = -1;

  void onPressDownload() {
    _listData.add('value');
    this.setState(() {
      _listData = _listData;
    });
  }

  /// title
  Widget renderTopArea() {
    return Container(
      height: 64,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          '目录',
          style: TextStyle(fontSize: 18, color: HexColor('#333333')),
        ),
      ),
    );
  }

  /// 分割线
  Widget renderDivider(double indent) {
    return Divider(
      height: 1.0,
      indent: indent,
      color: HexColor('#666666'),
    );
  }

  /// 底部下载区域
  Widget renderBottomArea() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Center(
          child: Container(
              constraints: BoxConstraints(minWidth: 150),
              child: Material(
                child: Ink(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            style: BorderStyle.solid,
                            width: 1,
                            color: HexColor('#3DA6FE'))),
                    child: InkWell(
                        onTap: onPressDownload,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                          child: Text(
                            '下载离线包(411 MB)',
                            style: TextStyle(
                                fontSize: 12, color: HexColor('#3DA6FE')),
                          ),
                        ))),
              ))),
    );
  }

  /// 目录item选中
  void onPressListItem(int index) {
    this.setState(() {
      _selectedIndex = index;
    });
  }

  /// 列表item
  Widget renderItem(BuildContext context, int index) {
    return CategoryItemWidget(
      index: index,
      onPressItem: onPressListItem,
      item: _listData[index],
      key: ValueKey(index),
      selectedIndex: _selectedIndex,
    );
  }

  /// 列表分割线
  Widget renderListSeparator(BuildContext context, int index) {
    return renderDivider(30);
  }

  /// 列表数据
  Widget renderList() {
    /// 移除顶部多余的padding
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.separated(
            itemBuilder: renderItem,
            separatorBuilder: renderListSeparator,
            itemCount: _listData.length));
  }

  /// 中间内容区域
  Widget renderContent() {
    return Expanded(
      child: Container(
        child: renderList(),
      ),
      flex: 1,
    );
  }

  /// 容器
  Widget renderContainer() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.fromLTRB(0, statusBarHeight, 0, 0),
      child: Column(
        children: [
          renderTopArea(),
          renderDivider(0),
          renderContent(),
          renderDivider(0),
          renderBottomArea(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      /// 占屏幕宽度的80%
      widthFactor: 0.8,
      child: renderContainer(),
    );
  }
}
