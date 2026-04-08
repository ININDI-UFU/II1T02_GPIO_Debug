import 'package:flutter/material.dart';
import 'screens/presentation_screen.dart';

void main() => runApp(const SlidesApp());

class SlidesApp extends StatelessWidget {
  const SlidesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPIO & Debug — Instrumentação Industrial',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00D9FF),
          secondary: Color(0xFF7C4DFF),
          surface: Color(0xFF1C1C1E),
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.black,
      ),
      initialRoute: '/1',
      onGenerateRoute: (settings) {
        final name = settings.name ?? '/1';
        final seg = Uri.parse(name).pathSegments;
        int slide = 0;
        if (seg.isNotEmpty) {
          slide = (int.tryParse(seg.first) ?? 1).clamp(1, kTotalSlides) - 1;
        }
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PresentationScreen(initialSlide: slide),
          transitionDuration: Duration.zero,
        );
      },
    );
  }
}
