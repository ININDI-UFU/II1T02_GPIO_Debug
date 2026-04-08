import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide25 extends StatelessWidget {
  final int step;
  const Slide25({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Caso de Estudo — Debug em Python',
            subtitle:
                'Exercício prático: identificar e corrigir bugs em código real',
            accentColor: const Color(0xFF00E676),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Buggy code
                Expanded(
                  flex: 50,
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _Label(
                          text: '❌ Código com Bugs:',
                          color: const Color(0xFFFF6B6B),
                          s: s,
                        ),
                        SizedBox(height: 8 * s),
                        Expanded(
                          child: CodeBlock(
                            code: '''def processar_notas(alunos):
    resultados = []
    for aluno in alunos:
        nome = aluno["nome"]
        notas = aluno["notas"]
        media = sum(notas) / len(notas)
        if media >= 7:
            status = "Aprovado"
        elif media >= 5:
            status = "Recuperação"
        else:
            status = "Reprovado"
        resultados.append({
            "nome": nome,
            "media": media,
            "status": status
        })
    return resultados

# Bug: aluno sem notas causa ZeroDivisionError
# Bug: nota inválida (string) causa TypeError
dados = [
    {"nome": "Ana", "notas": [8, 7, 9]},
    {"nome": "Bob", "notas": []},
]''',
                            language: 'python',
                            fontSize: 12 * s,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20 * s),
                // Steps to debug
                Expanded(
                  flex: 50,
                  child: AnimatedOpacity(
                    opacity: step >= 2 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _Label(
                          text: '🔍 Passos de Debug:',
                          color: const Color(0xFF00D9FF),
                          s: s,
                        ),
                        SizedBox(height: 12 * s),
                        _Step(
                          n: '1',
                          text: 'Coloque um breakpoint na linha da divisão',
                          color: const Color(0xFF00D9FF),
                          s: s,
                        ),
                        _Step(
                          n: '2',
                          text:
                              'Execute com F5 e observe o valor de notas para cada aluno',
                          color: const Color(0xFF7C4DFF),
                          s: s,
                        ),
                        _Step(
                          n: '3',
                          text:
                              'Quando notas=[], len(notas)=0 → ZeroDivisionError',
                          color: const Color(0xFFFF6B6B),
                          s: s,
                        ),
                        _Step(
                          n: '4',
                          text: 'Adicione validação: if not notas: continue',
                          color: const Color(0xFF00E676),
                          s: s,
                        ),
                        _Step(
                          n: '5',
                          text:
                              'Re-execute e confirme a correção para todos os casos',
                          color: const Color(0xFFFFD54F),
                          s: s,
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

class _Label extends StatelessWidget {
  final String text;
  final Color color;
  final double s;
  const _Label({required this.text, required this.color, required this.s});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 15 * s,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _Step extends StatelessWidget {
  final String n;
  final String text;
  final Color color;
  final double s;
  const _Step({
    required this.n,
    required this.text,
    required this.color,
    required this.s,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10 * s),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24 * s,
            height: 24 * s,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.15),
              border: Border.all(color: color.withValues(alpha: 0.4)),
            ),
            child: Center(
              child: Text(
                n,
                style: TextStyle(
                  color: color,
                  fontSize: 12 * s,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(width: 10 * s),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 13 * s,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
