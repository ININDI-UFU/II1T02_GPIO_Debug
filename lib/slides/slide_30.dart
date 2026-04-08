import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide30 extends StatelessWidget {
  const Slide30({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SectionSlide(
        sectionNumber: '04',
        title: 'Debug no Jupyter Notebook',
        subtitle:
            'Ferramentas interativas para análise de dados e prototipagem',
        accentColor: Color(0xFFFFD54F),
        icon: Icons.science_rounded,
      ),
    );
  }
}
