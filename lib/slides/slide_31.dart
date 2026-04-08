import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide31 extends StatelessWidget {
  final int step;
  const Slide31({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Ferramentas de Debug no Jupyter',
            subtitle: 'Magics, xpdb, visual debugger e técnicas interativas',
            accentColor: const Color(0xFFFFD54F),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Built-in tools
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ToolCard(
                            title: '%debug Magic',
                            desc:
                                'Post-mortem: analise exceções após ocorrência',
                            code: '%debug  # ativa após uma exceção',
                            color: const Color(0xFFFFD54F),
                            s: s,
                          ),
                          SizedBox(height: 12 * s),
                          _ToolCard(
                            title: '%%debug Cell Magic',
                            desc: 'Ativa o debugger para toda a célula',
                            code: '%%debug\nx = 10\ny = x / 0  # para aqui',
                            color: const Color(0xFF00E676),
                            s: s,
                          ),
                          SizedBox(height: 12 * s),
                          _ToolCard(
                            title: '%pdb Magic',
                            desc: 'Ativa debug automático em qualquer exceção',
                            code: '%pdb on  # auto-debug em exceções',
                            color: const Color(0xFF00D9FF),
                            s: s,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20 * s),
                // Visual debugger
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 2 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GlassPanel(
                          borderColor: const Color(
                            0xFF7C4DFF,
                          ).withValues(alpha: 0.25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.grid_view_rounded,
                                    color: const Color(0xFF7C4DFF),
                                    size: 22 * s,
                                  ),
                                  SizedBox(width: 8 * s),
                                  Text(
                                    'Visual Debugger (JupyterLab 3+)',
                                    style: TextStyle(
                                      color: const Color(0xFF7C4DFF),
                                      fontSize: 15 * s,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12 * s),
                              _Feature(
                                'Breakpoints visuais: clique na margem',
                                s,
                              ),
                              _Feature('Painel de variáveis integrado', s),
                              _Feature('Call stack e source navigation', s),
                              _Feature('Funciona com xpdb kernel', s),
                            ],
                          ),
                        ),
                        SizedBox(height: 12 * s),
                        GlassPanel(
                          borderColor: const Color(
                            0xFFFF9F0A,
                          ).withValues(alpha: 0.25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.extension_rounded,
                                    color: const Color(0xFFFF9F0A),
                                    size: 22 * s,
                                  ),
                                  SizedBox(width: 8 * s),
                                  Text(
                                    'VSCode Jupyter Debug',
                                    style: TextStyle(
                                      color: const Color(0xFFFF9F0A),
                                      fontSize: 15 * s,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12 * s),
                              _Feature(
                                'Debug célula a célula via Ctrl+Shift+Alt+Enter',
                                s,
                              ),
                              _Feature(
                                'Breakpoints idênticos ao debug Python normal',
                                s,
                              ),
                              _Feature('Panel Variables e Watch integrado', s),
                            ],
                          ),
                        ),
                      ],
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

class _ToolCard extends StatelessWidget {
  final String title;
  final String desc;
  final String code;
  final Color color;
  final double s;
  const _ToolCard({
    required this.title,
    required this.desc,
    required this.code,
    required this.color,
    required this.s,
  });

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderColor: color.withValues(alpha: 0.2),
      padding: EdgeInsets.all(14 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 15 * s,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4 * s),
          Text(
            desc,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.65),
              fontSize: 12 * s,
            ),
          ),
          SizedBox(height: 8 * s),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8 * s),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              code,
              style: TextStyle(
                color: color,
                fontSize: 12 * s,
                fontFamily: 'Courier New',
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Feature extends StatelessWidget {
  final String text;
  final double s;
  const _Feature(this.text, this.s);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5 * s),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline_rounded,
            color: Colors.white.withValues(alpha: 0.5),
            size: 14 * s,
          ),
          SizedBox(width: 6 * s),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 12 * s,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
