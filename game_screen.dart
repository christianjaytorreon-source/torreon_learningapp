import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models.dart';

class GameResult {
  final int score;
  final int stars;

  const GameResult({
    required this.score,
    required this.stars,
  });
}

class GameScreen extends StatefulWidget {
  final GameCategory game;

  const GameScreen({
    super.key,
    required this.game,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int questionIndex = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  Question get currentQuestion =>
      widget.game.questions[questionIndex];

  Future<void> chooseAnswer(int index) async {
    if (answered) return;

    final isCorrect =
        index == currentQuestion.correctAnswer;

    setState(() {
      selectedAnswer = index;
      answered = true;

      if (isCorrect) {
        score++;
      }
    });

    if (isCorrect) {
      await SystemSound.play(SystemSoundType.click);
    } else {
      await SystemSound.play(SystemSoundType.alert);
    }
  }

  void nextQuestion() {
    if (questionIndex <
        widget.game.questions.length - 1) {
      setState(() {
        questionIndex++;
        selectedAnswer = null;
        answered = false;
      });
    } else {
      showResult();
    }
  }

  void showResult() {
    final total = widget.game.questions.length;

    int stars;

    if (score == total) {
      stars = 3;
    } else if (score >= total - 1) {
      stars = 2;
    } else if (score >= total ~/ 2) {
      stars = 1;
    } else {
      stars = 0;
    }

    String message;

    if (score == total) {
      message = 'Perfect! You are amazing! 🌟';
    } else if (score >= total - 1) {
      message = 'Excellent work! 🎉';
    } else if (score >= total ~/ 2) {
      message = 'Good job! Keep learning! 😊';
    } else {
      message = 'Keep practicing! You can do it! 💪';
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF151515),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          title: const Text(
            '🎉 Adventure Complete!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                stars == 0 ? '⭐' : '⭐' * stars,
                style: const TextStyle(fontSize: 45),
              ),
              const SizedBox(height: 12),
              Text(
                '$score / $total',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00E5FF),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Your Score',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.pop(
                    context,
                    GameResult(
                      score: score,
                      stars: stars,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color(widget.game.color),
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Back to Adventure',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Color getAnswerColor(int index) {
    if (!answered) {
      return const Color(0xFF1A1A1A);
    }

    if (index == currentQuestion.correctAnswer) {
      return const Color(0xFF123D2A);
    }

    if (index == selectedAnswer) {
      return const Color(0xFF4A1E1E);
    }

    return const Color(0xFF1A1A1A);
  }

  Color getBorderColor(int index) {
    if (!answered) {
      return Colors.white12;
    }

    if (index == currentQuestion.correctAnswer) {
      return const Color(0xFF20BF6B);
    }

    if (index == selectedAnswer) {
      return const Color(0xFFEB5757);
    }

    return Colors.white12;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions =
        widget.game.questions.length;

    final progress =
        (questionIndex + 1) / totalQuestions;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          '${widget.game.emoji} ${widget.game.title}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 10,
                        backgroundColor:
                            Colors.white12,
                        color:
                            Color(widget.game.color),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${questionIndex + 1}/$totalQuestions',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildQuestionCard(),

                      const SizedBox(height: 18),

                      ...List.generate(
                        currentQuestion.answers.length,
                        _buildAnswerButton,
                      ),

                      if (answered)
                        _buildExplanation(),
                    ],
                  ),
                ),
              ),

              if (answered)
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(widget.game.color),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(17),
                      ),
                    ),
                    child: Text(
                      questionIndex ==
                              totalQuestions - 1
                          ? 'See My Score 🏆'
                          : 'Next Question →',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        borderRadius: BorderRadius.circular(27),
        border: Border.all(
          color: Colors.white12,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [

          if (currentQuestion.image != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                height: 210,
                color: Colors.white,
                child: Image.asset(
                  currentQuestion.image!,
                  fit: BoxFit.contain,
                  errorBuilder:
                      (context, error, stackTrace) {
                    return const Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_not_supported,
                          size: 60,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Image not found',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],

          Text(
            widget.game.emoji,
            style: const TextStyle(
              fontSize: 45,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            currentQuestion.question,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerButton(int index) {
    final letter =
        String.fromCharCode(65 + index);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: getAnswerColor(index),
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius:
              BorderRadius.circular(18),
          onTap: () => chooseAnswer(index),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(18),
              border: Border.all(
                color: getBorderColor(index),
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Color(
                      widget.game.color,
                    ).withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      letter,
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        color: Color(
                          widget.game.color,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Text(
                    currentQuestion.answers[index],
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),

                if (answered &&
                    index ==
                        currentQuestion
                            .correctAnswer)
                  const Icon(
                    Icons.check_circle,
                    color: Color(0xFF20BF6B),
                  ),

                if (answered &&
                    index == selectedAnswer &&
                    index !=
                        currentQuestion
                            .correctAnswer)
                  const Icon(
                    Icons.cancel,
                    color: Color(0xFFEB5757),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExplanation() {
    final correct =
        selectedAnswer ==
            currentQuestion.correctAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: correct
            ? const Color(0xFF123D2A)
            : const Color(0xFF4A1E1E),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            correct ? '🎉' : '💡',
            style: const TextStyle(
              fontSize: 25,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              currentQuestion.explanation,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                height: 1.4,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
