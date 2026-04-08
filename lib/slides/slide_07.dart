import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide07 extends StatelessWidget {
  final int step;
  const Slide07({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Resistor Pull-up — Conceito e Circuito',
            subtitle:
                'Mantém o pino em HIGH quando o botão não está pressionado',
            accentColor: const Color(0xFF00E676),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Circuit diagram
                Expanded(
                  flex: 45,
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: GlassPanel(
                      child: Column(
                        children: [
                          Text(
                            'Esquema Elétrico — Pull-up',
                            style: TextStyle(
                              color: const Color(0xFF00E676),
                              fontSize: 15 * s,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 12 * s),
                          Expanded(
                            child: CustomPaint(
                              size: Size.infinite,
                              painter: _PullUpCircuitPainter(s: s),
                            ),
                          ),
                          SizedBox(height: 8 * s),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _StateChip(
                                  label: 'Solto → HIGH',
                                  color: const Color(0xFF00E676),
                                  s: s),
                              SizedBox(width: 12 * s),
                              _StateChip(
                                  label: 'Pressionado → LOW',
                                  color: const Color(0xFFFF6B6B),
                                  s: s),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20 * s),
                // Description cards
                Expanded(
                  flex: 55,
                  child: Column(
                    children: [
                      AnimatedOpacity(
                        opacity: step >= 2 ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: InfoCard(
                          title: 'Como Funciona',
                          description:
                              'O resistor conecta o pino ao VCC (3.3V). Sem pressão no botão, '
                              'a corrente mantém o pino em HIGH. Ao pressionar, o pino é puxado para GND (LOW).',
                          icon: Icons.info_outline_rounded,
                          accentColor: const Color(0xFF00D9FF),
                        ),
                      ),
                      SizedBox(height: 12 * s),
                      AnimatedOpacity(
                        opacity: step >= 3 ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: InfoCard(
                          title: 'Quando Usar',
                          description:
                              'Ideal para botões que conectam ao GND quando pressionados. '
                              'Padrão mais comum em circuitos com ESP32 e Arduino.',
                          icon: Icons.check_circle_outline_rounded,
                          accentColor: const Color(0xFF00E676),
                        ),
                      ),
                      SizedBox(height: 12 * s),
                      AnimatedOpacity(
                        opacity: step >= 3 ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          padding: EdgeInsets.all(14 * s),
                          decoration: BoxDecoration(
                            color:
                                const Color(0xFFFFD54F).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFFFD54F)
                                  .withValues(alpha: 0.3),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.warning_amber_rounded,
                                  color: const Color(0xFFFFD54F), size: 20 * s),
                              SizedBox(width: 10 * s),
                              Expanded(
                                child: Text(
                                  'Lógica Invertida: botão pressionado = LOW (0), '
                                  'solto = HIGH (1). Trate no código!',
                                  style: TextStyle(
                                    color: const Color(0xFFFFD54F),
                                    fontSize: 12 * s,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Valor típico: 10kΩ • Consumo: ~0.33mA a 3.3V',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.3),
                          fontSize: 12 * s,
                        ),
                      ),
                    ],
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

class _StateChip extends StatelessWidget {
  final String label;
  final Color color;
  final double s;
  const _StateChip({required this.label, required this.color, required this.s});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12 * s, vertical: 6 * s),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: color, fontSize: 12 * s, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _PullUpCircuitPainter extends CustomPainter {
  final double s;
  _PullUpCircuitPainter({required this.s});

  @override
  void paint(Canvas canvas, Size size) {
    final sx = size.width / 300;
    final sy = size.height / 250;

    // VCC line
    final vccPaint = Paint()
      ..color = const Color(0xFFFF6B6B)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
        Offset(150 * sx, 20 * sy), Offset(150 * sx, 50 * sy), vccPaint);

    // VCC label
    _drawLabel(canvas, '3.3V (VCC)', Offset(150 * sx, 12 * sy),
        const Color(0xFFFF6B6B), 11, TextAlign.center);

    // Resistor (zigzag)
    final resPaint = Paint()
      ..color = const Color(0xFFFFD54F)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final resPath = Path();
    resPath.moveTo(150 * sx, 50 * sy);
    for (int i = 0; i < 6; i++) {
      final dir = i.isEven ? 1.0 : -1.0;
      resPath.lineTo(150 * sx + dir * 12 * sx, (55 + i * 12) * sy);
    }
    resPath.lineTo(150 * sx, 122 * sy);
    canvas.drawPath(resPath, resPaint);
    _drawLabel(canvas, '10kΩ', Offset(180 * sx, 80 * sy),
        const Color(0xFFFFD54F), 11, TextAlign.left);

    // GPIO node
    canvas.drawCircle(
      Offset(150 * sx, 130 * sy),
      6 * sx,
      Paint()..color = const Color(0xFF00D9FF),
    );
    _drawLabel(canvas, 'GPIO', Offset(170 * sx, 125 * sy),
        const Color(0xFF00D9FF), 12, TextAlign.left);

    // Wire to button
    canvas.drawLine(
      Offset(150 * sx, 136 * sy),
      Offset(150 * sx, 170 * sy),
      Paint()
        ..color = Colors.white.withValues(alpha: 0.5)
        ..strokeWidth = 2,
    );

    // Button
    final btnPaint = Paint()
      ..color = const Color(0xFF7C4DFF)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
            center: Offset(150 * sx, 185 * sy),
            width: 40 * sx,
            height: 20 * sy),
        Radius.circular(4 * sx),
      ),
      btnPaint,
    );
    _drawLabel(canvas, 'BTN', Offset(150 * sx, 185 * sy),
        const Color(0xFF7C4DFF), 10, TextAlign.center);

    // GND line
    canvas.drawLine(
      Offset(150 * sx, 195 * sy),
      Offset(150 * sx, 230 * sy),
      Paint()
        ..color = const Color(0xFF00E676)
        ..strokeWidth = 2,
    );
    // GND symbol
    for (int i = 0; i < 3; i++) {
      final w = (20 - i * 6) * sx;
      canvas.drawLine(
        Offset(150 * sx - w / 2, (232 + i * 5) * sy),
        Offset(150 * sx + w / 2, (232 + i * 5) * sy),
        Paint()
          ..color = const Color(0xFF00E676)
          ..strokeWidth = 2,
      );
    }
    _drawLabel(canvas, 'GND', Offset(150 * sx, 248 * sy),
        const Color(0xFF00E676), 11, TextAlign.center);
  }

  void _drawLabel(Canvas canvas, String text, Offset pos, Color color,
      double fontSize, TextAlign align) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
            color: color, fontSize: fontSize, fontWeight: FontWeight.w600),
      ),
      textDirection: TextDirection.ltr,
      textAlign: align,
    )..layout();
    tp.paint(
        canvas,
        Offset(
            pos.dx - (align == TextAlign.center ? tp.width / 2 : 0), pos.dy));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
