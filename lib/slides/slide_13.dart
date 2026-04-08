import 'package:flutter/material.dart';

class Slide13 extends StatefulWidget {
  const Slide13({super.key});
  @override
  State<Slide13> createState() => _Slide13State();
}

class _Slide13State extends State<Slide13> with SingleTickerProviderStateMixin {
  late final AnimationController _entryCtrl;

  @override
  void initState() {
    super.initState();
    _entryCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();
  }

  @override
  void dispose() {
    _entryCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return AnimatedBuilder(
      animation: _entryCtrl,
      builder: (ctx, _) {
        final t = CurvedAnimation(
          parent: _entryCtrl,
          curve: Curves.easeOutCubic,
        ).value;
        return Stack(
          fit: StackFit.expand,
          children: [
            // Grid background
            CustomPaint(painter: _DebugGridPainter()),
            Center(
              child: Opacity(
                opacity: t.clamp(0.0, 1.0),
                child: Transform.translate(
                  offset: Offset(0, 30 * (1 - t)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20 * s),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const RadialGradient(
                            colors: [Color(0xFF7C4DFF), Color(0xFF0A0A0A)],
                            stops: [0.0, 0.85],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xFF7C4DFF,
                              ).withValues(alpha: 0.4),
                              blurRadius: 50,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.bug_report_rounded,
                          color: Colors.white,
                          size: 56 * s,
                        ),
                      ),
                      SizedBox(height: 32 * s),
                      Text(
                        'Debug',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 54 * s,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1,
                        ),
                      ),
                      SizedBox(height: 12 * s),
                      Container(
                        width: 100 * s,
                        height: 3,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF7C4DFF), Color(0xFF00D9FF)],
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      SizedBox(height: 20 * s),
                      Text(
                        'Guia Completo de Depuração',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 24 * s,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12 * s),
                      Text(
                        'VS Code  •  Python  •  Jupyter  •  ESP32',
                        style: TextStyle(
                          color: const Color(0xFF7C4DFF).withValues(alpha: 0.8),
                          fontSize: 17 * s,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DebugGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF7C4DFF).withValues(alpha: 0.04)
      ..strokeWidth = 0.5;
    const spacing = 50.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
