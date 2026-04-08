import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide02 extends StatelessWidget {
  const Slide02({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SectionSlide(
        sectionNumber: '01',
        title: 'Fundamentos de GPIO',
        subtitle:
            'General Purpose Input/Output — Conceitos essenciais\npara a interface com o mundo físico',
        accentColor: Color(0xFF00D9FF),
        icon: Icons.settings_input_hdmi_rounded,
      ),
    );
  }
}
