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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        Text(
                          'Técnicas Essenciais',
                          style: TextStyle(
                            color: const Color(0xFF00D9FF),
                            fontSize: 15 * s,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12 * s),
                        _TechChip(
                          label: 'Breakpoints e Step-through',
                          color: const Color(0xFF00D9FF),
                          s: s,
                        ),
                        _TechChip(
                          label: 'Print/Log Debugging',
                          color: const Color(0xFF7C4DFF),
                          s: s,
                        ),
                        _TechChip(
                          label: 'Watch Variables',
                          color: const Color(0xFF00E676),
                          s: s,
                        ),
                        _TechChip(
                          label: 'Call Stack Analysis',
                          color: const Color(0xFFFF9F0A),
                          s: s,
                        ),
                        _TechChip(
                          label: 'Rubber Duck Debugging',
                          color: const Color(0xFFFFD54F),
                          s: s,
                        ),
                        _TechChip(
                          label: 'Binary Search (bisect)',
                          color: const Color(0xFFFF6B6B),
                          s: s,
                        ),
                        _TechChip(
                          label: 'Unit Tests',
                          color: const Color(0xFF00D9FF),
                          s: s,
                        ),
                        _TechChip(
                          label: 'Profiling',
                          color: const Color(0xFF7C4DFF),
                          s: s,
                        ),
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
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            SizedBox(width: 8 * s),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12 * s,
                fontWeight: FontWeight.w600,
              ),
            ),
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
    final cx = size.width / 2; // center X
    final totalH = size.height;

    // Distribute 6 items with generous spacing
    final boxW = (size.width * 0.55).clamp(120.0, 340.0);
    final boxH = (totalH * 0.09).clamp(28.0, 50.0);
    final gap = ((totalH - boxH * 6) / 7).clamp(12.0, 30.0);

    double yAt(int i) => gap + i * (boxH + gap) + boxH / 2;

    final steps = [
      ('1. Identificar\no Bug', const Color(0xFFFF6B6B)),
      ('2. Reproduzir\no Erro', const Color(0xFFFF9F0A)),
      ('3. Localizar\na Causa', const Color(0xFFFFD54F)),
      ('Bug\nEncontrado?', const Color(0xFF00D9FF)),
      ('5. Corrigir\no Código', const Color(0xFF00E676)),
      ('6. Testar\nSolução', const Color(0xFF7C4DFF)),
    ];

    for (int i = 0; i < steps.length; i++) {
      final (text, color) = steps[i];
      final cy = yAt(i);
      final isDecision = i == 3;
      final halfW = (isDecision ? boxW * 0.5 : boxW / 2);
      final halfH = isDecision ? boxH * 0.7 : boxH / 2;

      final paint = Paint()
        ..color = color.withValues(alpha: 0.2)
        ..style = PaintingStyle.fill;
      final borderPaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;

      if (isDecision) {
        final path = Path()
          ..moveTo(cx, cy - halfH)
          ..lineTo(cx + halfW, cy)
          ..lineTo(cx, cy + halfH)
          ..lineTo(cx - halfW, cy)
          ..close();
        canvas.drawPath(path, paint);
        canvas.drawPath(path, borderPaint);
      } else {
        final rrect = RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(cx, cy),
            width: halfW * 2,
            height: halfH * 2,
          ),
          const Radius.circular(8),
        );
        canvas.drawRRect(rrect, paint);
        canvas.drawRRect(rrect, borderPaint);
      }

      // Text
      final fontSize = (boxH * 0.28).clamp(9.0, 14.0);
      final tp = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            height: 1.3,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: halfW * 1.8);
      tp.paint(canvas, Offset(cx - tp.width / 2, cy - tp.height / 2));

      // Arrow to next (skip decision node)
      if (i < steps.length - 1 && i != 3) {
        final nextHalfH = (i + 1 == 3) ? boxH * 0.7 : boxH / 2;
        _drawArrow(
          canvas,
          Offset(cx, cy + halfH),
          Offset(cx, yAt(i + 1) - nextHalfH),
          Colors.white.withValues(alpha: 0.4),
        );
      }
    }

    // Decision node measurements
    final dY = yAt(3);
    final dHalfH = boxH * 0.7;
    final dHalfW = boxW * 0.5;

    // Yes arrow -> down to step 5
    _drawArrow(
      canvas,
      Offset(cx, dY + dHalfH),
      Offset(cx, yAt(4) - boxH / 2),
      const Color(0xFF00E676),
    );

    // No -> loop back left and up to step 2
    final loopX = cx - dHalfW - 40;
    final noPath = Path()
      ..moveTo(cx - dHalfW, dY)
      ..lineTo(loopX, dY)
      ..lineTo(loopX, yAt(1))
      ..lineTo(cx - boxW / 2, yAt(1));
    canvas.drawPath(
      noPath,
      Paint()
        ..color = const Color(0xFFFF6B6B).withValues(alpha: 0.5)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
    // Arrowhead on No loop
    final arrowTip = cx - boxW / 2;
    final arrowY = yAt(1);
    canvas.drawPath(
      Path()
        ..moveTo(arrowTip, arrowY)
        ..lineTo(arrowTip - 6, arrowY - 4)
        ..lineTo(arrowTip - 6, arrowY + 4)
        ..close(),
      Paint()..color = const Color(0xFFFF6B6B).withValues(alpha: 0.5),
    );

    // Labels
    final labelSize = (boxH * 0.26).clamp(9.0, 13.0);
    _drawText(
      canvas,
      'Sim ✓',
      Offset(cx + 10, dY + dHalfH + 2),
      const Color(0xFF00E676),
      labelSize,
    );
    _drawText(
      canvas,
      'Não ✗',
      Offset(loopX + 4, dY - labelSize - 6),
      const Color(0xFFFF6B6B),
      labelSize,
    );
  }

  void _drawArrow(Canvas canvas, Offset from, Offset to, Color color) {
    canvas.drawLine(
      from,
      to,
      Paint()
        ..color = color
        ..strokeWidth = 1.5
        ..style = PaintingStyle.stroke,
    );
  }

  void _drawText(
    Canvas canvas,
    String text,
    Offset pos,
    Color color,
    double fontSize,
  ) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, pos);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
