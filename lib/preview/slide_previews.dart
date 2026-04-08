import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import '../slides/slide_01.dart';
import '../slides/slide_02.dart';
import '../slides/slide_03.dart';
import '../slides/slide_04.dart';
import '../slides/slide_05.dart';
import '../slides/slide_06.dart';
import '../slides/slide_07.dart';
import '../slides/slide_08.dart';
import '../slides/slide_09.dart';
import '../slides/slide_10.dart';
import '../slides/slide_11.dart';
import '../slides/slide_12.dart';
import '../slides/slide_13.dart';
import '../slides/slide_14.dart';
import '../slides/slide_15.dart';
import '../slides/slide_16.dart';
import '../slides/slide_17.dart';
import '../slides/slide_18.dart';
import '../slides/slide_19.dart';
import '../slides/slide_20.dart';
import '../slides/slide_21.dart';
import '../slides/slide_22.dart';
import '../slides/slide_23.dart';
import '../slides/slide_24.dart';
import '../slides/slide_25.dart';
import '../slides/slide_26.dart';
import '../slides/slide_27.dart';
import '../slides/slide_28.dart';
import '../slides/slide_29.dart';
import '../slides/slide_30.dart';
import '../slides/slide_31.dart';
import '../slides/slide_32.dart';
import '../slides/slide_33.dart';

Widget _wrap(Widget child) {
  return MaterialApp(
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
    home: Scaffold(body: child),
  );
}

@Preview(name: 'Slide 01 — Capa', size: Size(960, 540))
Widget previewSlide01() => _wrap(const Slide01());

@Preview(name: 'Slide 02 — Seção', size: Size(960, 540))
Widget previewSlide02() => _wrap(const Slide02());

@Preview(name: 'Slide 03', size: Size(960, 540))
Widget previewSlide03() => _wrap(const Slide03());

@Preview(name: 'Slide 04', size: Size(960, 540))
Widget previewSlide04() => _wrap(const Slide04());

@Preview(name: 'Slide 05', size: Size(960, 540))
Widget previewSlide05() => _wrap(const Slide05());

@Preview(name: 'Slide 06 — Seção', size: Size(960, 540))
Widget previewSlide06() => _wrap(const Slide06());

@Preview(name: 'Slide 07', size: Size(960, 540))
Widget previewSlide07() => _wrap(const Slide07());

@Preview(name: 'Slide 08', size: Size(960, 540))
Widget previewSlide08() => _wrap(const Slide08());

@Preview(name: 'Slide 09', size: Size(960, 540))
Widget previewSlide09() => _wrap(const Slide09());

@Preview(name: 'Slide 10 — Seção', size: Size(960, 540))
Widget previewSlide10() => _wrap(const Slide10());

@Preview(name: 'Slide 11', size: Size(960, 540))
Widget previewSlide11() => _wrap(const Slide11());

@Preview(name: 'Slide 12', size: Size(960, 540))
Widget previewSlide12() => _wrap(const Slide12());

@Preview(name: 'Slide 13', size: Size(960, 540))
Widget previewSlide13() => _wrap(const Slide13());

@Preview(name: 'Slide 14', size: Size(960, 540))
Widget previewSlide14() => _wrap(const Slide14());

@Preview(name: 'Slide 15', size: Size(960, 540))
Widget previewSlide15() => _wrap(const Slide15());

@Preview(name: 'Slide 16', size: Size(960, 540))
Widget previewSlide16() => _wrap(const Slide16());

@Preview(name: 'Slide 17 — Seção', size: Size(960, 540))
Widget previewSlide17() => _wrap(const Slide17());

@Preview(name: 'Slide 18', size: Size(960, 540))
Widget previewSlide18() => _wrap(const Slide18());

@Preview(name: 'Slide 19', size: Size(960, 540))
Widget previewSlide19() => _wrap(const Slide19());

@Preview(name: 'Slide 20', size: Size(960, 540))
Widget previewSlide20() => _wrap(const Slide20());

@Preview(name: 'Slide 21', size: Size(960, 540))
Widget previewSlide21() => _wrap(const Slide21());

@Preview(name: 'Slide 22 — Seção', size: Size(960, 540))
Widget previewSlide22() => _wrap(const Slide22());

@Preview(name: 'Slide 23', size: Size(960, 540))
Widget previewSlide23() => _wrap(const Slide23());

@Preview(name: 'Slide 24', size: Size(960, 540))
Widget previewSlide24() => _wrap(const Slide24());

@Preview(name: 'Slide 25', size: Size(960, 540))
Widget previewSlide25() => _wrap(const Slide25());

@Preview(name: 'Slide 26 — Seção', size: Size(960, 540))
Widget previewSlide26() => _wrap(const Slide26());

@Preview(name: 'Slide 27', size: Size(960, 540))
Widget previewSlide27() => _wrap(const Slide27());

@Preview(name: 'Slide 28', size: Size(960, 540))
Widget previewSlide28() => _wrap(const Slide28());

@Preview(name: 'Slide 29', size: Size(960, 540))
Widget previewSlide29() => _wrap(const Slide29());

@Preview(name: 'Slide 30 — Seção', size: Size(960, 540))
Widget previewSlide30() => _wrap(const Slide30());

@Preview(name: 'Slide 31', size: Size(960, 540))
Widget previewSlide31() => _wrap(const Slide31());

@Preview(name: 'Slide 32', size: Size(960, 540))
Widget previewSlide32() => _wrap(const Slide32());

@Preview(name: 'Slide 33', size: Size(960, 540))
Widget previewSlide33() => _wrap(const Slide33());
