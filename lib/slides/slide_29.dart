import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide29 extends StatelessWidget {
  final int step;
  const Slide29({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'ESP32-S3 e ESP32-C3 — USB nativo',
            subtitle: 'Debug USB-JTAG integrado sem hardware externo',
            accentColor: const Color(0xFFFF9F0A),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ESP32-S3
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: GlassPanel(
                      borderColor: const Color(
                        0xFF7C4DFF,
                      ).withValues(alpha: 0.2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ChipHeader(
                            label: 'ESP32-S3',
                            color: const Color(0xFF7C4DFF),
                            s: s,
                          ),
                          SizedBox(height: 14 * s),
                          _Feat('CPU Xtensa LX7 — Dual Core', s),
                          _Feat('USB OTG nativo + USB-Serial-JTAG', s),
                          _Feat('WiFi + BLE 5.0', s),
                          _Feat('Debug via USB sem adaptador', s),
                          SizedBox(height: 12 * s),
                          Container(
                            padding: EdgeInsets.all(10 * s),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFF7C4DFF,
                              ).withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Ideal para projetos com AI/ML, câmera e USB Host',
                              style: TextStyle(
                                color: const Color(0xFF7C4DFF),
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
                // ESP32-C3
                Expanded(
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 700),
                    child: GlassPanel(
                      borderColor: const Color(
                        0xFF00E676,
                      ).withValues(alpha: 0.2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ChipHeader(
                            label: 'ESP32-C3',
                            color: const Color(0xFF00E676),
                            s: s,
                          ),
                          SizedBox(height: 14 * s),
                          _Feat('CPU RISC-V — Single Core', s),
                          _Feat('USB-Serial-JTAG integrado', s),
                          _Feat('WiFi + BLE 5.0', s),
                          _Feat('Debug via USB nativo', s),
                          SizedBox(height: 12 * s),
                          Container(
                            padding: EdgeInsets.all(10 * s),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFF00E676,
                              ).withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Opção econômica com RISC-V open-source e debug integrado',
                              style: TextStyle(
                                color: const Color(0xFF00E676),
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
          SizedBox(height: 16 * s),
          // Bottom tip
          AnimatedOpacity(
            opacity: step >= 2 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(14 * s),
              decoration: BoxDecoration(
                color: const Color(0xFFFF9F0A).withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFFFF9F0A).withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.usb_rounded,
                    color: const Color(0xFFFF9F0A),
                    size: 20 * s,
                  ),
                  SizedBox(width: 10 * s),
                  Expanded(
                    child: Text(
                      'Ambos possuem USB-Serial-JTAG: conecte o USB e faça debug diretamente sem ESP-PROG.',
                      style: TextStyle(
                        color: const Color(0xFFFF9F0A),
                        fontSize: 12 * s,
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

class _ChipHeader extends StatelessWidget {
  final String label;
  final Color color;
  final double s;
  const _ChipHeader({
    required this.label,
    required this.color,
    required this.s,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.memory_rounded, color: color, size: 28 * s),
        SizedBox(width: 8 * s),
        Text(
          label,
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

class _Feat extends StatelessWidget {
  final String text;
  final double s;
  const _Feat(this.text, this.s);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6 * s),
      child: Row(
        children: [
          Icon(
            Icons.check_rounded,
            color: Colors.white.withValues(alpha: 0.5),
            size: 14 * s,
          ),
          SizedBox(width: 6 * s),
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
