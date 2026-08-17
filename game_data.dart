import 'models.dart';

// ============================================================
// WORLD CHALLENGE
// ============================================================

const worldChallenge = GameCategory(
  title: 'World Challenge',
  emoji: '🌎',
  description: 'Test what you know about our amazing world!',
  color: 0xFFFFD600,
  questions: [
    Question(
      question: 'Which planet is known as the Red Planet?',
      answers: ['Venus', 'Mars', 'Jupiter', 'Mercury'],
      correctAnswer: 1,
      explanation: 'Mars is called the Red Planet because of its reddish surface.',
    ),
    Question(
      question: 'Which is the largest ocean on Earth?',
      answers: [
        'Atlantic Ocean',
        'Indian Ocean',
        'Pacific Ocean',
        'Arctic Ocean',
      ],
      correctAnswer: 2,
      explanation: 'The Pacific Ocean is the largest ocean on Earth.',
    ),
    Question(
      question: 'How many continents are there?',
      answers: ['5', '6', '7', '8'],
      correctAnswer: 2,
      explanation: 'There are seven continents.',
    ),
    Question(
      question: 'Which country has the largest land area?',
      answers: ['Canada', 'China', 'Russia', 'United States'],
      correctAnswer: 2,
      explanation: 'Russia is the largest country by land area.',
    ),
    Question(
      question: 'What is the capital city of Japan?',
      answers: ['Kyoto', 'Osaka', 'Tokyo', 'Hiroshima'],
      correctAnswer: 2,
      explanation: 'Tokyo is the capital of Japan.',
    ),
    Question(
      question: 'Which is the longest river in the Philippines?',
      answers: [
        'Cagayan River',
        'Pasig River',
        'Agusan River',
        'Pampanga River',
      ],
      correctAnswer: 0,
      explanation: 'The Cagayan River is the longest river in the Philippines.',
    ),
    Question(
      question: 'Which gas do plants mainly absorb from the air?',
      answers: ['Oxygen', 'Nitrogen', 'Carbon dioxide', 'Hydrogen'],
      correctAnswer: 2,
      explanation: 'Plants absorb carbon dioxide during photosynthesis.',
    ),
    Question(
      question: 'Which desert is the largest hot desert in the world?',
      answers: ['Gobi', 'Sahara', 'Kalahari', 'Atacama'],
      correctAnswer: 1,
      explanation: 'The Sahara is the largest hot desert in the world.',
    ),
    Question(
      question: 'What is the highest mountain above sea level?',
      answers: ['K2', 'Mount Fuji', 'Mount Everest', 'Kilimanjaro'],
      correctAnswer: 2,
      explanation: 'Mount Everest is the highest mountain above sea level.',
    ),
    Question(
      question: 'Which country is famous for the Great Pyramids of Giza?',
      answers: ['Greece', 'Egypt', 'Mexico', 'Italy'],
      correctAnswer: 1,
      explanation: 'The Great Pyramids of Giza are located in Egypt.',
    ),
  ],
);

// ============================================================
// ANIMAL GUESS
// ============================================================

const animalGuess = GameCategory(
  title: 'Animal Guess',
  emoji: '🐾',
  description: 'Look at the picture and identify the animal!',
  color: 0xFFFF9F43,
  questions: [
    Question(
      question: 'Which animal is this?',
      answers: ['Lion', 'Tiger', 'Leopard', 'Jaguar'],
      correctAnswer: 0,
      explanation: 'Correct! This is a lion. Lions are large members of the cat family.',
      image: 'assets/images/lion_PNG3806.png',
    ),
    Question(
      question: 'Which animal is this?',
      answers: ['Rhino', 'Elephant', 'Hippo', 'Giraffe'],
      correctAnswer: 1,
      explanation: 'Correct! This is an elephant. Elephants have long trunks.',
      image: 'assets/images/elephant.png',
    ),
    Question(
      question: 'Which animal is this?',
      answers: ['Horse', 'Zebra', 'Giraffe', 'Deer'],
      correctAnswer: 2,
      explanation: 'Correct! This is a giraffe, famous for its extremely long neck.',
      image: 'assets/images/giraffe.png',
    ),
    Question(
      question: 'Which animal is this?',
      answers: ['Duck', 'Penguin', 'Swan', 'Goose'],
      correctAnswer: 1,
      explanation: 'Correct! This is a penguin. Penguins are birds that cannot fly.',
      image: 'assets/images/penguin.png',
    ),
    Question(
      question: 'Which animal is this?',
      answers: ['Shark', 'Whale', 'Dolphin', 'Seal'],
      correctAnswer: 2,
      explanation: 'Correct! This is a dolphin. Dolphins are intelligent marine mammals.',
      image: 'assets/images/dolphin.png',
    ),
    Question(
      question: 'Which animal is this?',
      answers: ['Bee', 'Butterfly', 'Dragonfly', 'Moth'],
      correctAnswer: 1,
      explanation: 'Correct! This is a butterfly.',
      image: 'assets/images/butterfly.png',
    ),
    Question(
      question: 'Which animal is this?',
      answers: ['Panda', 'Koala', 'Sloth', 'Bear'],
      correctAnswer: 0,
      explanation: 'Correct! This is a panda. Giant pandas mainly eat bamboo.',
      image: 'assets/images/panda.png',
    ),
    Question(
      question: 'Which animal is this?',
      answers: ['Cheetah', 'Lion', 'Wolf', 'Fox'],
      correctAnswer: 0,
      explanation: 'Correct! This is a cheetah, the fastest land animal.',
      image: 'assets/images/cheetah.png',
    ),
    Question(
      question: 'Which animal is this?',
      answers: ['Crocodile', 'Lizard', 'Snake', 'Turtle'],
      correctAnswer: 0,
      explanation: 'Correct! This is a crocodile, a large reptile.',
      image: 'assets/images/crocodile.png',
    ),
    Question(
      question: 'Which animal is this?',
      answers: ['Owl', 'Eagle', 'Falcon', 'Parrot'],
      correctAnswer: 1,
      explanation: 'Correct! This is an eagle, a powerful bird of prey.',
      image: 'assets/images/eagle.png',
    ),
  ],
);

// ============================================================
// HISTORY
// ============================================================

const historyChallenge = GameCategory(
  title: 'History Challenge',
  emoji: '🏛️',
  description: 'Travel through time and test your history knowledge!',
  color: 0xFF9C7BFF,
  questions: [
    Question(
      question: 'Who was the first President of the Philippines?',
      answers: [
        'Emilio Aguinaldo',
        'Manuel Quezon',
        'Jose Rizal',
        'Andres Bonifacio',
      ],
      correctAnswer: 0,
      explanation: 'Emilio Aguinaldo became the first President of the Philippines.',
    ),
    Question(
      question: 'Who wrote Noli Me Tangere?',
      answers: [
        'Andres Bonifacio',
        'Jose Rizal',
        'Emilio Aguinaldo',
        'Apolinario Mabini',
      ],
      correctAnswer: 1,
      explanation: 'Jose Rizal wrote Noli Me Tangere.',
    ),
    Question(
      question: 'Who is known as the Father of the Philippine Revolution?',
      answers: [
        'Jose Rizal',
        'Emilio Aguinaldo',
        'Andres Bonifacio',
        'Manuel Roxas',
      ],
      correctAnswer: 2,
      explanation: 'Andres Bonifacio is commonly associated with the Philippine Revolution.',
    ),
    Question(
      question: 'In which year did the Philippines gain independence from the United States?',
      answers: ['1898', '1935', '1946', '1965'],
      correctAnswer: 2,
      explanation: 'The Philippines became an independent republic on July 4, 1946.',
    ),
    Question(
      question: 'Who was the first emperor of Rome?',
      answers: ['Julius Caesar', 'Augustus', 'Nero', 'Constantine'],
      correctAnswer: 1,
      explanation: 'Augustus was the first Roman emperor.',
    ),
    Question(
      question: 'Which ancient civilization built the pyramids at Giza?',
      answers: ['Romans', 'Greeks', 'Egyptians', 'Persians'],
      correctAnswer: 2,
      explanation: 'The ancient Egyptians built the pyramids at Giza.',
    ),
    Question(
      question: 'Who was known as the Maid of Orléans?',
      answers: [
        'Cleopatra',
        'Joan of Arc',
        'Queen Victoria',
        'Marie Antoinette',
      ],
      correctAnswer: 1,
      explanation: 'Joan of Arc is known as the Maid of Orléans.',
    ),
    Question(
      question: 'Which event began in 1789 in France?',
      answers: [
        'Industrial Revolution',
        'French Revolution',
        'Renaissance',
        'Cold War',
      ],
      correctAnswer: 1,
      explanation: 'The French Revolution began in 1789.',
    ),
    Question(
      question: 'Who was the first person to walk on the Moon?',
      answers: [
        'Buzz Aldrin',
        'Yuri Gagarin',
        'Neil Armstrong',
        'John Glenn',
      ],
      correctAnswer: 2,
      explanation: 'Neil Armstrong became the first person to walk on the Moon in 1969.',
    ),
    Question(
      question: 'Which famous ancient city was destroyed by Mount Vesuvius?',
      answers: ['Athens', 'Pompeii', 'Sparta', 'Carthage'],
      correctAnswer: 1,
      explanation: 'Pompeii was buried by the eruption of Mount Vesuvius in AD 79.',
    ),
  ],
);

// ============================================================
// COLOR GUESS
// ============================================================

const colorGuess = GameCategory(
  title: 'Color Guess',
  emoji: '🎨',
  description: 'Test your knowledge of colors!',
  color: 0xFF00BCD4,
  questions: [
    Question(
      question: 'What color do you get by mixing blue and yellow?',
      answers: ['Purple', 'Green', 'Orange', 'Pink'],
      correctAnswer: 1,
      explanation: 'Blue and yellow make green.',
    ),
    Question(
      question: 'What color do you get by mixing red and blue?',
      answers: ['Green', 'Orange', 'Purple', 'Yellow'],
      correctAnswer: 2,
      explanation: 'Red and blue make purple.',
    ),
    Question(
      question: 'What color do you get by mixing red and yellow?',
      answers: ['Orange', 'Green', 'Purple', 'Blue'],
      correctAnswer: 0,
      explanation: 'Red and yellow make orange.',
    ),
    Question(
      question: 'Which color is made by mixing black and white?',
      answers: ['Gray', 'Brown', 'Pink', 'Green'],
      correctAnswer: 0,
      explanation: 'Black and white can produce gray.',
    ),
    Question(
      question: 'Which color is usually associated with calmness?',
      answers: ['Blue', 'Red', 'Orange', 'Black'],
      correctAnswer: 0,
      explanation: 'Blue is commonly associated with calmness and peace.',
    ),
    Question(
      question: 'Which color has the longest wavelength in visible light?',
      answers: ['Blue', 'Green', 'Violet', 'Red'],
      correctAnswer: 3,
      explanation: 'Red has the longest wavelength in visible light.',
    ),
    Question(
      question: 'Which color is opposite red on a traditional color wheel?',
      answers: ['Green', 'Blue', 'Yellow', 'Purple'],
      correctAnswer: 0,
      explanation: 'Green is traditionally considered complementary to red.',
    ),
    Question(
      question: 'Which color is made by mixing blue and red?',
      answers: ['Orange', 'Purple', 'Green', 'Brown'],
      correctAnswer: 1,
      explanation: 'Blue and red make purple.',
    ),
    Question(
      question: 'What color is often associated with sunshine?',
      answers: ['Yellow', 'Blue', 'Purple', 'Black'],
      correctAnswer: 0,
      explanation: 'Yellow is commonly associated with sunshine.',
    ),
    Question(
      question: 'Which color is often associated with nature and plants?',
      answers: ['Red', 'Green', 'Pink', 'Purple'],
      correctAnswer: 1,
      explanation: 'Green is strongly associated with plants and nature.',
    ),
  ],
);

// ============================================================
// ALL GAMES
// ============================================================

const games = [
  worldChallenge,
  animalGuess,
  historyChallenge,
  colorGuess,
];
