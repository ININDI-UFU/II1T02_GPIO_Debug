import 'package:flutter/widget_previews.dart';
import 'package:flutter/widgets.dart';
import '../widgets/glass_panel.dart';

// ──────────────────────────────────────────────────
// Exemplo de Widget Preview — abra este arquivo no VS Code
// e clique no ícone "Preview" que aparece acima da anotação.
// ──────────────────────────────────────────────────

@Preview(name: 'GlassPanel básico', size: Size(400, 200))
Widget previewGlassPanel() {
  return const Directionality(
    textDirection: TextDirection.ltr,
    child: GlassPanel(
      child: Center(
        child: Text(
          'Hello Widget Preview!',
          style: TextStyle(color: Color(0xFF00D9FF), fontSize: 24),
        ),
      ),
    ),
  );
}
