import 'package:flutter/material.dart';

class Chessboard extends StatelessWidget {
  Chessboard({Key? key, this.space = 20, this.lines = 9}) : super(key: key);

  double space = 20;

  ///棋盘格数
  int lines;

  @override
  Widget build(BuildContext context) {
    var length = space * lines;
    return Center(
      child: CustomPaint(
        size: Size(length, length),
        painter: ChessboardPainter(space, lines, length),
      ),
    );
  }
}

class ChessboardPainter extends CustomPainter {
  ChessboardPainter(this.space, this.lines, this.height);

  double space;
  int lines;
  double height;

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;

    drawChessboard(canvas, rect);
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

    for (int i = 0; i <= lines; i++) {
      canvas.drawLine(Offset(0, space * i), Offset(height, space * i), paint);
    }

    for (int i = 0; i <= lines; i++) {
      canvas.drawLine(Offset(space * i, 0), Offset(space * i, height), paint);
    }
  }
}
