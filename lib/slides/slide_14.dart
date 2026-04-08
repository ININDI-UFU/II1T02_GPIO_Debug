import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide14 extends StatelessWidget {
  final int step;
  const Slide14({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Debug: Definição',
            subtitle:
                'O processo fundamental de identificação e correção de erros',
            accentColor: const Color(0xFF7C4DFF),
          ),
          SizedBox(height: 28 * s),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: GlassPanel(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.bug_report_rounded,
                              color: const Color(0xFF7C4DFF), size: 40 * s),
                          SizedBox(height: 16 * s),
                          Text(
                            'Debug é o processo de identificar, localizar e corrigir erros em software.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20 * s,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 20 * s),
                          _BulletPoint(
                            text:
                                'Objetivo: tornar o código confiável, eficiente e livre de falhas',
                            color: const Color(0xFF00D9FF),
                            s: s,
                          ),
                          SizedBox(height: 10 * s),
                          _BulletPoint(
                            text:
                                'Competência essencial para qualquer desenvolvedor',
                            color: const Color(0xFF00E676),
                            s: s,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20 * s),
                Expanded(
                  flex: 4,
                  child: AnimatedOpacity(
                    opacity: step >= 2 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: GlassPanel(
                      borderColor:
                          const Color(0xFFFFD54F).withValues(alpha: 0.2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.history_edu_rounded,
                                  color: const Color(0xFFFFD54F), size: 24 * s),
                              SizedBox(width: 8 * s),
                              Text(
                                'Origem Histórica',
                                style: TextStyle(
                                  color: const Color(0xFFFFD54F),
                                  fontSize: 15 * s,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12 * s),
                          Text(
                            'Grace Hopper (1947) — um inseto real encontrado em um computador Harvard Mark II.',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.75),
                              fontSize: 13 * s,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 12 * s),
                          Container(
                            padding: EdgeInsets.all(12 * s),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFD54F)
                                  .withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '"First actual case of bug being found."',
                              style: TextStyle(
                                color: const Color(0xFFFFD54F),
                                fontSize: 12 * s,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
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

class _BulletPoint extends StatelessWidget {
  final String text;
  final Color color;
  final double s;
  const _BulletPoint(
      {required this.text, required this.color, required this.s});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 6 * s),
          width: 6 * s,
          height: 6 * s,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 10 * s),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 15 * s,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
