import 'dart:developer';

import 'package:bertucanfrontend/core/adapters/auth_adapter.dart';
import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final IAuthRepository _authRepository;

  AuthController(this._authRepository);

  final _status = RxStatus.empty().obs;
  RxStatus get status => _status.value;
  set status(RxStatus value) {
    _status.value = value;
  }

  final _questionnairies = <QuestionnaireModel>[].obs;
  List<QuestionnaireModel> get questionnairies => _questionnairies.value;
  set questionnairies(List<QuestionnaireModel> value) {
    _questionnairies.value = value;
  }

  final _answeredQuestionnairies = <QuestionnaireModel>[].obs;

  getQuestionnairies() async {
    questionnairies.clear();
    questionnairies = _authRepository.getQuestionnairies();
  }

  setAnswer(QuestionnaireModel questionnaire, List<int> answerIndexes) async {
    questionnaire.answerIndexs = answerIndexes;
    _answeredQuestionnairies.add(questionnaire);
    log(questionnaire.toJson().toString());
    if (questionnairies.length == questionnaire.id) {
      saveQuestionairAnswers();
    }
  }

  saveQuestionairAnswers() async {
    _authRepository.saveQuestionnairAnswers(_answeredQuestionnairies.value);
    Get.offAndToNamed(Routes.homePage);
  }

  Future<void> signUp(UserToSignUp signUpPayload) async {
    status = RxStatus.loading();
    await _authRepository.signUp(signUpPayload).then((value) {
      status = RxStatus.success();
    }).catchError((error) {
      status = RxStatus.error(error);
    });
  }
}
