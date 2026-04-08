import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide11 extends StatefulWidget {
  final int step;
  const Slide11({super.key, this.step = 0});

  @override
  State<Slide11> createState() => _Slide11State();
}

class _Slide11State extends State<Slide11> with SingleTickerProviderStateMixin {
  late final AnimationController _waveCtrl;

  @override
  void initState() {
    super.initState();
    _waveCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
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
            title: 'O que é Bouncing?',
            subtitle:
                'Problema físico de contatos mecânicos em botões e chaves',
            accentColor: const Color(0xFFFF6B6B),
          ),
          SizedBox(height: 20 * s),
          Expanded(
            child: Row(
              children: [
                // Waveform: clean vs bouncing
                Expanded(
                  flex: 5,
                  child: AnimatedOpacity(
                    opacity: widget.step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: GlassPanel(
                      child: Column(
                        children: [
                          Text(
                            'Sinal com Bouncing vs Sinal Limpo',
                            style: TextStyle(
                              color: const Color(0xFFFF6B6B),
                              fontSize: 13 * s,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 8 * s),
                          Expanded(
                            child: AnimatedBuilder(
                              animation: _waveCtrl,
                              builder: (ctx, _) => CustomPaint(
                                size: Size.infinite,
                                painter: _BouncingWavePainter(
                                  phase: _waveCtrl.value,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 6 * s),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _Legend(
                                color: const Color(0xFFFF6B6B),
                                label: 'Com bounce',
                                s: s,
                              ),
                              SizedBox(width: 16 * s),
                              _Legend(
                                color: const Color(0xFF00E676),
                                label: 'Sinal ideal',
                                s: s,
                              ),
                            ],
                          ),
                          SizedBox(height: 4 * s),
                          Text(
                            'Duração típica: 1ms a 10ms',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.4),
                              fontSize: 10 * s,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20 * s),
                // Info cards
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      AnimatedOpacity(
                        opacity: widget.step >= 2 ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: InfoCard(
                          title: 'Problema Físico',
                          description:
                              'Ao pressionar um botão, os contatos metálicos vibram '
                              'rapidamente (~1-5ms), gerando múltiplas transições HIGH/LOW.',
                          icon: Icons.warning_amber_rounded,
                          accentColor: const Color(0xFFFF6B6B),
                        ),
                      ),
                      SizedBox(height: 12 * s),
                      AnimatedOpacity(
                        opacity: widget.step >= 2 ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 700),
                        child: InfoCard(
                          title: 'Impacto no Código',
                          description:
                              'Cada bounce é interpretado como uma pressão separada. '
                              'Um clique pode gerar 5-10 eventos falsos no digitalRead().',
                          icon: Icons.bug_report_rounded,
                          accentColor: const Color(0xFFFFD54F),
                        ),
                      ),
                      SizedBox(height: 12 * s),
                      AnimatedOpacity(
                        opacity: widget.step >= 3 ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: InfoCard(
                          title: 'Solução: Debounce',
                          description:
                              'Técnicas de software (millis) ou hardware (capacitor RC) '
                              'filtram as oscilações e entregam um sinal limpo.',
                          icon: Icons.check_circle_rounded,
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

class _Legend extends StatelessWidget {
  final Color color;
  final String label;
  final double s;
  const _Legend({required this.color, required this.label, required this.s});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 12 * s, height: 3, color: color),
        SizedBox(width: 6 * s),
        Text(
          label,
          style: TextStyle(color: color, fontSize: 10 * s),
        ),
      ],
    );
  }
}

class _BouncingWavePainter extends CustomPainter {
  final double phase;
  _BouncingWavePainter({required this.phase});

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height;
    final w = size.width;

    // Grid
    final gridPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.06)
      ..strokeWidth = 0.5;
    for (int i = 0; i <= 4; i++) {
      canvas.drawLine(Offset(0, h * i / 4), Offset(w, h * i / 4), gridPaint);
    }

    // HIGH/LOW labels
    final high = h * 0.15;
    final low = h * 0.85;

    // Clean signal (green)
    final cleanPaint = Paint()
      ..color = const Color(0xFF00E676).withValues(alpha: 0.6)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final cleanPath = Path()..moveTo(0, low);
    // low -> high transition at 30%
    cleanPath.lineTo(w * 0.3, low);
    cleanPath.lineTo(w * 0.3, high);
    cleanPath.lineTo(w * 0.7, high);
    cleanPath.lineTo(w * 0.7, low);
    cleanPath.lineTo(w, low);
    canvas.drawPath(cleanPath, cleanPaint);

    // Bouncing signal (red)
    final bouncePaint = Paint()
      ..color = const Color(0xFFFF6B6B)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final bouncePath = Path()..moveTo(0, low);
    bouncePath.lineTo(w * 0.28, low);

    // Bounce zone at transition
    final rng = Random(42);
    final bounceStart = w * 0.28;
    final bounceEnd = w * 0.38;
    for (double x = bounceStart; x <= bounceEnd; x += 3) {
      final t = (x - bounceStart) / (bounceEnd - bounceStart);
      final target = high + (low - high) * (1 - t);
      final bounce = rng.nextBool() ? high : low;
      final y = t < 0.5 ? bounce : target.clamp(high, low);
      bouncePath.lineTo(x, y);
    }
    bouncePath.lineTo(w * 0.38, high);
    bouncePath.lineTo(w * 0.65, high);

    // Bounce at release
    final releaseStart = w * 0.65;
    final releaseEnd = w * 0.75;
    for (double x = releaseStart; x <= releaseEnd; x += 3) {
      final t = (x - releaseStart) / (releaseEnd - releaseStart);
      final bounce = rng.nextBool() ? high : low;
      final target = low + (high - low) * (1 - t);
      final y = t < 0.5 ? bounce : target.clamp(high, low);
      bouncePath.lineTo(x, y);
    }
    bouncePath.lineTo(w * 0.75, low);
    bouncePath.lineTo(w, low);
    canvas.drawPath(bouncePath, bouncePaint);

    // Bounce zone indicators
    final zonePaint = Paint()
      ..color = const Color(0xFFFF6B6B).withValues(alpha: 0.1)
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTRB(bounceStart, 0, w * 0.38, h), zonePaint);
    canvas.drawRect(Rect.fromLTRB(releaseStart, 0, w * 0.75, h), zonePaint);
  }

  @override
  bool shouldRepaint(_BouncingWavePainter old) => false;
}
