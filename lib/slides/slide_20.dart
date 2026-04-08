import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide20 extends StatelessWidget {
  final int step;
  const Slide20({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Watch, Variables & Call Stack',
            subtitle: 'Painéis de inspeção para análise detalhada do estado',
            accentColor: const Color(0xFF00D9FF),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: Row(
              children: [
                // Variables panel
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 400),
                    child: _PanelCard(
                      title: 'Variables',
                      icon: Icons.data_object_rounded,
                      color: const Color(0xFF00D9FF),
                      items: const [
                        ('Locals', 'Variáveis locais do escopo atual'),
                        ('Globals', 'Variáveis globais do programa'),
                        ('Scope', 'Expanda para ver objetos e atributos'),
                      ],
                      s: s,
                    ),
                  ),
                ),
                SizedBox(width: 14 * s),
                // Watch panel
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 2 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 400),
                    child: _PanelCard(
                      title: 'Watch',
                      icon: Icons.visibility_rounded,
                      color: const Color(0xFF00E676),
                      items: const [
                        ('Expressões', 'Avalie expressões em tempo real'),
                        ('Monitorar', 'Acompanhe valores step-by-step'),
                        ('Comparar', 'Compare antes/depois de cada linha'),
                      ],
                      s: s,
                    ),
                  ),
                ),
                SizedBox(width: 14 * s),
                // Call Stack panel
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 3 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 400),
                    child: _PanelCard(
                      title: 'Call Stack',
                      icon: Icons.layers_rounded,
                      color: const Color(0xFF7C4DFF),
                      items: const [
                        ('Stack Frames', 'Pilha hierárquica de chamadas'),
                        ('Navegar', 'Clique para ir ao contexto de cada frame'),
                        ('Threads', 'Alterne entre threads em multi-threading'),
                      ],
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

class _PanelCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<(String, String)> items;
  final double s;
  const _PanelCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.items,
    required this.s,
  });

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderColor: color.withValues(alpha: 0.25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 28 * s),
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
          ),
          Divider(color: color.withValues(alpha: 0.2), height: 24 * s),
          ...items.map(
            (e) => Padding(
              padding: EdgeInsets.only(bottom: 12 * s),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.$1,
                    style: TextStyle(
                      color: color,
                      fontSize: 13 * s,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2 * s),
                  Text(
                    e.$2,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.65),
                      fontSize: 12 * s,
                      height: 1.4,
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
