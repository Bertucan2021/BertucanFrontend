import 'dart:ui';

import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';

abstract class IAuthRepository {
  Future<NormalResponse> signUp(UserToSignUp signUpPayload);
  Future<User?> signIn(UserToLogin loginPayload);
  Future<NormalResponse> logOut();
  List<QuestionnaireModel> getQuestionnairies();
  List<QuestionnaireModel> setQuestionnairies();
  void saveQuestionnairAnswers(List<QuestionnaireModel> questionnaires);
  void setPasscode(String passcode);
  String getPasscode();
  void deletePasscode();
  void setLocale(Locale locale);
  Locale getLocale();
}
