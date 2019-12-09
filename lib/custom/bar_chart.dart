import 'package:flutter/material.dart';
import 'package:nanigo_flutter/res/colors.dart';

class BarChart extends CustomPainter {
  int percentage = 0;

  BarChart({this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgpaint = Paint() // 화면에 그릴 때 쓸 Paint를 정의합니다.
      ..color = kNanigoGrey
      ..strokeWidth = 30.0 // 선의 길이를 정합니다.
      ..style = PaintingStyle.fill // 선의 스타일을 정합니다. stroke면 외곽선만 그리고, fill이면 다 채웁니다.
      ..strokeCap = StrokeCap.round; // stroke의 스타일을 정합니다. round를 고르면 stroke의 끝이 둥글게 됩니다.

    Offset p1 = Offset(0.0, 15.0 / 2);
    Offset p2 = Offset(size.width, 15.0 / 2);

    canvas.drawLine(p1, p2, bgpaint);

    Paint paint = Paint() // 화면에 그릴 때 쓸 Paint를 정의합니다.
      ..color = kContentsTextColor
      ..strokeWidth = 30.0 // 선의 길이를 정합니다.
      ..style = PaintingStyle.fill // 선의 스타일을 정합니다. stroke면 외곽선만 그리고, fill이면 다 채웁니다.
      ..strokeCap = StrokeCap.round; // stroke의 스타일을 정합니다. round를 고르면 stroke의 끝이 둥글게 됩니다.

    var pSize = size.width * (percentage / 100);
    p2 = Offset(pSize, 15.0/2);

    canvas.drawLine(p1, p2, paint);

    drawText(canvas, size, "$percentage%");
  }

  void drawText(Canvas canvas, Size size, String text) {
    TextSpan sp = TextSpan(style: TextStyle(fontSize: 15, color: Colors.white), text: text); // TextSpan은 Text위젯과 거의 동일하다.
    TextPainter tp = TextPainter(text: sp, textDirection: TextDirection.ltr);
    tp.layout(); // 필수! 텍스트 페인터에 그려질 텍스트의 크기와 방향를 정함.
    double dx = 30.0 / 2 - tp.width / 2;
    double dy = 15.0 /2  - tp.height / 2;
    Offset offset = Offset(dx, dy);
    tp.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(BarChart old) {
    return old.percentage != percentage;;
  }
}