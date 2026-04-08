import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide06 extends StatelessWidget {
  const Slide06({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SectionSlide(
        sectionNumber: '02',
        title: 'Resistores Pull-up\n& Pull-down',
        subtitle: 'Como definir estados padrão estáveis em pinos GPIO',
        accentColor: Color(0xFF7C4DFF),
        icon: Icons.swap_vert_rounded,
      ),
    );
  }
}
