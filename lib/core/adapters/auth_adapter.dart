import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';

abstract class IAuthRepository {
  Future<void> signUp(UserToSignUp signUpPayload);
  Future<void> signIn(UserToLogin loginPayload);
  Future<void> logOut();
  List<QuestionnaireModel> getQuestionnairies();
  List<QuestionnaireModel> setQuestionnairies();
  saveQuestionnairAnswers(List<QuestionnaireModel> questionnaires);
}
