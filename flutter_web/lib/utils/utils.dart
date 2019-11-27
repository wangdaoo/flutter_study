import 'package:flutter/material.dart';

/// [author] MARS <wangyunfan66@gmail.com>
/// [date] 2019-11-26
/// [fileoverview] 组件提取及封装工具

// ?自定义字体, 仅可用于英文
TextStyle getEnCustomFont(val, color) {
  // print(color);
  return TextStyle(
    color: color,
    fontFamily: 'Pacifico',
    fontSize: val,
    letterSpacing: 1.0,
  );
}

/// [method] 颜色值转换
/// [description] 颜色值转换16进制
Color string2Color(String colorString) {
  int value = 0x00000000;
  // ?判断是否为空,第一位是否为 #, 如果是就从第二位开始取值
  if (colorString.isNotEmpty) {
    if (colorString[0] == '#') {
      colorString = colorString.substring(1);
    }
    // ?转换为int类型 16进制
    value = int.tryParse(colorString, radix: 16);

    if (value != null) {
      if (value < 0xFF000000) {
        value += 0xFF000000;
      }
    }
  }
  return Color(value);
}
