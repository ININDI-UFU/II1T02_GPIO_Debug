import 'package:flutter/material.dart';
import '../widgets/glass_panel.dart';

class Slide12 extends StatelessWidget {
  final int step;
  const Slide12({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    final s = (MediaQuery.of(context).size.width / 960).clamp(0.5, 1.6);
    return Padding(
      padding: EdgeInsets.all(28 * s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTitle(
            title: 'Técnicas de Debounce + Código PlatformIO',
            subtitle: 'Software com millis() e hardware com filtro RC',
            accentColor: const Color(0xFF00E676),
          ),
          SizedBox(height: 20 * s),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left: techniques
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      AnimatedOpacity(
                        opacity: step >= 1 ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: InfoCard(
                          title: '💻 Software — millis()',
                          description: 'if (reading != lastState) {\n'
                              '  lastDebounce = millis();\n'
                              '}\n'
                              'if (millis()-lastDebounce > 50) {\n'
                              '  btnState = reading;\n'
                              '}',
                          icon: Icons.code_rounded,
                          accentColor: const Color(0xFF00D9FF),
                        ),
                      ),
                      SizedBox(height: 12 * s),
                      AnimatedOpacity(
                        opacity: step >= 2 ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: InfoCard(
                          title: '⚡ Hardware — Filtro RC',
                          description: 'Capacitor em paralelo com o botão:\n'
                              'R = 10kΩ + C = 100nF\n'
                              'τ = R × C = 1ms\n'
                              'O capacitor absorve as oscilações',
                          icon: Icons.electrical_services_rounded,
                          accentColor: const Color(0xFFFF9F0A),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20 * s),
                // Right: full code
                Expanded(
                  flex: 6,
                  child: AnimatedOpacity(
                    opacity: step >= 3 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12 * s, vertical: 6 * s),
                          decoration: BoxDecoration(
                            color:
                                const Color(0xFF00E676).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Exemplo Completo — PlatformIO (ESP32)',
                            style: TextStyle(
                              color: const Color(0xFF00E676),
                              fontSize: 12 * s,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 8 * s),
                        Expanded(
                          child: SingleChildScrollView(
                            child: CodeBlock(
                              code: '''#define BTN_PIN 15
#define DEBOUNCE_MS 50

bool btnState = HIGH;
bool lastState = HIGH;
unsigned long lastDebounce = 0;

void setup() {
  pinMode(BTN_PIN, INPUT_PULLUP);
  Serial.begin(115200);
}

void loop() {
  bool reading = digitalRead(BTN_PIN);
  
  if (reading != lastState)
    lastDebounce = millis();
    
  if (millis() - lastDebounce > DEBOUNCE_MS) {
    if (reading != btnState) {
      btnState = reading;
      Serial.println("Pressionado!");
    }
  }
  lastState = reading;
}''',
                              language: 'cpp',
                              fontSize: 13 * s,
                            ),
                          ),
                        ),
                        SizedBox(height: 8 * s),
                        Text(
                          'Delay de 50ms é suficiente para a maioria dos botões • Ajuste conforme necessário',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.3),
                            fontSize: 10 * s,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
