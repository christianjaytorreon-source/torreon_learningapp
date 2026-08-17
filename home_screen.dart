import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'game_data.dart';
import 'models.dart';
import 'game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalStars = 0;
  int totalScore = 0;

  // ============================================================
  // MUSIC
  // ============================================================

  final AudioPlayer musicPlayer = AudioPlayer();

  final List<String> musicTracks = [
    'music/mondamusic-retro-arcade-game-music-512837.mp3',
    'music/hitslab-gaming-game-minecraft-background-music-278382.mp3',
  ];

  int currentTrack = 0;
  bool isMusicOn = true;

  @override
  void initState() {
    super.initState();

    musicPlayer.onPlayerComplete.listen((event) {
      if (isMusicOn) {
        _playNextMusic();
      }
    });

    _startMusic();
  }

  Future<void> _startMusic() async {
    if (!isMusicOn) return;

    try {
      await musicPlayer.setVolume(0.25);

      await musicPlayer.play(
        AssetSource(musicTracks[currentTrack]),
      );
    } catch (e) {
      debugPrint('Music error: $e');
    }
  }

  Future<void> _playNextMusic() async {
    if (!isMusicOn) return;

    currentTrack++;

    if (currentTrack >= musicTracks.length) {
      currentTrack = 0;
    }

    try {
      await musicPlayer.play(
        AssetSource(musicTracks[currentTrack]),
      );
    } catch (e) {
      debugPrint('Next music error: $e');
    }
  }

  // ============================================================
  // MUSIC BUTTON
  // ============================================================

  Future<void> _toggleMusic() async {
    if (isMusicOn) {
      setState(() {
        isMusicOn = false;
      });

      await musicPlayer.pause();
    } else {
      setState(() {
        isMusicOn = true;
      });

      try {
        await musicPlayer.resume();
      } catch (e) {
        debugPrint('Music resume error: $e');

        // If resume doesn't work, start the current track again.
        await _startMusic();
      }
    }
  }

  // ============================================================
  // OPEN GAME
  //
  // IMPORTANT:
  // We DO NOT pause or stop music here.
  // The music continues while GameScreen is open.
  // ============================================================

  Future<void> openGame(GameCategory game) async {
    final result = await Navigator.push<GameResult>(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(game: game),
      ),
    );

    if (result != null && mounted) {
      setState(() {
        totalStars += result.stars;
        totalScore += result.score;
      });
    }
  }

  // ============================================================
  // PROGRESS
  // ============================================================

  void showProgress() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF151515),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: const Text(
            '🏆 My Progress',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '⭐',
                style: TextStyle(fontSize: 65),
              ),
              const SizedBox(height: 10),
              Text(
                '$totalStars Stars',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00E5FF),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Total Score: $totalScore',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Keep learning and playing! 🚀',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Awesome!'),
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    musicPlayer.dispose();
    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Let's Learn! 🎓",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        actions: [
          // MUSIC BUTTON
          IconButton(
            tooltip: isMusicOn
                ? 'Turn Music Off'
                : 'Turn Music On',
            onPressed: _toggleMusic,
            icon: Icon(
              isMusicOn
                  ? Icons.volume_up_rounded
                  : Icons.volume_off_rounded,
              color: isMusicOn
                  ? const Color(0xFF69F0AE)
                  : Colors.grey,
              size: 30,
            ),
          ),

          // PROGRESS BUTTON
          IconButton(
            tooltip: 'My Progress',
            onPressed: showProgress,
            icon: const Icon(
              Icons.emoji_events_rounded,
              color: Color(0xFFFFD600),
              size: 30,
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWelcomeCard(),

              const SizedBox(height: 28),

              const Text(
                'Choose Your Adventure',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                'Learn, play, and challenge yourself!',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 20),

              ...games.map(_buildGameCard),

              const SizedBox(height: 10),

              _buildStarsCard(),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // WELCOME CARD
  // ============================================================

  Widget _buildWelcomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        color: const Color(0xFFB9F6CA),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF69F0AE).withOpacity(0.25),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Explorer! 👋',
                  style: TextStyle(
                    color: Color(0xFF073B20),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Learn, play, and earn stars!',
                  style: TextStyle(
                    color: Color(0xFF176B3A),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.45),
              shape: BoxShape.circle,
            ),
            child: const Text(
              '🧭',
              style: TextStyle(fontSize: 38),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // GAME CARD
  // ============================================================

  Widget _buildGameCard(GameCategory game) {
    final color = Color(game.color);

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Material(
        color: color,
        elevation: 5,
        borderRadius: BorderRadius.circular(23),
        child: InkWell(
          borderRadius: BorderRadius.circular(23),
          onTap: () => openGame(game),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      game.emoji,
                      style: const TextStyle(
                        fontSize: 38,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        game.title,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        game.description,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        '${game.questions.length} Questions',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // STARS CARD
  // ============================================================

  Widget _buildStarsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF00E5FF),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          const Text(
            '⭐',
            style: TextStyle(fontSize: 38),
          ),

          const SizedBox(width: 14),

          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Stars',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  'Keep playing to collect more!',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          Text(
            '$totalStars',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
