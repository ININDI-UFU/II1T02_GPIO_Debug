import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide09 extends StatelessWidget {
  final int step;
  const Slide09({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Comparação: Pull-up vs Pull-down',
            subtitle: 'Diferenças práticas e quando usar cada configuração',
            accentColor: const Color(0xFF00D9FF),
          ),
          SizedBox(height: 24 * s),
          // Table
          Expanded(
            child: AnimatedOpacity(
              opacity: step >= 1 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Column(
                children: [
                  _buildTable(s),
                  SizedBox(height: 20 * s),
                  // Bottom: Internal vs External
                  AnimatedOpacity(
                    opacity: step >= 2 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Row(
                      children: [
                        Expanded(
                          child: InfoCard(
                            title: 'Interno (ESP32)',
                            description: 'Ativado via software (INPUT_PULLUP)\n'
                                '~45kΩ — suficiente para maioria dos casos\n'
                                'Simplifica o circuito (sem componente extra)',
                            icon: Icons.memory_rounded,
                            accentColor: const Color(0xFF00D9FF),
                          ),
                        ),
                        SizedBox(width: 16 * s),
                        Expanded(
                          child: InfoCard(
                            title: 'Externo (Resistor Físico)',
                            description:
                                'Valor exato (ex: 10kΩ) — maior precisão\n'
                                'Necessário em cabos longos ou ambientes ruidosos\n'
                                'Recomendado para produção',
                            icon: Icons.device_hub_rounded,
                            accentColor: const Color(0xFFFF9F0A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16 * s),
                  AnimatedOpacity(
                    opacity: step >= 3 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: CodeBlock(
                      code:
                          'pinMode(BTN, INPUT_PULLUP);    // Pull-up interno\n'
                          'pinMode(BTN, INPUT_PULLDOWN);  // Pull-down interno',
                      language: 'cpp',
                      fontSize: 13 * s,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Dica: Para prototipagem, use interno. Para produção, prefira externo.',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.35),
                      fontSize: 12 * s,
                      fontStyle: FontStyle.italic,
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

  Widget _buildTable(double s) {
    const headers = ['Característica', 'Pull-up', 'Pull-down'];
    const rows = [
      ['Estado padrão (solto)', 'HIGH (3.3V)', 'LOW (0V)'],
      ['Ao pressionar', 'LOW (0V)', 'HIGH (3.3V)'],
      ['Lógica', 'Invertida', 'Direta'],
      ['Uso típico', 'Botões ao GND', 'Sensores ativos HIGH'],
      ['Interno na ESP32?', 'Sim (INPUT_PULLUP)', 'Sim (INPUT_PULLDOWN)'],
    ];

    return GlassPanel(
      padding: EdgeInsets.all(2 * s),
      child: Table(
        border: TableBorder.all(
          color: Colors.white.withValues(alpha: 0.08),
          width: 0.5,
        ),
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(2),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: const Color(0xFF00D9FF).withValues(alpha: 0.1),
            ),
            children: headers
                .map((h) => Padding(
                      padding: EdgeInsets.all(10 * s),
                      child: Text(h,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF00D9FF),
                            fontSize: 12 * s,
                            fontWeight: FontWeight.w700,
                          )),
                    ))
                .toList(),
          ),
          ...rows.map(
            (row) => TableRow(
              children: row.asMap().entries.map((e) {
                final isFirst = e.key == 0;
                return Padding(
                  padding: EdgeInsets.all(8 * s),
                  child: Text(
                    e.value,
                    textAlign: isFirst ? TextAlign.left : TextAlign.center,
                    style: TextStyle(
                      color: isFirst
                          ? Colors.white.withValues(alpha: 0.7)
                          : Colors.white.withValues(alpha: 0.85),
                      fontSize: 13 * s,
                      fontWeight: isFirst ? FontWeight.w500 : FontWeight.w600,
                      fontFamily: isFirst ? null : 'Courier New',
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
