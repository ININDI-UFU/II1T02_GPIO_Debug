import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide17 extends StatelessWidget {
  const Slide17({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SectionSlide(
        sectionNumber: '01',
        title: 'Debug no Visual Studio Code',
        subtitle: 'Configuração, breakpoints, watch variables e extensões',
        accentColor: Color(0xFF00D9FF),
        icon: Icons.code_rounded,
      ),
    );
  }
}
