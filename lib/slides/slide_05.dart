import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide05 extends StatefulWidget {
  final int step;
  const Slide05({super.key, this.step = 0});

  @override
  State<Slide05> createState() => _Slide05State();
}

class _Slide05State extends State<Slide05> with SingleTickerProviderStateMixin {
  late final AnimationController _waveCtrl;

  @override
  void initState() {
    super.initState();
    _waveCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _waveCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Problema: Entradas Flutuantes',
            subtitle:
                'O que acontece quando um pino GPIO não tem referência definida?',
            accentColor: const Color(0xFFFF6B6B),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: Row(
              children: [
                // Waveform animation
                Expanded(
                  flex: 5,
                  child: AnimatedOpacity(
                    opacity: widget.step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: GlassPanel(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sinal Flutuante (sem pull-up/down)',
                            style: TextStyle(
                              color: const Color(0xFFFF6B6B),
                              fontSize: 15 * s,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 12 * s),
                          Expanded(
                            child: AnimatedBuilder(
                              animation: _waveCtrl,
                              builder: (ctx, _) => CustomPaint(
                                size: Size.infinite,
                                painter: _FloatingWavePainter(
                                  phase: _waveCtrl.value,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8 * s),
                          Text(
                            'O pino oscila aleatoriamente entre HIGH e LOW',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.5),
                              fontSize: 12 * s,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20 * s),
                // Explanation
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedOpacity(
                        opacity: widget.step >= 2 ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: InfoCard(
                          title: 'Por que isso acontece?',
                          description:
                              'Sem resistor pull-up ou pull-down, o pino fica em '
                              'alta impedância e capta ruído eletromagnético do ambiente, '
                              'gerando leituras imprevisíveis.',
                          icon: Icons.help_outline_rounded,
                          accentColor: const Color(0xFFFFD54F),
                        ),
                      ),
                      SizedBox(height: 16 * s),
                      AnimatedOpacity(
                        opacity: widget.step >= 3 ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: InfoCard(
                          title: 'Solução',
                          description:
                              'Utilizar resistores pull-up ou pull-down para '
                              'definir um estado padrão estável no pino quando o botão '
                              'não está pressionado.',
                          icon: Icons.lightbulb_outline_rounded,
                          accentColor: const Color(0xFF00E676),
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

class _FloatingWavePainter extends CustomPainter {
  final double phase;
  _FloatingWavePainter({required this.phase});

  @override
  void paint(Canvas canvas, Size size) {
    // Grid
    final gridPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.06)
      ..strokeWidth = 0.5;
    for (int i = 0; i <= 4; i++) {
      final y = size.height * i / 4;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // Random-looking noisy wave
    final wavePaint = Paint()
      ..color = const Color(0xFFFF6B6B)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    final rng = Random(42);
    for (int x = 0; x <= size.width.toInt(); x++) {
      final t = x / size.width;
      final noise = rng.nextDouble() * 0.6 - 0.3;
      final wave = sin(t * 12 * pi + phase * 2 * pi) * 0.3;
      final y =
          size.height * (0.5 + wave + noise * sin(phase * 4 * pi + t * 8));
      if (x == 0) {
        path.moveTo(x.toDouble(), y.clamp(0, size.height));
      } else {
        path.lineTo(x.toDouble(), y.clamp(0, size.height));
      }
    }
    canvas.drawPath(path, wavePaint);

    // Reference lines
    final highPaint = Paint()
      ..color = const Color(0xFF00D9FF).withValues(alpha: 0.3)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(0, size.height * 0.15),
      Offset(size.width, size.height * 0.15),
      highPaint..color = const Color(0xFF00E676).withValues(alpha: 0.3),
    );
    canvas.drawLine(
      Offset(0, size.height * 0.85),
      Offset(size.width, size.height * 0.85),
      highPaint..color = const Color(0xFFFF6B6B).withValues(alpha: 0.3),
    );

    // Labels
    final tp1 = TextPainter(
      text: const TextSpan(
        text: 'HIGH (3.3V)',
        style: TextStyle(color: Color(0xFF00E676), fontSize: 10),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp1.paint(canvas, Offset(4, size.height * 0.15 - 14));

    final tp2 = TextPainter(
      text: const TextSpan(
        text: 'LOW (0V)',
        style: TextStyle(color: Color(0xFFFF6B6B), fontSize: 10),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp2.paint(canvas, Offset(4, size.height * 0.85 + 2));
  }

  @override
  bool shouldRepaint(_FloatingWavePainter old) => old.phase != phase;
}
