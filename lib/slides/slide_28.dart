import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide28 extends StatelessWidget {
  final int step;
  const Slide28({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Arquitetura de Debug — ESP32',
            subtitle: 'Visão geral da cadeia de depuração via JTAG/USB',
            accentColor: const Color(0xFFFF9F0A),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: AnimatedOpacity(
              opacity: step >= 1 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 600),
              child: GlassPanel(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return CustomPaint(
                      size: Size(constraints.maxWidth, constraints.maxHeight),
                      painter: _ArchPainter(s: s, step: step),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ArchPainter extends CustomPainter {
  final double s;
  final int step;
  _ArchPainter({required this.s, required this.step});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final bw = w * 0.18;
    final bh = h * 0.22;
    final midY = h * 0.4;

    // Boxes: PC → USB → JTAG Adapter → ESP32 CPU
    final boxes = <(String, String, Color, double)>[
      ('PC / IDE', 'VSCode\nGDB Client', const Color(0xFF00D9FF), w * 0.07),
      ('USB', 'Cable', const Color(0xFF7C4DFF), w * 0.30),
      ('JTAG\nAdapter', 'ESP-PROG\nOpenOCD', const Color(0xFFFF9F0A), w * 0.53),
      ('ESP32\nCPU', 'Xtensa\nRISC-V', const Color(0xFF00E676), w * 0.76),
    ];

    for (int i = 0; i < boxes.length; i++) {
      if (i == 0 || step >= 2) {
        final (title, sub, color, x) = boxes[i];
        final rect = Rect.fromCenter(
          center: Offset(x + bw / 2, midY),
          width: bw,
          height: bh,
        );

        // Background
        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, const Radius.circular(12)),
          Paint()..color = color.withValues(alpha: 0.12),
        );
        // Border
        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, const Radius.circular(12)),
          Paint()
            ..color = color.withValues(alpha: 0.5)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.5,
        );

        // Title
        _drawText(
          canvas,
          title,
          Offset(rect.center.dx, rect.top + bh * 0.3),
          color,
          13 * s,
          true,
        );
        // Subtitle
        _drawText(
          canvas,
          sub,
          Offset(rect.center.dx, rect.top + bh * 0.65),
          color.withValues(alpha: 0.6),
          10 * s,
          false,
        );

        // Arrow to next
        if (i < boxes.length - 1 && (step >= 2)) {
          final nextX = boxes[i + 1].$4;
          final arrowY = midY;
          canvas.drawLine(
            Offset(x + bw / 2 + bw / 2 + 2, arrowY),
            Offset(nextX + bw / 2 - bw / 2 - 2, arrowY),
            Paint()
              ..color = Colors.white.withValues(alpha: 0.3)
              ..strokeWidth = 2
              ..style = PaintingStyle.stroke,
          );
          // Arrow head
          final tipX = nextX + bw / 2 - bw / 2 - 2;
          final path = Path()
            ..moveTo(tipX, arrowY)
            ..lineTo(tipX - 8, arrowY - 5)
            ..lineTo(tipX - 8, arrowY + 5)
            ..close();
          canvas.drawPath(
            path,
            Paint()..color = Colors.white.withValues(alpha: 0.3),
          );
        }
      }
    }

    // Protocol labels
    if (step >= 2) {
      final protocols = ['USB 2.0', 'JTAG/SWD', 'Debug Port'];
      final pxs = [w * 0.24, w * 0.47, w * 0.70];
      for (int i = 0; i < protocols.length; i++) {
        _drawText(
          canvas,
          protocols[i],
          Offset(pxs[i], midY - bh / 2 - 18 * s),
          Colors.white.withValues(alpha: 0.4),
          9 * s,
          false,
        );
      }
    }

    // Bottom info
    if (step >= 2) {
      final info =
          'Fluxo: IDE envia comandos GDB → OpenOCD traduz para JTAG → ESP32 responde com dados de debug';
      _drawText(
        canvas,
        info,
        Offset(w * 0.5, h * 0.75),
        const Color(0xFFFF9F0A).withValues(alpha: 0.7),
        11 * s,
        false,
      );
    }
  }

  void _drawText(
    Canvas canvas,
    String text,
    Offset pos,
    Color color,
    double fontSize,
    bool bold,
  ) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
          height: 1.3,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: 200);
    tp.paint(canvas, Offset(pos.dx - tp.width / 2, pos.dy - tp.height / 2));
  }

  @override
  bool shouldRepaint(covariant _ArchPainter oldDelegate) =>
      oldDelegate.step != step;
}
