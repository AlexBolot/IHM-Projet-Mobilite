import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ihm_projet_mobilite/utils/sizeUtils.dart';

const RED = Color(0xffcc3030);

class Painter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width > 1.0 && size.height > 1.0) {
      print(">1.9");
      SizeUtil.size = size;
    }
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = RED
      ..isAntiAlias = true
      ..strokeWidth = 3;
    canvas.drawLine(Offset(20, 285), Offset(40, 285) , paint);
    canvas.drawLine(Offset(40, 285), Offset(40, 180) , paint);
    canvas.drawLine(Offset(40, 180), Offset(220, 180) , paint);
    canvas.drawLine(Offset(220, 180), Offset(220, 197) , paint);
    canvas.drawLine(Offset(220, 197), Offset(260, 197) , paint);
    canvas.drawLine(Offset(260, 197), Offset(260, 210) , paint);
    canvas.drawLine(Offset(260, 210), Offset(220, 210) , paint);
    canvas.drawLine(Offset(220, 210), Offset(220, 260) , paint);
    canvas.drawLine(Offset(220, 260), Offset(110, 260) , paint);
    canvas.drawLine(Offset(110, 260), Offset(110, 305) , paint);
    canvas.drawLine(Offset(110, 305), Offset(40, 305) , paint);
    canvas.drawLine(Offset(40, 305), Offset(40, 295) , paint);
    canvas.drawLine(Offset(40, 295), Offset(20, 295) , paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}