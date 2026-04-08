import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide32 extends StatelessWidget {
  final int step;
  const Slide32({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Jupyter vs IDE — Quando usar?',
            subtitle: 'Cenários ideais para cada ambiente de desenvolvimento',
            accentColor: const Color(0xFFFFD54F),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Jupyter
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: GlassPanel(
                      borderColor: const Color(
                        0xFFFFD54F,
                      ).withValues(alpha: 0.25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.science_rounded,
                                color: const Color(0xFFFFD54F),
                                size: 24 * s,
                              ),
                              SizedBox(width: 8 * s),
                              Text(
                                'Jupyter Notebook',
                                style: TextStyle(
                                  color: const Color(0xFFFFD54F),
                                  fontSize: 15 * s,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: const Color(
                              0xFFFFD54F,
                            ).withValues(alpha: 0.2),
                            height: 20 * s,
                          ),
                          _Use(
                            'Exploração rápida de dados',
                            const Color(0xFFFFD54F),
                            s,
                          ),
                          _Use(
                            'Visualizações e gráficos inline',
                            const Color(0xFFFFD54F),
                            s,
                          ),
                          _Use(
                            'Prototipagem e experimentação',
                            const Color(0xFFFFD54F),
                            s,
                          ),
                          _Use(
                            'Machine Learning / Data Science',
                            const Color(0xFFFFD54F),
                            s,
                          ),
                          _Use(
                            'Documentação interativa',
                            const Color(0xFFFFD54F),
                            s,
                          ),
                          SizedBox(height: 12 * s),
                          Container(
                            padding: EdgeInsets.all(10 * s),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFFFFD54F,
                              ).withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Melhor para: exploração iterativa e resultados visuais rápidos.',
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
                SizedBox(width: 20 * s),
                // IDE
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 2 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: GlassPanel(
                      borderColor: const Color(
                        0xFF00D9FF,
                      ).withValues(alpha: 0.25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.code_rounded,
                                color: const Color(0xFF00D9FF),
                                size: 24 * s,
                              ),
                              SizedBox(width: 8 * s),
                              Text(
                                'IDE (VSCode / PyCharm)',
                                style: TextStyle(
                                  color: const Color(0xFF00D9FF),
                                  fontSize: 15 * s,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: const Color(
                              0xFF00D9FF,
                            ).withValues(alpha: 0.2),
                            height: 20 * s,
                          ),
                          _Use(
                            'Projetos de produção com múltiplos arquivos',
                            const Color(0xFF00D9FF),
                            s,
                          ),
                          _Use(
                            'Debug avançado com breakpoints',
                            const Color(0xFF00D9FF),
                            s,
                          ),
                          _Use(
                            'Refatoração e code navigation',
                            const Color(0xFF00D9FF),
                            s,
                          ),
                          _Use(
                            'Git integration e CI/CD',
                            const Color(0xFF00D9FF),
                            s,
                          ),
                          _Use(
                            'Sistemas embarcados e firmware',
                            const Color(0xFF00D9FF),
                            s,
                          ),
                          SizedBox(height: 12 * s),
                          Container(
                            padding: EdgeInsets.all(10 * s),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFF00D9FF,
                              ).withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Melhor para: code robustos com testes, CI e deploy.',
                              style: TextStyle(
                                color: const Color(0xFF00D9FF),
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

class _Use extends StatelessWidget {
  final String text;
  final Color color;
  final double s;
  const _Use(this.text, this.color, this.s);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6 * s),
      child: Row(
        children: [
          Icon(Icons.arrow_right_rounded, color: color, size: 18 * s),
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
