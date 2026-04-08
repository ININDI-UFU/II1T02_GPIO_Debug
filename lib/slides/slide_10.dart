import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide10 extends StatelessWidget {
  const Slide10({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SectionSlide(
        sectionNumber: '03',
        title: 'Debounce',
        subtitle:
            'Técnicas de software e hardware para filtrar\noscilações em botões mecânicos',
        accentColor: Color(0xFF00E676),
        icon: Icons.filter_alt_rounded,
      ),
    );
  }
}
