import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide23 extends StatelessWidget {
  final int step;
  const Slide23({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Python Debugger — pdb',
            subtitle: 'O depurador nativo da standard library',
            accentColor: const Color(0xFF00E676),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Code example
                Expanded(
                  flex: 45,
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: CodeBlock(
                      code: '''import pdb

def calcular_media(notas):
    pdb.set_trace()  # breakpoint
    total = sum(notas)
    n = len(notas)
    media = total / n
    return media

resultado = calcular_media([8, 7, 9])
print(f"Média: {resultado}")''',
                      language: 'python',
                      fontSize: 13 * s,
                    ),
                  ),
                ),
                SizedBox(width: 20 * s),
                // pdb commands
                Expanded(
                  flex: 55,
                  child: AnimatedOpacity(
                    opacity: step >= 2 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Comandos do pdb',
                            style: TextStyle(
                              color: const Color(0xFF00E676),
                              fontSize: 15 * s,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 12 * s),
                          _CmdRow(
                            cmd: 'n (next)',
                            desc: 'Executa a próxima linha (step over)',
                            color: const Color(0xFF00D9FF),
                            s: s,
                          ),
                          _CmdRow(
                            cmd: 's (step)',
                            desc: 'Entra na função chamada (step into)',
                            color: const Color(0xFF7C4DFF),
                            s: s,
                          ),
                          _CmdRow(
                            cmd: 'c (continue)',
                            desc: 'Continua até o próximo breakpoint',
                            color: const Color(0xFF00E676),
                            s: s,
                          ),
                          _CmdRow(
                            cmd: 'p <expr>',
                            desc: 'Imprime o valor da expressão',
                            color: const Color(0xFFFFD54F),
                            s: s,
                          ),
                          _CmdRow(
                            cmd: 'l (list)',
                            desc:
                                'Lista o código fonte ao redor da linha atual',
                            color: const Color(0xFFFF9F0A),
                            s: s,
                          ),
                          _CmdRow(
                            cmd: 'q (quit)',
                            desc: 'Encerra o debugger e o programa',
                            color: const Color(0xFFFF6B6B),
                            s: s,
                          ),
                          SizedBox(height: 16 * s),
                          AnimatedOpacity(
                            opacity: step >= 3 ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 400),
                            child: Container(
                              padding: EdgeInsets.all(12 * s),
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFF00E676,
                                ).withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color(
                                    0xFF00E676,
                                  ).withValues(alpha: 0.2),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.lightbulb_outline_rounded,
                                    color: const Color(0xFF00E676),
                                    size: 18 * s,
                                  ),
                                  SizedBox(width: 8 * s),
                                  Expanded(
                                    child: Text(
                                      'Python 3.7+: use breakpoint() ao invés de pdb.set_trace()',
                                      style: TextStyle(
                                        color: const Color(0xFF00E676),
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

class _CmdRow extends StatelessWidget {
  final String cmd;
  final String desc;
  final Color color;
  final double s;
  const _CmdRow({
    required this.cmd,
    required this.desc,
    required this.color,
    required this.s,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8 * s),
      child: Row(
        children: [
          Container(
            width: 90 * s,
            padding: EdgeInsets.symmetric(horizontal: 8 * s, vertical: 4 * s),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              cmd,
              style: TextStyle(
                color: color,
                fontSize: 12 * s,
                fontWeight: FontWeight.w700,
                fontFamily: 'Courier New',
              ),
            ),
          ),
          SizedBox(width: 10 * s),
          Expanded(
            child: Text(
              desc,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.65),
                fontSize: 12 * s,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
