import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide16 extends StatelessWidget {
  final int step;
  const Slide16({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Debugging Workflow',
            subtitle: 'Fluxo sistemático de identificação e correção de bugs',
            accentColor: const Color(0xFF00D9FF),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Flowchart
                Expanded(
                  flex: 55,
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: GlassPanel(
                      child: CustomPaint(
                        size: Size.infinite,
                        painter: _WorkflowPainter(s: s),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20 * s),
                // Techniques
                Expanded(
                  flex: 45,
                  child: AnimatedOpacity(
                    opacity: step >= 2 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Técnicas Essenciais',
                            style: TextStyle(
                                color: const Color(0xFF00D9FF),
                                fontSize: 15 * s,
                                fontWeight: FontWeight.w700)),
                        SizedBox(height: 12 * s),
                        _TechChip(
                            label: 'Breakpoints e Step-through',
                            color: const Color(0xFF00D9FF),
                            s: s),
                        _TechChip(
                            label: 'Print/Log Debugging',
                            color: const Color(0xFF7C4DFF),
                            s: s),
                        _TechChip(
                            label: 'Watch Variables',
                            color: const Color(0xFF00E676),
                            s: s),
                        _TechChip(
                            label: 'Call Stack Analysis',
                            color: const Color(0xFFFF9F0A),
                            s: s),
                        _TechChip(
                            label: 'Rubber Duck Debugging',
                            color: const Color(0xFFFFD54F),
                            s: s),
                        _TechChip(
                            label: 'Binary Search (bisect)',
                            color: const Color(0xFFFF6B6B),
                            s: s),
                        _TechChip(
                            label: 'Unit Tests',
                            color: const Color(0xFF00D9FF),
                            s: s),
                        _TechChip(
                            label: 'Profiling',
                            color: const Color(0xFF7C4DFF),
                            s: s),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  final String label;
  final Color color;
  final double s;
  const _TechChip({required this.label, required this.color, required this.s});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8 * s),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14 * s, vertical: 8 * s),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: 6 * s,
                height: 6 * s,
                decoration:
                    BoxDecoration(color: color, shape: BoxShape.circle)),
            SizedBox(width: 8 * s),
            Text(label,
                style: TextStyle(
                    color: color,
                    fontSize: 12 * s,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

class _WorkflowPainter extends CustomPainter {
  final double s;
  _WorkflowPainter({required this.s});

  @override
  void paint(Canvas canvas, Size size) {
    final sx = size.width / 320;
    final sy = size.height / 400;

    final steps = [
      ('1. Identificar\no Bug', const Color(0xFFFF6B6B), 160.0, 30.0),
      ('2. Reproduzir\no Erro', const Color(0xFFFF9F0A), 160.0, 90.0),
      ('3. Localizar\na Causa', const Color(0xFFFFD54F), 160.0, 150.0),
      ('Bug\nEncontrado?', const Color(0xFF00D9FF), 160.0, 220.0),
      ('5. Corrigir\no Código', const Color(0xFF00E676), 160.0, 295.0),
      ('6. Testar\nSolução', const Color(0xFF7C4DFF), 160.0, 360.0),
    ];

    for (int i = 0; i < steps.length; i++) {
      final (text, color, x, y) = steps[i];
      final cx = x * sx;
      final cy = y * sy;
      final isDecision = i == 3;
      final w = (isDecision ? 80 : 100) * sx;
      final h = (isDecision ? 45 : 35) * sy;

      final paint = Paint()
        ..color = color.withValues(alpha: 0.2)
        ..style = PaintingStyle.fill;
      final borderPaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;

      if (isDecision) {
        // Diamond
        final path = Path()
          ..moveTo(cx, cy - h)
          ..lineTo(cx + w, cy)
          ..lineTo(cx, cy + h)
          ..lineTo(cx - w, cy)
          ..close();
        canvas.drawPath(path, paint);
        canvas.drawPath(path, borderPaint);
      } else {
        final rrect = RRect.fromRectAndRadius(
          Rect.fromCenter(center: Offset(cx, cy), width: w * 2, height: h * 2),
          Radius.circular(8 * sx),
        );
        canvas.drawRRect(rrect, paint);
        canvas.drawRRect(rrect, borderPaint);
      }

      // Text
      final tp = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
              color: color,
              fontSize: 10 * sx,
              fontWeight: FontWeight.w600,
              height: 1.3),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: w * 2);
      tp.paint(canvas, Offset(cx - tp.width / 2, cy - tp.height / 2));

      // Arrow to next
      if (i < steps.length - 1 && i != 3) {
        final nextY = steps[i + 1].$4 * sy;
        _drawArrow(
            canvas,
            Offset(cx, cy + h),
            Offset(cx, nextY - (i + 1 == 3 ? 45 * sy : 35 * sy)),
            Colors.white.withValues(alpha: 0.4));
      }
    }

    // Decision arrows
    // Yes -> down
    _drawArrow(canvas, Offset(160 * sx, 265 * sy), Offset(160 * sx, 260 * sy),
        const Color(0xFF00E676));
    // No -> loop back
    final noPath = Path()
      ..moveTo(80 * sx, 220 * sy)
      ..lineTo(40 * sx, 220 * sy)
      ..lineTo(40 * sx, 90 * sy)
      ..lineTo(100 * sx, 90 * sy);
    canvas.drawPath(
        noPath,
        Paint()
          ..color = const Color(0xFFFF6B6B).withValues(alpha: 0.5)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5);

    // Labels
    _drawText(canvas, 'Sim ✓', Offset(175 * sx, 250 * sy),
        const Color(0xFF00E676), 9 * sx);
    _drawText(canvas, 'Não ✗', Offset(55 * sx, 205 * sy),
        const Color(0xFFFF6B6B), 9 * sx);
  }

  void _drawArrow(Canvas canvas, Offset from, Offset to, Color color) {
    canvas.drawLine(
        from,
        to,
        Paint()
          ..color = color
          ..strokeWidth = 1.5
          ..style = PaintingStyle.stroke);
  }

  void _drawText(
      Canvas canvas, String text, Offset pos, Color color, double fontSize) {
    final tp = TextPainter(
      text: TextSpan(
          text: text,
          style: TextStyle(
              color: color, fontSize: fontSize, fontWeight: FontWeight.w600)),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, pos);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
