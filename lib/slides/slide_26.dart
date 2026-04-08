import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide26 extends StatelessWidget {
  const Slide26({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SectionSlide(
        sectionNumber: '03',
        title: 'Debug em Sistemas Embarcados',
        subtitle: 'Serial Monitor, JTAG, arquitetura de debug para ESP32',
        accentColor: Color(0xFFFF9F0A),
        icon: Icons.developer_board_rounded,
      ),
    );
  }
}
