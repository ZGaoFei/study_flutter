import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///使用CustomPaint绘制棋盘和棋子
class CustomerPainterRoute extends StatelessWidget {
  const CustomerPainterRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomPaint(
      size: const Size(300, 300),
      painter: MyPainter(),
    ));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    //画棋盘
    drawChessboard(canvas, rect);
    //画棋子
    drawPieces(canvas, rect);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void drawChessboard(Canvas canvas, Rect rect) {
    var paint = Paint()
      ..color = const Color(0xFFDCC48C)
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    canvas.drawRect(rect, paint);

    paint
      ..color = Colors.black38
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    for (int i = 0; i <= 15; i++) {
      canvas.drawLine(Offset(0, 20.0 * i), Offset(300, 20.0 * i), paint);
    }

    for (int i = 0; i <= 15; i++) {
      canvas.drawLine(Offset(20.0 * i, 0), Offset(20.0 * i, 300), paint);
    }
  }

  void drawPieces(Canvas canvas, Rect rect) {
    var width = rect.width / 15;
    var height = rect.height / 15;

    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(10 * width, 10 * height), 8, paint);

    paint.color = Colors.white;
    canvas.drawCircle(Offset(9 * width, 10 * height), 8, paint);
  }
}
