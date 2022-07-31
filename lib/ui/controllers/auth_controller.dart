import 'dart:developer';
import 'dart:ui';

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

  final _user = User(id: -1).obs;
  User get user => _user.value;
  set user(User value) {
    _user.value = value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUser();
  }

  void getUser() {
    user = _authRepository.getUser() ?? User(id: -1);
    log(user.toJson().toString());
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
    await _authRepository.signUp(signUpPayload).then((value) async {
      if (value.success) {
        await signIn(UserToLogin(
          email: signUpPayload.email,
          password: signUpPayload.password,
        ));
        status = RxStatus.success();
      } else {
        status = RxStatus.error();
      }
    });
  }

  Future<void> signIn(UserToLogin loginPayload) async {
    status = RxStatus.loading();
    await _authRepository.signIn(loginPayload).then((value) {
      if (value != null) {
        status = RxStatus.success();
        user = value;
        Get.offAndToNamed(Routes.questionnairePage);
      } else {
        status = RxStatus.error();
      }
    });
  }

  setPasscode(String passcode) async {
    _authRepository.setPasscode(passcode);
  }

  String getPasscode() {
    return _authRepository.getPasscode();
  }

  deletePasscode() {
    _authRepository.deletePasscode();
  }

  logout() {
    _authRepository.logOut();
    Get.offAndToNamed(Routes.loginPage);
  }

  setLocale(Locale locale) {
    log(locale.languageCode);
    Get.updateLocale(locale);
    _authRepository.setLocale(locale);
  }

  getLocale() {
    return _authRepository.getLocale();
  }

  deleteAccount() {
    _authRepository.logOut();
    Get.offAndToNamed(Routes.loginPage);
  }
}
