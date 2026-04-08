import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide04 extends StatelessWidget {
  final int step;
  const Slide04({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Configurando GPIO na ESP32',
            subtitle: 'Funções essenciais: pinMode, digitalRead, digitalWrite',
          ),
          SizedBox(height: 24 * s),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Code block
                Expanded(
                  flex: 50,
                  child: AnimatedOpacity(
                    opacity: step >= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: CodeBlock(
                      code: '''#include <Arduino.h>

#define BUTTON_PIN  4
#define LED_PIN    2

void setup() {
  pinMode(BUTTON_PIN, INPUT);
  pinMode(LED_PIN, OUTPUT);
  Serial.begin(115200);
}

void loop() {
  int estado = digitalRead(BUTTON_PIN);
  digitalWrite(LED_PIN, estado);
}''',
                      language: 'cpp',
                      fontSize: 13 * s,
                    ),
                  ),
                ),
                SizedBox(width: 20 * s),
                // Function cards
                Expanded(
                  flex: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedOpacity(
                        opacity: step >= 2 ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: InfoCard(
                          title: 'pinMode(pin, mode)',
                          description:
                              'Configura o pino como INPUT ou OUTPUT no setup()',
                          icon: Icons.settings_rounded,
                          accentColor: const Color(0xFF00D9FF),
                          titleFontSize: 18,
                          descFontSize: 15,
                        ),
                      ),
                      SizedBox(height: 14 * s),
                      AnimatedOpacity(
                        opacity: step >= 2 ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 700),
                        child: InfoCard(
                          title: 'digitalRead(pin)',
                          description:
                              'Retorna HIGH ou LOW conforme o estado do pino',
                          icon: Icons.visibility_rounded,
                          accentColor: const Color(0xFF00E676),
                          titleFontSize: 18,
                          descFontSize: 15,
                        ),
                      ),
                      SizedBox(height: 14 * s),
                      AnimatedOpacity(
                        opacity: step >= 3 ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: InfoCard(
                          title: 'digitalWrite(pin, val)',
                          description:
                              'Define o pino para HIGH (3.3V) ou LOW (0V)',
                          icon: Icons.edit_rounded,
                          accentColor: const Color(0xFF7C4DFF),
                          titleFontSize: 18,
                          descFontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Footer
          Text(
            'PlatformIO • ESP32 • Arduino Framework',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.3),
              fontSize: 12 * s,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
