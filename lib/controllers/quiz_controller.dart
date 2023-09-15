import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educate/models/questionModel.dart';
import 'package:educate/view/home_screen.dart';
import 'package:get/get.dart';

int? lengthQuestionsArt;

class NewQuizController extends GetxController {

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  void onInit() {
    quizQuestion();
    lengthQuestionsArt=questionsSports.length;
    super.onInit();
  }

  List<questionModel> questionsSports = [];

  quizQuestion() {

    getAllQuestionsCulture().then((value) {
      questionsSports = value;
      lengthQuestionsArt=questionsSports.length;
      update();
    });

  }

  static Future<List<questionModel>> getAllQuestionsCulture() async {
    final questionsRef = FirebaseFirestore.instance.collection('culture');
    final questionDoc = await questionsRef.get();

    return questionDoc.docs
        .map((e) => questionModel.fromQueryDocumentSnapshot(e))
        .toList();
  }

  void startAgain() {
    Get.offAll(const HomeScreen());
  }


}
