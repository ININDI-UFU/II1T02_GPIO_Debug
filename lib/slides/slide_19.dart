import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide19 extends StatelessWidget {
  final int step;
  const Slide19({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Breakpoints & Controles de Navegação',
            subtitle:
                'Ferramentas essenciais para controlar a execução do programa',
            accentColor: const Color(0xFF00D9FF),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Navigation controls
                Expanded(
                  flex: 50,
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Controles de Navegação',
                            style: TextStyle(
                                color: const Color(0xFF00D9FF),
                                fontSize: 15 * s,
                                fontWeight: FontWeight.w700)),
                        SizedBox(height: 12 * s),
                        _ControlItem(
                            key_: 'F5',
                            label: 'Continue',
                            desc: 'Retoma até o próximo breakpoint',
                            color: const Color(0xFF00E676),
                            s: s),
                        _ControlItem(
                            key_: 'F10',
                            label: 'Step Over',
                            desc: 'Executa a linha sem entrar na função',
                            color: const Color(0xFF00D9FF),
                            s: s),
                        _ControlItem(
                            key_: 'F11',
                            label: 'Step Into',
                            desc: 'Entra dentro da função chamada',
                            color: const Color(0xFF7C4DFF),
                            s: s),
                        _ControlItem(
                            key_: '⇧F11',
                            label: 'Step Out',
                            desc: 'Sai da função atual para o caller',
                            color: const Color(0xFFFF9F0A),
                            s: s),
                        _ControlItem(
                            key_: '⇧⌘F5',
                            label: 'Restart',
                            desc: 'Reinicia a sessão de debug do zero',
                            color: const Color(0xFFFFD54F),
                            s: s),
                        _ControlItem(
                            key_: '⇧F5',
                            label: 'Stop',
                            desc: 'Encerra a sessão de depuração',
                            color: const Color(0xFFFF6B6B),
                            s: s),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20 * s),
                // Breakpoint types
                Expanded(
                  flex: 50,
                  child: AnimatedOpacity(
                    opacity: step >= 2 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tipos de Breakpoints',
                            style: TextStyle(
                                color: const Color(0xFF7C4DFF),
                                fontSize: 15 * s,
                                fontWeight: FontWeight.w700)),
                        SizedBox(height: 12 * s),
                        _BpCard(
                            icon: '●',
                            title: 'Standard',
                            desc:
                                'Ponto de parada fixo em uma linha específica',
                            color: const Color(0xFFFF6B6B),
                            s: s),
                        SizedBox(height: 8 * s),
                        _BpCard(
                            icon: '◆',
                            title: 'Conditional',
                            desc: 'Para apenas quando a condição é verdadeira',
                            color: const Color(0xFFFF9F0A),
                            s: s),
                        SizedBox(height: 8 * s),
                        _BpCard(
                            icon: '◇',
                            title: 'Logpoint',
                            desc: 'Loga uma mensagem sem parar a execução',
                            color: const Color(0xFF00D9FF),
                            s: s),
                        SizedBox(height: 8 * s),
                        _BpCard(
                            icon: '⊕',
                            title: 'Hit Count',
                            desc: 'Para após N execuções da mesma linha',
                            color: const Color(0xFF00E676),
                            s: s),
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

class _ControlItem extends StatelessWidget {
  final String key_;
  final String label;
  final String desc;
  final Color color;
  final double s;
  const _ControlItem(
      {required this.key_,
      required this.label,
      required this.desc,
      required this.color,
      required this.s});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8 * s),
      child: Row(
        children: [
          Container(
            width: 48 * s,
            height: 28 * s,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: color.withValues(alpha: 0.3)),
            ),
            child: Center(
                child: Text(key_,
                    style: TextStyle(
                        color: color,
                        fontSize: 10 * s,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Courier New'))),
          ),
          SizedBox(width: 10 * s),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(
                        color: color,
                        fontSize: 12 * s,
                        fontWeight: FontWeight.w700)),
                Text(desc,
                    style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.6),
                        fontSize: 12 * s)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BpCard extends StatelessWidget {
  final String icon;
  final String title;
  final String desc;
  final Color color;
  final double s;
  const _BpCard(
      {required this.icon,
      required this.title,
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
      child: Row(
        children: [
          Text(icon, style: TextStyle(color: color, fontSize: 20 * s)),
          SizedBox(width: 10 * s),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      color: color,
                      fontSize: 13 * s,
                      fontWeight: FontWeight.w700)),
              Text(desc,
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.65),
                      fontSize: 12 * s)),
            ],
          )),
        ],
      ),
    );
  }
}
