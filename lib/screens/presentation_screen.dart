import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/bottom_nav.dart';
import '../widgets/fullscreen_button.dart';
import '../utils/fullscreen_util.dart' as fs;
import '../slides/slide_01.dart';
import '../slides/slide_02.dart';
import '../slides/slide_03.dart';
import '../slides/slide_04.dart';
import '../slides/slide_05.dart';
import '../slides/slide_06.dart';
import '../slides/slide_07.dart';
import '../slides/slide_08.dart';
import '../slides/slide_09.dart';
import '../slides/slide_10.dart';
import '../slides/slide_11.dart';
import '../slides/slide_12.dart';
import '../slides/slide_13.dart';
import '../slides/slide_14.dart';
import '../slides/slide_15.dart';
import '../slides/slide_16.dart';
import '../slides/slide_17.dart';
import '../slides/slide_18.dart';
import '../slides/slide_19.dart';
import '../slides/slide_20.dart';
import '../slides/slide_21.dart';
import '../slides/slide_22.dart';
import '../slides/slide_23.dart';
import '../slides/slide_24.dart';
import '../slides/slide_25.dart';
import '../slides/slide_26.dart';
import '../slides/slide_27.dart';
import '../slides/slide_28.dart';
import '../slides/slide_29.dart';
import '../slides/slide_30.dart';
import '../slides/slide_31.dart';
import '../slides/slide_32.dart';
import '../slides/slide_33.dart';

const int kTotalSlides = 33;

class PresentationScreen extends StatefulWidget {
  final int initialSlide;
  const PresentationScreen({super.key, this.initialSlide = 0});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen>
    with TickerProviderStateMixin {
  late int _current;
  int _subStep = 0;
  bool _isFullscreen = false;
  final FocusNode _focus = FocusNode();

  late final AnimationController _orbCtrl;

  @override
  void initState() {
    super.initState();
    _current = widget.initialSlide;
    _orbCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
    fs.onFullscreenChange((v) {
      if (mounted) setState(() => _isFullscreen = v);
    });
  }

  @override
  void dispose() {
    _orbCtrl.dispose();
    _focus.dispose();
    super.dispose();
  }

  int _maxSubStep(int slide) {
    const map = <int, int>{
      0: 0,
      1: 0,
      2: 3,
      3: 3,
      4: 3,
      5: 0,
      6: 3,
      7: 3,
      8: 3,
      9: 0,
      10: 3,
      11: 3,
      12: 0,
      13: 2,
      14: 2,
      15: 2,
      16: 0,
      17: 2,
      18: 2,
      19: 3,
      20: 2,
      21: 0,
      22: 3,
      23: 2,
      24: 2,
      25: 0,
      26: 2,
      27: 2,
      28: 2,
      29: 0,
      30: 2,
      31: 2,
      32: 2,
    };
    return map[slide] ?? 0;
  }

  void _goTo(int index) {
    if (index < 0 || index >= kTotalSlides) return;
    setState(() {
      _current = index;
      _subStep = 0;
    });
    Navigator.of(context).pushReplacementNamed('/${index + 1}');
  }

  void _advance() {
    final max = _maxSubStep(_current);
    if (_subStep < max) {
      setState(() => _subStep++);
    } else if (_current < kTotalSlides - 1) {
      _goTo(_current + 1);
    }
  }

  void _retreat() {
    if (_subStep > 0) {
      setState(() => _subStep--);
    } else if (_current > 0) {
      _goTo(_current - 1);
    }
  }

  void _handleKey(KeyEvent e) {
    if (e is! KeyDownEvent && e is! KeyRepeatEvent) return;
    switch (e.logicalKey) {
      case LogicalKeyboardKey.arrowRight:
      case LogicalKeyboardKey.space:
      case LogicalKeyboardKey.pageDown:
        _advance();
        break;
      case LogicalKeyboardKey.arrowLeft:
      case LogicalKeyboardKey.pageUp:
        _retreat();
        break;
      case LogicalKeyboardKey.home:
        _goTo(0);
        break;
      case LogicalKeyboardKey.end:
        _goTo(kTotalSlides - 1);
        break;
      case LogicalKeyboardKey.keyF:
        fs.toggleFullscreen();
        break;
      case LogicalKeyboardKey.escape:
        if (_isFullscreen) fs.exitFullscreen();
        break;
      default:
        break;
    }
  }

  static const _kAccents = <Color>[
    Color(0xFF00D9FF), // 1 cover
    Color(0xFF00D9FF), // 2 section
    Color(0xFF00D9FF), // 3
    Color(0xFF00E676), // 4
    Color(0xFFFFD54F), // 5
    Color(0xFF7C4DFF), // 6 section
    Color(0xFF00D9FF), // 7
    Color(0xFF00E676), // 8
    Color(0xFF00D9FF), // 9
    Color(0xFFFF9F0A), // 10 section
    Color(0xFFFF6B6B), // 11
    Color(0xFF00E676), // 12
    Color(0xFF7C4DFF), // 13 debug cover
    Color(0xFF7C4DFF), // 14
    Color(0xFF7C4DFF), // 15
    Color(0xFF00D9FF), // 16
    Color(0xFF00D9FF), // 17 section
    Color(0xFF00D9FF), // 18
    Color(0xFF00D9FF), // 19
    Color(0xFF00D9FF), // 20
    Color(0xFF00D9FF), // 21
    Color(0xFF00E676), // 22 section
    Color(0xFF00E676), // 23
    Color(0xFF00E676), // 24
    Color(0xFF00E676), // 25
    Color(0xFFFF9F0A), // 26 section
    Color(0xFFFF9F0A), // 27
    Color(0xFFFF9F0A), // 28
    Color(0xFFFF9F0A), // 29
    Color(0xFFFFD54F), // 30 section
    Color(0xFFFFD54F), // 31
    Color(0xFFFFD54F), // 32
    Color(0xFF00D9FF), // 33
  ];

  @override
  Widget build(BuildContext context) {
    _focus.requestFocus();
    final accent = _kAccents[_current];

    return KeyboardListener(
      focusNode: _focus,
      autofocus: true,
      onKeyEvent: _handleKey,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Animated glow orbs
            AnimatedBuilder(
              animation: _orbCtrl,
              builder: (_, _) => CustomPaint(
                size: MediaQuery.of(context).size,
                painter: _OrbPainter(
                  progress: _orbCtrl.value,
                  color1: accent,
                  color2: _kAccents[(_current + 5) % kTotalSlides],
                ),
              ),
            ),
            // Slide content
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              child: _SlideFrame(
                key: ValueKey('slide-$_current-$_subStep'),
                slideIndex: _current,
                step: _subStep,
                accent: accent,
              ),
            ),
            // Bottom nav
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomNavBar(
                currentSlide: _current,
                totalSlides: kTotalSlides,
                onPrev: _retreat,
                onNext: _advance,
                onJump: _goTo,
                accentColor: accent,
              ),
            ),
            // Fullscreen button
            Positioned(
              top: 16,
              right: 16,
              child: FullscreenButton(
                isFullscreen: _isFullscreen,
                onTap: () => fs.toggleFullscreen(),
              ),
            ),
            // Slide badge
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: accent.withValues(alpha: 0.3)),
                ),
                child: Text(
                  '${_current + 1} / $kTotalSlides',
                  style: TextStyle(
                    color: accent,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SlideFrame extends StatelessWidget {
  final int slideIndex;
  final int step;
  final Color accent;
  const _SlideFrame({
    super.key,
    required this.slideIndex,
    required this.step,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: Stack(
        children: [
          // Corner accents
          Positioned(
            top: 12,
            left: 12,
            child: _CornerBracket(color: accent, topLeft: true),
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: _CornerBracket(color: accent, topLeft: false),
          ),
          // Actual slide
          _buildSlide(),
        ],
      ),
    );
  }

  Widget _buildSlide() {
    switch (slideIndex) {
      case 0:
        return const Slide01();
      case 1:
        return const Slide02();
      case 2:
        return Slide03(step: step);
      case 3:
        return Slide04(step: step);
      case 4:
        return Slide05(step: step);
      case 5:
        return const Slide06();
      case 6:
        return Slide07(step: step);
      case 7:
        return Slide08(step: step);
      case 8:
        return Slide09(step: step);
      case 9:
        return const Slide10();
      case 10:
        return Slide11(step: step);
      case 11:
        return Slide12(step: step);
      case 12:
        return const Slide13();
      case 13:
        return Slide14(step: step);
      case 14:
        return Slide15(step: step);
      case 15:
        return Slide16(step: step);
      case 16:
        return const Slide17();
      case 17:
        return Slide18(step: step);
      case 18:
        return Slide19(step: step);
      case 19:
        return Slide20(step: step);
      case 20:
        return Slide21(step: step);
      case 21:
        return const Slide22();
      case 22:
        return Slide23(step: step);
      case 23:
        return Slide24(step: step);
      case 24:
        return Slide25(step: step);
      case 25:
        return const Slide26();
      case 26:
        return Slide27(step: step);
      case 27:
        return Slide28(step: step);
      case 28:
        return Slide29(step: step);
      case 29:
        return const Slide30();
      case 30:
        return Slide31(step: step);
      case 31:
        return Slide32(step: step);
      case 32:
        return Slide33(step: step);
      default:
        return const Slide01();
    }
  }
}

class _CornerBracket extends StatelessWidget {
  final Color color;
  final bool topLeft;
  const _CornerBracket({required this.color, required this.topLeft});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CustomPaint(
        painter: _BracketPainter(
          color: color.withValues(alpha: 0.4),
          topLeft: topLeft,
        ),
      ),
    );
  }
}

class _BracketPainter extends CustomPainter {
  final Color color;
  final bool topLeft;
  _BracketPainter({required this.color, required this.topLeft});

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    if (topLeft) {
      canvas.drawLine(Offset(0, size.height), Offset.zero, p);
      canvas.drawLine(Offset.zero, Offset(size.width, 0), p);
    } else {
      canvas.drawLine(
        Offset(0, size.height),
        Offset(size.width, size.height),
        p,
      );
      canvas.drawLine(
        Offset(size.width, size.height),
        Offset(size.width, 0),
        p,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

class _OrbPainter extends CustomPainter {
  final double progress;
  final Color color1;
  final Color color2;
  _OrbPainter({
    required this.progress,
    required this.color1,
    required this.color2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final angle = progress * 2 * math.pi;
    final r1 = size.width * 0.15;
    final r2 = size.width * 0.12;

    // Orb 1
    final c1 = Offset(
      size.width * 0.3 + math.cos(angle) * size.width * 0.1,
      size.height * 0.3 + math.sin(angle) * size.height * 0.1,
    );
    canvas.drawCircle(
      c1,
      r1,
      Paint()
        ..shader = RadialGradient(
          colors: [
            color1.withValues(alpha: 0.08),
            color1.withValues(alpha: 0.0),
          ],
        ).createShader(Rect.fromCircle(center: c1, radius: r1)),
    );

    // Orb 2
    final c2 = Offset(
      size.width * 0.7 + math.cos(angle + math.pi) * size.width * 0.08,
      size.height * 0.7 + math.sin(angle + math.pi) * size.height * 0.08,
    );
    canvas.drawCircle(
      c2,
      r2,
      Paint()
        ..shader = RadialGradient(
          colors: [
            color2.withValues(alpha: 0.06),
            color2.withValues(alpha: 0.0),
          ],
        ).createShader(Rect.fromCircle(center: c2, radius: r2)),
    );
  }

  @override
  bool shouldRepaint(covariant _OrbPainter old) =>
      old.progress != progress || old.color1 != color1 || old.color2 != color2;
}
