import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide27 extends StatelessWidget {
  final int step;
  const Slide27({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Serial Monitor vs JTAG Debug',
            subtitle: 'Duas abordagens para depuração em sistemas embarcados',
            accentColor: const Color(0xFFFF9F0A),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Serial Monitor
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: GlassPanel(
                      borderColor: const Color(
                        0xFF00D9FF,
                      ).withValues(alpha: 0.2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _SectionHeader(
                            icon: Icons.monitor_rounded,
                            title: 'Serial Monitor',
                            color: const Color(0xFF00D9FF),
                            s: s,
                          ),
                          SizedBox(height: 16 * s),
                          _Feature(
                            'Print/println via Serial',
                            const Color(0xFF00D9FF),
                            s,
                          ),
                          _Feature(
                            'Monitorar variáveis, estados e erros',
                            const Color(0xFF00D9FF),
                            s,
                          ),
                          _Feature(
                            'Simples: só precisa de cabo USB',
                            const Color(0xFF00D9FF),
                            s,
                          ),
                          _Feature(
                            'Sem pausa: código continua rodando',
                            const Color(0xFF00D9FF),
                            s,
                          ),
                          SizedBox(height: 12 * s),
                          CodeBlock(
                            code: '''Serial.begin(115200);
Serial.println("Sensor: " + String(val));
Serial.printf("GPIO %d = %d\\n", pin, state);''',
                            language: 'cpp',
                            fontSize: 12 * s,
                          ),
                          SizedBox(height: 12 * s),
                          _LimitBar(
                            label: 'Limitação',
                            text: 'Timing alterado, sem breakpoints',
                            color: const Color(0xFFFFD54F),
                            s: s,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20 * s),
                // JTAG
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 2 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: GlassPanel(
                      borderColor: const Color(
                        0xFF7C4DFF,
                      ).withValues(alpha: 0.2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _SectionHeader(
                            icon: Icons.memory_rounded,
                            title: 'JTAG Debug',
                            color: const Color(0xFF7C4DFF),
                            s: s,
                          ),
                          SizedBox(height: 16 * s),
                          _Feature(
                            'Breakpoints reais no hardware',
                            const Color(0xFF7C4DFF),
                            s,
                          ),
                          _Feature(
                            'Step-through: linha a linha no código C',
                            const Color(0xFF7C4DFF),
                            s,
                          ),
                          _Feature(
                            'Inspeção de registradores e memória',
                            const Color(0xFF7C4DFF),
                            s,
                          ),
                          _Feature(
                            'Hardware necessário: probe JTAG/SWD',
                            const Color(0xFF7C4DFF),
                            s,
                          ),
                          SizedBox(height: 12 * s),
                          Container(
                            padding: EdgeInsets.all(12 * s),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFF7C4DFF,
                              ).withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ferramentas:',
                                  style: TextStyle(
                                    color: const Color(0xFF7C4DFF),
                                    fontSize: 12 * s,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 4 * s),
                                Text(
                                  '• OpenOCD + GDB\n• ESP-IDF JTAG\n• ESP-PROG adapter',
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.65),
                                    fontSize: 12 * s,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12 * s),
                          _LimitBar(
                            label: 'Custo',
                            text: 'Requer hardware de debug extra (\$20-50)',
                            color: const Color(0xFFFF9F0A),
                            s: s,
                          ),
                        ],
                      ),
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

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final double s;
  const _SectionHeader({
    required this.icon,
    required this.title,
    required this.color,
    required this.s,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 24 * s),
        SizedBox(width: 8 * s),
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 20 * s,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _Feature extends StatelessWidget {
  final String text;
  final Color color;
  final double s;
  const _Feature(this.text, this.color, this.s);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6 * s),
      child: Row(
        children: [
          Icon(Icons.check_circle_rounded, color: color, size: 14 * s),
          SizedBox(width: 6 * s),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 13 * s,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LimitBar extends StatelessWidget {
  final String label;
  final String text;
  final Color color;
  final double s;
  const _LimitBar({
    required this.label,
    required this.text,
    required this.color,
    required this.s,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10 * s),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: color, size: 16 * s),
          SizedBox(width: 6 * s),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$label: ',
                    style: TextStyle(
                      color: color,
                      fontSize: 12 * s,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: text,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 12 * s,
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
