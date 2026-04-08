import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide08 extends StatelessWidget {
  final int step;
  const Slide08({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Resistor Pull-down — Conceito e Circuito',
            subtitle:
                'Mantém o pino em LOW quando o botão não está pressionado',
            accentColor: const Color(0xFFFF9F0A),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 45,
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: GlassPanel(
                      child: Column(
                        children: [
                          Text(
                            'Esquema Elétrico — Pull-down',
                            style: TextStyle(
                              color: const Color(0xFFFF9F0A),
                              fontSize: 15 * s,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 12 * s),
                          Expanded(
                            child: CustomPaint(
                              size: Size.infinite,
                              painter: _PullDownCircuitPainter(s: s),
                            ),
                          ),
                          SizedBox(height: 8 * s),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _StateChip(
                                  label: 'Solto → LOW',
                                  color: const Color(0xFFFF6B6B),
                                  s: s),
                              SizedBox(width: 12 * s),
                              _StateChip(
                                  label: 'Pressionado → HIGH',
                                  color: const Color(0xFF00E676),
                                  s: s),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20 * s),
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
                              'O resistor conecta o pino ao GND (0V). Sem pressão no botão, '
                              'o pino permanece em LOW. Ao pressionar, o pino é puxado para VCC (HIGH).',
                          icon: Icons.info_outline_rounded,
                          accentColor: const Color(0xFFFF9F0A),
                        ),
                      ),
                      SizedBox(height: 12 * s),
                      AnimatedOpacity(
                        opacity: step >= 2 ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: InfoCard(
                          title: 'Quando Usar',
                          description:
                              'Ideal para sensores que geram sinal ativo HIGH. '
                              'A lógica é direta: pressionado = HIGH (1), solto = LOW (0).',
                          icon: Icons.check_circle_outline_rounded,
                          accentColor: const Color(0xFF00E676),
                        ),
                      ),
                      SizedBox(height: 12 * s),
                      AnimatedOpacity(
                        opacity: step >= 3 ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: InfoCard(
                          title: 'Vantagem',
                          description:
                              'Lógica direta — mais intuitiva para iniciantes. '
                              'Botão pressionado = HIGH, solto = LOW.',
                          icon: Icons.thumb_up_alt_outlined,
                          accentColor: const Color(0xFF7C4DFF),
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
      child: Text(label,
          style: TextStyle(
              color: color, fontSize: 12 * s, fontWeight: FontWeight.w700)),
    );
  }
}

class _PullDownCircuitPainter extends CustomPainter {
  final double s;
  _PullDownCircuitPainter({required this.s});

  @override
  void paint(Canvas canvas, Size size) {
    final sx = size.width / 300;
    final sy = size.height / 250;

    // VCC on top connected to button
    _drawLabel(canvas, '3.3V (VCC)', Offset(150 * sx, 12 * sy),
        const Color(0xFFFF6B6B), 11);
    canvas.drawLine(
        Offset(150 * sx, 22 * sy),
        Offset(150 * sx, 55 * sy),
        Paint()
          ..color = const Color(0xFFFF6B6B)
          ..strokeWidth = 2);

    // Button
    final btnPaint = Paint()
      ..color = const Color(0xFF7C4DFF)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
            center: Offset(150 * sx, 65 * sy), width: 40 * sx, height: 20 * sy),
        Radius.circular(4 * sx),
      ),
      btnPaint,
    );
    _drawLabel(
        canvas, 'BTN', Offset(150 * sx, 65 * sy), const Color(0xFF7C4DFF), 10);

    // Wire to GPIO node
    canvas.drawLine(
        Offset(150 * sx, 75 * sy),
        Offset(150 * sx, 120 * sy),
        Paint()
          ..color = Colors.white.withValues(alpha: 0.5)
          ..strokeWidth = 2);

    // GPIO node
    canvas.drawCircle(Offset(150 * sx, 125 * sy), 6 * sx,
        Paint()..color = const Color(0xFF00D9FF));
    _drawLabel(
        canvas, 'GPIO', Offset(170 * sx, 120 * sy), const Color(0xFF00D9FF), 12,
        align: TextAlign.left);

    // Resistor to GND
    final resPaint = Paint()
      ..color = const Color(0xFFFFD54F)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final resPath = Path()..moveTo(150 * sx, 131 * sy);
    for (int i = 0; i < 6; i++) {
      final dir = i.isEven ? 1.0 : -1.0;
      resPath.lineTo(150 * sx + dir * 12 * sx, (136 + i * 12) * sy);
    }
    resPath.lineTo(150 * sx, 204 * sy);
    canvas.drawPath(resPath, resPaint);
    _drawLabel(
        canvas, '10kΩ', Offset(180 * sx, 165 * sy), const Color(0xFFFFD54F), 11,
        align: TextAlign.left);

    // GND
    canvas.drawLine(
        Offset(150 * sx, 204 * sy),
        Offset(150 * sx, 225 * sy),
        Paint()
          ..color = const Color(0xFF00E676)
          ..strokeWidth = 2);
    for (int i = 0; i < 3; i++) {
      final w = (20 - i * 6) * sx;
      canvas.drawLine(
        Offset(150 * sx - w / 2, (227 + i * 5) * sy),
        Offset(150 * sx + w / 2, (227 + i * 5) * sy),
        Paint()
          ..color = const Color(0xFF00E676)
          ..strokeWidth = 2,
      );
    }
    _drawLabel(
        canvas, 'GND', Offset(150 * sx, 244 * sy), const Color(0xFF00E676), 11);
  }

  void _drawLabel(
      Canvas canvas, String text, Offset pos, Color color, double fontSize,
      {TextAlign align = TextAlign.center}) {
    final tp = TextPainter(
      text: TextSpan(
          text: text,
          style: TextStyle(
              color: color, fontSize: fontSize, fontWeight: FontWeight.w600)),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(
        canvas,
        Offset(
            pos.dx - (align == TextAlign.center ? tp.width / 2 : 0), pos.dy));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
