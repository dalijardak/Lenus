/// flutter:
///   fonts:
///    - family:  GooglePixel44XL2Icons
///      fonts:
///       - asset: fonts/GooglePixel44XL2Icons.ttf
///
///
///
import 'package:flutter/widgets.dart';

class CustomIcons {
  CustomIcons._();

  static const _kFontFam = 'CustomIcons';

  static const IconData local_dining_24px =
      const IconData(0xe000, fontFamily: _kFontFam, fontPackage: null);
  static const IconData sports_handball_24px =
      const IconData(0xe001, fontFamily: _kFontFam, fontPackage: null);
  static const IconData spa_24px =
      const IconData(0xe002, fontFamily: _kFontFam, fontPackage: 'icons');
  static const IconData emoji_events_24px =
      const IconData(0xe003, fontFamily: _kFontFam, fontPackage: 'icons');
}
