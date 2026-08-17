class Question {
  final String question;
  final List<String> answers;
  final int correctAnswer;
  final String explanation;
  final String? image;

  const Question({
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.explanation,
    this.image,
  });
}

class GameCategory {
  final String title;
  final String emoji;
  final String description;
  final int color;
  final List<Question> questions;

  const GameCategory({
    required this.title,
    required this.emoji,
    required this.description,
    required this.color,
    required this.questions,
  });
}
