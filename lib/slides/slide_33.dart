import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide33 extends StatelessWidget {
  final int step;
  const Slide33({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Matriz Comparativa de Debug',
            subtitle: 'Resumo geral das ferramentas e ambientes abordados',
            accentColor: const Color(0xFF00D9FF),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: AnimatedOpacity(
              opacity: step >= 1 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 600),
              child: GlassPanel(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(child: _ComparisonTable(s: s)),
                ),
              ),
            ),
          ),
          SizedBox(height: 16 * s),
          AnimatedOpacity(
            opacity: step >= 2 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(14 * s),
              decoration: BoxDecoration(
                color: const Color(0xFF00D9FF).withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF00D9FF).withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.school_rounded,
                    color: const Color(0xFF00D9FF),
                    size: 20 * s,
                  ),
                  SizedBox(width: 10 * s),
                  Expanded(
                    child: Text(
                      'Escolha a ferramenta adequada ao contexto. '
                      'O melhor debugger é aquele que você domina!',
                      style: TextStyle(
                        color: const Color(0xFF00D9FF),
                        fontSize: 13 * s,
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

class _ComparisonTable extends StatelessWidget {
  final double s;
  const _ComparisonTable({required this.s});

  @override
  Widget build(BuildContext context) {
    final headers = [
      'Aspecto',
      'VSCode',
      'Python/pdb',
      'ESP32/JTAG',
      'Jupyter',
    ];
    final headerColors = [
      Colors.white,
      const Color(0xFF00D9FF),
      const Color(0xFF00E676),
      const Color(0xFFFF9F0A),
      const Color(0xFFFFD54F),
    ];

    final rows = <List<String>>[
      [
        'Breakpoints',
        '✓ Visual',
        '✓ set_trace()',
        '✓ Hardware',
        '✓ Visual/Magic',
      ],
      ['Step-through', '✓ F10/F11', '✓ n/s/c', '✓ GDB', '✓ xpdb'],
      ['Variables', '✓ Panel', '✓ p <expr>', '✓ GDB print', '✓ Panel'],
      ['Watch', '✓ Panel', '✗ Manual', '✓ GDB watch', '✓ Panel'],
      ['Call Stack', '✓ Panel', '✓ w command', '✓ GDB bt', '✓ Panel'],
      [
        'Configuração',
        'launch.json',
        'Zero config',
        'OpenOCD + probe',
        'Kernel debug',
      ],
      [
        'Melhor para',
        'Projetos gerais',
        'Scripts rápidos',
        'Firmware/HW',
        'Data Science',
      ],
    ];

    return DataTable(
      headingRowColor: WidgetStateProperty.all(
        Colors.white.withValues(alpha: 0.05),
      ),
      dataRowColor: WidgetStateProperty.all(Colors.transparent),
      border: TableBorder.all(
        color: Colors.white.withValues(alpha: 0.08),
        width: 1,
        borderRadius: BorderRadius.circular(8),
      ),
      columnSpacing: 16 * s,
      horizontalMargin: 12 * s,
      columns: [
        for (int i = 0; i < headers.length; i++)
          DataColumn(
            label: Text(
              headers[i],
              style: TextStyle(
                color: headerColors[i],
                fontSize: 12 * s,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
      ],
      rows: [
        for (final row in rows)
          DataRow(
            cells: [
              for (int i = 0; i < row.length; i++)
                DataCell(
                  Text(
                    row[i],
                    style: TextStyle(
                      color: i == 0
                          ? Colors.white.withValues(alpha: 0.8)
                          : row[i].startsWith('✓')
                          ? headerColors[i]
                          : row[i].startsWith('✗')
                          ? const Color(0xFFFF6B6B)
                          : Colors.white.withValues(alpha: 0.6),
                      fontSize: 12 * s,
                      fontWeight: i == 0 ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
