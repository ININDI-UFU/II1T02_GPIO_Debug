import 'dart:math';
import 'package:flutter/material.dart';

class Slide01 extends StatefulWidget {
  const Slide01({super.key});
  @override
  State<Slide01> createState() => _Slide01State();
}

class _Slide01State extends State<Slide01> with TickerProviderStateMixin {
  late final AnimationController _gridCtrl;
  late final AnimationController _scanCtrl;
  late final AnimationController _entryCtrl;

  @override
  void initState() {
    super.initState();
    _gridCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
    _scanCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
    _entryCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..forward();
  }

  @override
  void dispose() {
    _gridCtrl.dispose();
    _scanCtrl.dispose();
    _entryCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final s = (w / 960).clamp(0.5, 1.6);

    return Stack(
      fit: StackFit.expand,
      children: [
        // Animated dot grid
        AnimatedBuilder(
          animation: _gridCtrl,
          builder: (ctx, _) => CustomPaint(
            painter: _DotGridPainter(
              phase: _gridCtrl.value,
              dotColor: const Color(0xFF00D9FF),
            ),
          ),
        ),
        // Scan line
        AnimatedBuilder(
          animation: _scanCtrl,
          builder: (ctx, _) =>
              CustomPaint(painter: _ScanLinePainter(progress: _scanCtrl.value)),
        ),
        // Center content
        Center(
          child: AnimatedBuilder(
            animation: _entryCtrl,
            builder: (ctx, _) {
              final t = CurvedAnimation(
                parent: _entryCtrl,
                curve: Curves.easeOutCubic,
              ).value;
              return Opacity(
                opacity: t.clamp(0.0, 1.0),
                child: Transform.translate(
                  offset: Offset(0, 40 * (1 - t)),
                  child: _buildContent(s),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContent(double s) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Chip IC icon
        Container(
          width: 96 * s,
          height: 96 * s,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const RadialGradient(
              colors: [Color(0xFF00D9FF), Color(0xFF0A0A0A)],
              stops: [0.0, 0.85],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00D9FF).withValues(alpha: 0.4),
                blurRadius: 50,
                spreadRadius: 10,
              ),
            ],
          ),
          child: Icon(Icons.memory_rounded, color: Colors.white, size: 50 * s),
        ),
        SizedBox(height: 32 * s),
        Text(
          'GPIO, Pull-up/Pull-down\n& Debounce',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 44 * s,
            fontWeight: FontWeight.w800,
            height: 1.2,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: 12 * s),
        Container(
          width: 100 * s,
          height: 3,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF00D9FF), Color(0xFF7C4DFF)],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(height: 16 * s),
        Text(
          'Instrumentação Industrial — ESP32',
          style: TextStyle(
            color: const Color(0xFF00D9FF).withValues(alpha: 0.7),
            fontSize: 20 * s,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
          ),
        ),
        SizedBox(height: 8 * s),
        Text(
          'Guia Completo de Depuração • VS Code • Python • Jupyter • ESP32',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.45),
            fontSize: 15 * s,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

class _DotGridPainter extends CustomPainter {
  final double phase;
  final Color dotColor;
  _DotGridPainter({required this.phase, required this.dotColor});

  @override
  void paint(Canvas canvas, Size size) {
    const spacing = 40.0;
    final paint = Paint()..style = PaintingStyle.fill;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        final dist = sqrt(
          (x - size.width / 2) * (x - size.width / 2) +
              (y - size.height / 2) * (y - size.height / 2),
        );
        final wave = sin(phase * 2 * pi + dist * 0.008);
        final alpha = (0.05 + wave * 0.04).clamp(0.01, 0.12);
        paint.color = dotColor.withValues(alpha: alpha);
        canvas.drawCircle(Offset(x, y), 1.5, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotGridPainter old) => old.phase != phase;
}

class _ScanLinePainter extends CustomPainter {
  final double progress;
  _ScanLinePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final y = progress * size.height;
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.transparent,
          const Color(0xFF00D9FF).withValues(alpha: 0.15),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, y - 1, size.width, 2));
    canvas.drawRect(Rect.fromLTWH(0, y - 1, size.width, 2), paint);
  }

  @override
  bool shouldRepaint(_ScanLinePainter old) => old.progress != progress;
}
