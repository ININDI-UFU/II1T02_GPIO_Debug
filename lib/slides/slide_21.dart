import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide21 extends StatelessWidget {
  final int step;
  const Slide21({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Extensões Essenciais do VSCode',
            subtitle:
                'Ferramentas que potencializam o debug no Visual Studio Code',
            accentColor: const Color(0xFF00D9FF),
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: AnimatedOpacity(
              opacity: step >= 1 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: _ExtCard(
                            ext: 'Python (ms-python)',
                            desc:
                                'IntelliSense, linting e debug integrado para Python',
                            color: const Color(0xFF00E676),
                            icon: Icons.data_object_rounded,
                            s: s,
                          ),
                        ),
                        SizedBox(height: 12 * s),
                        Expanded(
                          child: _ExtCard(
                            ext: 'C/C++ (ms-vscode.cpptools)',
                            desc:
                                'Debug GDB/LLDB, IntelliSense e code navigation',
                            color: const Color(0xFF00D9FF),
                            icon: Icons.memory_rounded,
                            s: s,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 14 * s),
                  Expanded(
                    child: AnimatedOpacity(
                      opacity: step >= 2 ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: Column(
                        children: [
                          Expanded(
                            child: _ExtCard(
                              ext: 'ESP-IDF (espressif)',
                              desc:
                                  'Toolchain completo para ESP32: build, flash e debug JTAG',
                              color: const Color(0xFF7C4DFF),
                              icon: Icons.developer_board_rounded,
                              s: s,
                            ),
                          ),
                          SizedBox(height: 12 * s),
                          Expanded(
                            child: _ExtCard(
                              ext: 'PlatformIO',
                              desc:
                                  'IDE embarcado multi-plataforma com debug integrado',
                              color: const Color(0xFFFF9F0A),
                              icon: Icons.build_rounded,
                              s: s,
                            ),
                          ),
                        ],
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

class _ExtCard extends StatelessWidget {
  final String ext;
  final String desc;
  final Color color;
  final IconData icon;
  final double s;
  const _ExtCard({
    required this.ext,
    required this.desc,
    required this.color,
    required this.icon,
    required this.s,
  });

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderColor: color.withValues(alpha: 0.25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(14 * s),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.12),
            ),
            child: Icon(icon, color: color, size: 32 * s),
          ),
          SizedBox(height: 14 * s),
          Text(
            ext,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 15 * s,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6 * s),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.65),
              fontSize: 12 * s,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
