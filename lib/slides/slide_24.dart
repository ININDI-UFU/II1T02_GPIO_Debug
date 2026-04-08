import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide24 extends StatelessWidget {
  final int step;
  const Slide24({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Logging vs Debug Interativo',
            subtitle:
                'Duas abordagens complementares para diagnóstico de software',
            accentColor: const Color(0xFF00E676),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logging
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: GlassPanel(
                      borderColor: const Color(
                        0xFF00E676,
                      ).withValues(alpha: 0.25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _Header(
                            icon: Icons.article_rounded,
                            title: 'Logging',
                            color: const Color(0xFF00E676),
                            s: s,
                          ),
                          SizedBox(height: 16 * s),
                          _Bullet('Registro permanente de eventos', s),
                          _Bullet('Ideal para produção e monitoramento', s),
                          _Bullet(
                            'Diferentes níveis: DEBUG, INFO, WARNING, ERROR',
                            s,
                          ),
                          _Bullet(
                            'Pode ser enviado para arquivos ou serviços',
                            s,
                          ),
                          SizedBox(height: 16 * s),
                          CodeBlock(
                            code: '''import logging
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

logger.info("Processamento iniciado")
logger.warning("Valor inesperado")''',
                            language: 'python',
                            fontSize: 12 * s,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20 * s),
                // Debug interativo
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
                          _Header(
                            icon: Icons.bug_report_rounded,
                            title: 'Debug Interativo',
                            color: const Color(0xFF00D9FF),
                            s: s,
                          ),
                          SizedBox(height: 16 * s),
                          _Bullet('Pausa a execução em tempo real', s),
                          _Bullet('Inspeciona variáveis e call stack', s),
                          _Bullet(
                            'Ideal para desenvolvimento e investigação',
                            s,
                          ),
                          _Bullet('Controle granular step-by-step', s),
                          SizedBox(height: 16 * s),
                          Container(
                            padding: EdgeInsets.all(12 * s),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFF00D9FF,
                              ).withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '💡 Use logging em produção e debugger durante o desenvolvimento. '
                              'Ambos são complementares!',
                              style: TextStyle(
                                color: const Color(0xFF00D9FF),
                                fontSize: 12 * s,
                                height: 1.4,
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

class _Header extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final double s;
  const _Header({
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

class _Bullet extends StatelessWidget {
  final String text;
  final double s;
  const _Bullet(this.text, this.s);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6 * s),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.5),
              fontSize: 12 * s,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 13 * s,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
