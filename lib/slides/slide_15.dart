import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide15 extends StatelessWidget {
  final int step;
  const Slide15({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Tipos de Erros',
            subtitle:
                '4 categorias principais que todo desenvolvedor precisa conhecer',
            accentColor: const Color(0xFF7C4DFF),
          ),
          SizedBox(height: 28 * s),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 400),
                    child: _ErrorCard(
                      icon: '{ }',
                      title: 'Erro de Sintaxe',
                      description: 'Código mal escrito que impede a compilação',
                      color: const Color(0xFFFF6B6B),
                      s: s,
                    ),
                  ),
                ),
                SizedBox(width: 14 * s),
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 600),
                    child: _ErrorCard(
                      icon: '?!',
                      title: 'Erro de Lógica',
                      description:
                          'Código roda, mas produz resultados incorretos',
                      color: const Color(0xFF7C4DFF),
                      s: s,
                    ),
                  ),
                ),
                SizedBox(width: 14 * s),
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 2 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 400),
                    child: _ErrorCard(
                      icon: '⚡',
                      title: 'Erro de Runtime',
                      description: 'Falha durante execução: exceções e crashes',
                      color: const Color(0xFFFFD54F),
                      s: s,
                    ),
                  ),
                ),
                SizedBox(width: 14 * s),
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 2 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 600),
                    child: _ErrorCard(
                      icon: '∞',
                      title: 'Erro de Recurso',
                      description: 'Memory leaks, deadlocks e race conditions',
                      color: const Color(0xFF00E676),
                      s: s,
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

class _ErrorCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final Color color;
  final double s;

  const _ErrorCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.s,
  });

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderColor: color.withValues(alpha: 0.25),
      padding: EdgeInsets.all(20 * s),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60 * s,
            height: 60 * s,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.15),
              border: Border.all(color: color.withValues(alpha: 0.3)),
            ),
            child: Center(
              child: Text(
                icon,
                style: TextStyle(
                  color: color,
                  fontSize: 24 * s,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          SizedBox(height: 16 * s),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 15 * s,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8 * s),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 13 * s,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
