import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClickableText extends Container {
  final String? data;
  final TextStyle? style;
  final EdgeInsetsGeometry paddingInfo;
  final VoidCallback? onPress;
  final Color? color;
  final AlignmentGeometry? gravity;

  ClickableText(this.data,
      {required this.paddingInfo,
      this.gravity,
      this.color,
      this.style,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: color == null ? Colors.white : color, // 设置背景色才能有效对onPress区域扩大
        alignment: gravity == null ? Alignment.center : gravity,
        child: Padding(
          padding: paddingInfo,
          child: NonNullText(
            data,
            style: style,
          ),
        ),
      ),
      onTap: onPress,
    );
  }
}

class NonNullText extends Text {
  NonNullText(
    String? data, {
    Key? key,
    style,
    strutStyle,
    textAlign,
    textDirection,
    locale,
    softWrap,
    overflow,
    textScaleFactor,
    maxLines,
    semanticsLabel,
    textWidthBasis,
    textHeightBehavior,
  }) : super(data == null ? '' : data,
            key: key,
            style: style,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior);
}
