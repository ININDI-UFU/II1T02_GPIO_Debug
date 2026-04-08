import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide18 extends StatelessWidget {
  final int step;
  const Slide18({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Configurando o Ambiente — launch.json',
            subtitle: 'O arquivo central de configuração do debugger no VSCode',
            accentColor: const Color(0xFF00D9FF),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Code
                Expanded(
                  flex: 50,
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('.vscode/launch.json',
                            style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.5),
                                fontSize: 12 * s,
                                fontFamily: 'Courier New')),
                        SizedBox(height: 8 * s),
                        Expanded(
                          child: CodeBlock(
                            code: '''{
  "version": "0.2.0",
  "configurations": [{
    "name": "Python: Current File",
    "type": "debugpy",
    "request": "launch",
    "program": "\${file}",
    "console": "integratedTerminal"
  }]
}''',
                            language: 'json',
                            fontSize: 13 * s,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20 * s),
                // Fields description
                Expanded(
                  flex: 50,
                  child: AnimatedOpacity(
                    opacity: step >= 2 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _FieldCard(
                              field: '"name"',
                              desc: 'Nome exibido no menu dropdown do debugger',
                              color: const Color(0xFF00D9FF),
                              s: s),
                          SizedBox(height: 8 * s),
                          _FieldCard(
                              field: '"type"',
                              desc:
                                  'Motor de debug utilizado (debugpy, node, cppdbg...)',
                              color: const Color(0xFF7C4DFF),
                              s: s),
                          SizedBox(height: 8 * s),
                          _FieldCard(
                              field: '"request"',
                              desc:
                                  'launch = inicia o programa / attach = conecta a processo',
                              color: const Color(0xFF00E676),
                              s: s),
                          SizedBox(height: 8 * s),
                          _FieldCard(
                              field: '"program"',
                              desc:
                                  'Caminho do arquivo a ser depurado (variáveis aceitas)',
                              color: const Color(0xFFFF9F0A),
                              s: s),
                          SizedBox(height: 8 * s),
                          _FieldCard(
                              field: '"console"',
                              desc: 'Terminal para I/O do programa em execução',
                              color: const Color(0xFFFF6B6B),
                              s: s),
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

class _FieldCard extends StatelessWidget {
  final String field;
  final String desc;
  final Color color;
  final double s;
  const _FieldCard(
      {required this.field,
      required this.desc,
      required this.color,
      required this.s});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12 * s),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border(left: BorderSide(color: color, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(field,
              style: TextStyle(
                  color: color,
                  fontSize: 13 * s,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Courier New')),
          SizedBox(height: 4 * s),
          Text(desc,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 12 * s,
                  height: 1.4)),
        ],
      ),
    );
  }
}
