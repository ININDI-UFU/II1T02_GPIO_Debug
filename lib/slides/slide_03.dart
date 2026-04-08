import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide03 extends StatelessWidget {
  final int step;
  const Slide03({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'O que é GPIO?',
            subtitle:
                'General Purpose Input/Output — Pinos de uso geral do microcontrolador',
            accentColor: const Color(0xFF00D9FF),
          ),
          SizedBox(height: 16 * s),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // INPUT card
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: _GpioCard(
                      title: 'INPUT (Entrada)',
                      description:
                          'Lê sinais externos:\nbotões, sensores, chaves',
                      icon: Icons.input_rounded,
                      color: const Color(0xFF00D9FF),
                      s: s,
                    ),
                  ),
                ),
                SizedBox(width: 16 * s),
                // OUTPUT card
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 2 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: _GpioCard(
                      title: 'OUTPUT (Saída)',
                      description:
                          'Controla dispositivos:\nLEDs, relés, motores',
                      icon: Icons.output_rounded,
                      color: const Color(0xFF7C4DFF),
                      s: s,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8 * s),
          // Bottom info
          AnimatedOpacity(
            opacity: step >= 3 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: GlassPanel(
              padding: EdgeInsets.all(16 * s),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Conceito Fundamental',
                    style: TextStyle(
                      color: const Color(0xFF00D9FF),
                      fontSize: 15 * s,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8 * s),
                  Text(
                    'GPIO é a interface fundamental entre o microcontrolador e o mundo físico. '
                    'Cada pino pode ser configurado individualmente como entrada ou saída via software (pinMode).',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.75),
                      fontSize: 13 * s,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 8 * s),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12 * s,
                      vertical: 6 * s,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF6B6B).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFFF6B6B).withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      '⚠ Na ESP32, os GPIOs operam a 3.3V — nunca aplicar 5V diretamente!',
                      style: TextStyle(
                        color: const Color(0xFFFF6B6B),
                        fontSize: 12 * s,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GpioCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final double s;

  const _GpioCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.s,
  });

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderColor: color.withValues(alpha: 0.3),
      padding: EdgeInsets.symmetric(horizontal: 24 * s, vertical: 16 * s),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16 * s),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.15),
            ),
            child: Icon(icon, color: color, size: 36 * s),
          ),
          SizedBox(height: 16 * s),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 20 * s,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8 * s),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 15 * s,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
