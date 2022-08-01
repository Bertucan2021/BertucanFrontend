import 'dart:developer';
import 'dart:ui';

import 'package:bertucanfrontend/core/adapters/auth_adapter.dart';
import 'package:bertucanfrontend/core/enums/common_enums.dart';
import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/core/services/api/api_client.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepository with IAuthRepository {
  final ApiClient apiClient;
  final GetStorage storage = GetStorage();

  User? user;
  AuthRepository({required this.apiClient});
  @override
  Future<NormalResponse> logOut() async {
    storage.erase();
    return NormalResponse(success: true);
  }

  @override
  Future<User?> signIn(UserToLogin loginPayload) async {
    final response = await apiClient.request(
      requestType: RequestType.post,
      path: '/users/login',
      data: loginPayload.toJson(),
    );
    if (response['success']) {
      var user = User.fromJson(response['data']);
      storage.write('token', user.remember_token!);
      storage.write('user', user);
      this.user = user;
      return user;
    }
    return null;
  }

  @override
  Future<NormalResponse> signUp(UserToSignUp signUpPayload) async {
    final response = await apiClient.request(
      requestType: RequestType.post,
      path: '/users',
      data: signUpPayload.toJson(),
    );
    if (response['success']) {
      return NormalResponse(
        success: true,
      );
    } else {
      return NormalResponse(
        success: false,
      );
    }
  }

  @override
  List<QuestionnaireModel> getQuestionnairies() {
    try {
      var data = storage.read('questionnaires');
      List<QuestionnaireModel> questionnaires = [];
      data.forEach((d) {
        questionnaires.add(QuestionnaireModel.fromJson(d));
      });
      return questionnaires;
    } catch (e) {
      return setQuestionnairies();
    }
  }

  @override
  saveQuestionnairAnswers(List<QuestionnaireModel> questionnaires) {
    storage.write('answers', questionnaires);
  }

  @override
  List<QuestionnaireModel> setQuestionnairies() {
    final List<QuestionnaireModel> questionnaires = [
      QuestionnaireModel(
        id: 1,
        question:
            "Is your menstrual cycle regular(varies by no more than 7 days)?",
        answers: [
          "My cycle is  regular",
          "My cycle is  irregular",
          "I don’t know"
        ],
      ),
      QuestionnaireModel(
          id: 2,
          question: "Do you experiance discomfort due to any of the following?",
          answers: [
            "Painful menstrual cramps",
            "PMS symptoms",
            "Unusual discharge",
            "Heavy menstrual flow",
            "Mood swings",
            "Other",
            "No, nothing bothers me"
          ],
          isMultiple: true),
      QuestionnaireModel(
        id: 3,
        question:
            "Do you have any reproductive health disorders (endometriosis, PCOS, etc.)?",
        answers: ["Yes", "No", "No, but I used to", "I don’t know"],
      ),
      QuestionnaireModel(
        id: 4,
        question: "Is there anything you want to improve about your sleep?",
        answers: [
          "No, I sleep well",
          "Difficulty falling sleep"
              "Waking up tired",
          "Waking up during night"
              "Lack of sleep schedule",
          "Insomnia",
          "Other"
        ],
      ),
    ];
    storage.write('questionnaires', questionnaires);
    return questionnaires;
  }

  @override
  void deletePasscode() {
    storage.remove("passcode");
  }

  @override
  String getPasscode() {
    return storage.read("passcode");
  }

  @override
  void setPasscode(String passcode) {
    storage.write("passcode", passcode);
  }

  @override
  User? getUser() {
    try {
      return user ?? User.fromJson(storage.read('user'));
    } catch (e) {
      log("no user saved $e");
    }
    return null;
  }

  @override
  void setLocale(Locale locale) {
    storage.write('locale', locale.languageCode);
  }

  @override
  Locale getLocale() {
    return storage.hasData('locale')
        ? Locale(storage.read('locale') as String)
        : const Locale('en', 'US');
  }

  @override
  Future<NormalResponse> deleteAccount() async {
    if (storage.hasData('token') && user != null) {
      UserToEdit temp = UserToEdit(
          first_name: user?.first_name ?? "",
          last_name: user?.last_name ?? "",
          email: user?.email ?? "",
          phone_number: user?.phone_number ?? "",
          birthdate: user?.birthdate ?? "",
          status: "delete");
      final response = await apiClient.request(
        requestType: RequestType.put,
        path: '/users',
        data: temp.toJson(),
      );
      if (response['success']) {
        storage.erase();
        return NormalResponse(
          success: true,
        );
      } else {
        return NormalResponse(
          success: false,
        );
      }
    }
    return NormalResponse(
      success: false,
    );
  }

  @override
  Future<NormalResponse> editProfile(UserToEdit userToEdit) async {
    final response = await apiClient.request(
      requestType: RequestType.put,
      path: '/users',
      data: userToEdit.toJson(),
    );
    if (response['success']) {
      user = User.fromJson(userToEdit.toJson());
      storage.write('user', user);
      return NormalResponse(
        success: true,
      );
    } else {
      return NormalResponse(
        success: false,
      );
    }
  }

  @override
  Future<NormalResponse> changePassword(
      PasswordToChange passwordToChange) async {
    final response = await apiClient.request(
      requestType: RequestType.put,
      path: '/changePassword',
      data: passwordToChange.toJson(),
    );
    if (response['success']) {
      return NormalResponse(
        success: true,
      );
    } else {
      return NormalResponse(
        success: false,
      );
    }
  }
}
