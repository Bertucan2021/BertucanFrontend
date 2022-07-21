import 'package:bertucanfrontend/shared/translations/am_et.dart';
import 'package:bertucanfrontend/shared/translations/en_us.dart';
import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': english,
        'am_ET': amharic,
      };
}
