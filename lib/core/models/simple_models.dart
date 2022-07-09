class QuestionnaireModel {
  int id;
  String question;
  List<String> answers;
  bool isMultiple;
  List<int>? answerIndexs;

  QuestionnaireModel({
    required this.id,
    required this.question,
    required this.answers,
    this.isMultiple = false,
    this.answerIndexs,
  });

  QuestionnaireModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers = List<String>.from(json['answers']),
        isMultiple = json['isMultiple'],
        answerIndexs = json['answerIndexs'] == null
            ? null
            : List<int>.from(json['answerIndexs']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'question': question,
        'answers': answers,
        'isMultiple': isMultiple,
        'answerIndexs': answerIndexs,
      };
}
