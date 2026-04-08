import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide22 extends StatelessWidget {
  const Slide22({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SectionSlide(
        sectionNumber: '02',
        title: 'Debug em Python',
        subtitle: 'pdb, logging, técnicas e caso de estudo',
        accentColor: Color(0xFF00E676),
        icon: Icons.terminal_rounded,
      ),
    );
  }
}
