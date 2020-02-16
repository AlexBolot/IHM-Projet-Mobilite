import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ihm_projet_mobilite/utils/sizeUtils.dart';

const RED = Color(0xffcc3030);

class Painter extends CustomPainter {

  Size size;
  List<Offset> points /*= [
    Offset(20, 160),
    Offset(40, 160),
    Offset(40, 55),
    Offset(220, 55),
    Offset(220, 72),
    Offset(260, 72),
    Offset(260, 85),
    Offset(220, 85),
    Offset(220, 135),
    Offset(110, 135),
    Offset(110, 180),
    Offset(40, 180),
    Offset(40, 170),
    Offset(20, 170)
  ]*/;

  Painter({Size size, List<Offset> points}){
    this.size = size;
    this.points = points;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //print(size.toString());
    if (size.width > 1.0 && size.height > 1.0) {
      print(">1.9");
      SizeUtil.size = size;
    }
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = RED
      ..isAntiAlias = true
      ..strokeWidth = 3;

    //SizeUtil.size = this.size;
    //print(this.size);
    for(int i = 1; i < this.points.length; i++){
      canvas.drawLine(this.points[i-1], this.points[i], paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }

  Offset _convertLogicSize(Offset off) {
    return Offset(SizeUtil.getAxisX(off.dx), SizeUtil.getAxisY(off.dy));
  }
}