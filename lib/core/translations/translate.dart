import 'package:donation/core/translations/locale/ar.dart';
import 'package:donation/core/translations/locale/en.dart';
import 'package:get/get.dart';

class Translate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': ar,
        'en': en,
      };
}
