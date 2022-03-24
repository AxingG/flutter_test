import 'package:daily_yoga_h2/base/YogaColors.dart';
import 'package:daily_yoga_h2/base/YogaImages.dart';
import 'package:flutter/material.dart';

import 'ClickableText.dart';

class YogaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final String rightText;
  final VoidCallback callback;
  final VoidCallback rightClick;

  YogaAppBar(this.titleText, this.callback, this.rightText,this.rightClick);

  @override
  Widget build(BuildContext context) {
    // 横向
    return new AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: ImageIcon(AssetImage(YogaImages.back)),
        tooltip: 'Navigation',
        onPressed:callback,
      ),
      elevation: 0,
      title: Text(
        titleText,
        style: TextStyle(
          color: YogaColors.ff2E2F33,
          fontSize: 16,
        ),
      ),
      actions: [
        ClickableText(
          rightText,
          paddingInfo:
              EdgeInsets.only(left: 24, right: 12, top: 14, bottom: 14),
          style: TextStyle(
            color: YogaColors.ff5C5E66,
            fontSize: 14,
          ),
          onPress: rightClick,
        ),
      ],
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(56);
  }
}
