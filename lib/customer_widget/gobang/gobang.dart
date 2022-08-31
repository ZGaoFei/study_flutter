import 'package:flutter/material.dart';
import 'package:study_flutter/customer_widget/gobang/chess_board.dart';

///五子棋
///TODO: 可以接着添加五子棋相关的胜负规则判断
class Gobang extends StatefulWidget {
  Gobang({Key? key, required this.lines}) : super(key: key) {
    ///行列数限制，最多18
    lines = lines > 18 ? 18 : lines;
  }

  ///间距
  static const double space = 20;

  ///棋子的半径
  static const double radius = 8;

  ///棋盘格数
  int lines;

  @override
  State<Gobang> createState() => _GobangState();
}

class _GobangState extends State<Gobang> {
  double length = 0;

  ///默认黑棋先下
  bool change = false;

  ///保存黑棋的落点位置
  List<Offset> black = [];

  ///保存白棋的落点位置
  List<Offset> white = [];

  @override
  void initState() {
    length = Gobang.space * (widget.lines + 1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: length,
      height: length,
      color: const Color(0xFFDCC48C),
      child: GestureDetector(
        // onTapUp: (details) => _onTapUp(details),
        onTapDown: (details) => _onTapDown(details),
        child: CustomPaint(
          foregroundPainter: GobangPainter(widget.lines, black, white),
          child: RepaintBoundary(
              child: Chessboard(
            lines: widget.lines,
            space: Gobang.space,
          )),
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    ///(10, 10)
    double start = Gobang.space / 2;

    ///手指落点坐标
    var localPosition = details.localPosition;
    var dx = localPosition.dx;
    var dy = localPosition.dy;

    ///点位
    var x = (dx - start) / Gobang.space;
    var y = (dy - start) / Gobang.space;
    var offset = Offset(
        start + x.round() * Gobang.space, start + y.round() * Gobang.space);

    ///此位置已经有的过滤掉
    if (black.contains(offset) || white.contains(offset)) {
      return;
    }
    if (change) {
      black.add(offset);
    } else {
      white.add(offset);
    }
    change = !change;

    setState(() {});
  }
}

class GobangPainter extends CustomPainter {
  GobangPainter(this.lines, this.black, this.white);

  int lines;

  ///保存黑棋的落点位置
  List<Offset> black = [];

  ///保存白棋的落点位置
  List<Offset> white = [];

  @override
  void paint(Canvas canvas, Size size) {
    drawPieces(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawPieces(Canvas canvas) {
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    for (var item in black) {
      canvas.drawCircle(item, Gobang.radius, paint);
    }

    paint.color = Colors.white;
    for (var item in white) {
      canvas.drawCircle(item, Gobang.radius, paint);
    }
  }
}
