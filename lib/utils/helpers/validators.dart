import 'package:get/get.dart';

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return "name_cannot_be_empty".tr;
  }
  if (name.length < 3) {
    return "name_must_be_at_least_3_characters".tr;
  }
  return null;
}
