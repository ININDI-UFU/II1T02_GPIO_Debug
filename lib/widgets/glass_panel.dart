import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs2015.dart';

class GlassPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color? borderColor;
  final double borderRadius;

  const GlassPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.borderColor,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor ?? Colors.white.withValues(alpha: 0.12),
              width: 0.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class CodeBlock extends StatelessWidget {
  final String code;
  final String language;
  final double fontSize;

  const CodeBlock({
    super.key,
    required this.code,
    this.language = 'cpp',
    this.fontSize = 13,
  });

  static const _langMap = {
    'cpp': 'arduino',
    'c': 'arduino',
    'arduino': 'arduino',
    'python': 'python',
    'json': 'json',
    'yaml': 'yaml',
    'bash': 'bash',
    'shell': 'bash',
    'javascript': 'javascript',
    'ini': 'ini',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
          width: 0.5,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: HighlightView(
          code,
          language: _langMap[language] ?? language,
          theme: vs2015Theme,
          padding: const EdgeInsets.all(16),
          textStyle: TextStyle(
            fontFamily: 'Courier New',
            fontSize: fontSize,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color accentColor;
  final double? width;
  final double? titleFontSize;
  final double? descFontSize;

  const InfoCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.accentColor,
    this.width,
    this.titleFontSize,
    this.descFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: accentColor, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(icon, color: accentColor, size: 35),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    color: accentColor,
                    fontSize: titleFontSize ?? 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.75),
              fontSize: descFontSize ?? 15,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionSlide extends StatelessWidget {
  final String sectionNumber;
  final String title;
  final String subtitle;
  final Color accentColor;
  final IconData icon;

  const SectionSlide({
    super.key,
    required this.sectionNumber,
    required this.title,
    required this.subtitle,
    required this.accentColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: accentColor.withValues(alpha: 0.4),
                width: 1,
              ),
            ),
            child: Text(
              'SEÇÃO $sectionNumber',
              style: TextStyle(
                color: accentColor,
                fontSize: 16,
                fontWeight: FontWeight.w800,
                letterSpacing: 2.5,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Icon(icon, color: accentColor, size: 72),
          const SizedBox(height: 28),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 46,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.55),
              fontSize: 20,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class SlideTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color accentColor;

  const SlideTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.accentColor = const Color(0xFF00D9FF),
  });

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 38 * s,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.3,
          ),
        ),
        if (subtitle != null) ...[
          SizedBox(height: 6 * s),
          Text(
            subtitle!,
            style: TextStyle(
              color: accentColor.withValues(alpha: 0.75),
              fontSize: 18 * s,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
            ),
          ),
        ],
        SizedBox(height: 4 * s),
        Container(
          width: 90 * s,
          height: 3,
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
