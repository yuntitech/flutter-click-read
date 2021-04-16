import 'package:click_read/src/utils/HexColor.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  final String item;
  final int index;
  final int selectedIndex;
  final Function(int) onPressItem;
  const CategoryItemWidget(
      {Key key, this.item, this.index, this.selectedIndex, this.onPressItem})
      : super(key: key);

  void onTap() {
    this.onPressItem(index);
  }

  @override
  Widget build(BuildContext context) {
    var textColor =
        selectedIndex == index ? HexColor('#3DA6FE') : HexColor('#666666');
    return Material(
        child: Ink(
      decoration: BoxDecoration(color: Colors.white),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 16, 18, 16),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(item,
                      style: TextStyle(fontSize: 14, color: textColor))),
              Container(
                margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Text(
                  '$index',
                  style: TextStyle(fontSize: 12, color: HexColor('#999999')),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
