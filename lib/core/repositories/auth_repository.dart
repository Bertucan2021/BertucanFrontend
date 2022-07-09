import 'package:bertucanfrontend/core/adapters/auth_adapter.dart';
import 'package:bertucanfrontend/core/enums/common_enums.dart';
import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/core/services/api/api_client.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepository with IAuthRepository {
  final ApiClient apiClient;
  final GetStorage storage = GetStorage();
  AuthRepository({required this.apiClient});
  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(UserToLogin loginPayload) async {
    final response = await apiClient.request(
      requestType: RequestType.post,
      path: '/signin',
      data: loginPayload.toJson(),
    );
  }

  @override
  Future<void> signUp(UserToSignUp signUpPayload) {
    // TODO: implement signUp
    throw UnimplementedError();
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
}
