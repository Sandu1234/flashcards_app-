import 'package:flutter/material.dart';

void main() {
  runApp(const FlashcardsApp());
}

class FlashcardsApp extends StatelessWidget {
  const FlashcardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashcards App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FlashcardsPage(),
    );
  }
}

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({super.key});

  @override
  _FlashcardsPageState createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  final List<bool> _isQuestionVisible = [true, true];

  final List<Map<String, String>> _flashcards = [
    {
      'question': 'What is Flutter?',
      'answer':
          'Flutter is Google\'s UI toolkit for building natively compiled applications across mobile, web, and desktop from a single codebase.'
    },
    {
      'question': 'What is Dart?',
      'answer':
          'Dart is a programming language optimized for building fast, multi-platform apps. It’s the language used to develop Flutter apps.'
    },
    {
      'question': 'What is a Widget?',
      'answer':
          'A Widget is the basic building block of a Flutter app\'s UI. Widgets describe what their view should look like given their current configuration and state.'
    },
    {
      'question': 'What is State?',
      'answer':
          'State is the information that can change in a widget. Flutter uses state to build a dynamic UI based on user interactions and data changes.'
    },
    {
      'question': 'What is a Scaffold?',
      'answer':
          'A Scaffold is a layout structure in Flutter that provides basic visual components like AppBar, Drawer, FloatingActionButton, and more.'
    },
    {
      'question': 'What is setState in Flutter?',
      'answer':
          'setState is a method used to update the state of a StatefulWidget and trigger a rebuild of the widget with the new state.'
    },
    {
      'question': 'What is an InheritedWidget?',
      'answer':
          'InheritedWidget allows data to be efficiently passed down the widget tree and accessed by descendant widgets.'
    },
    {
      'question': 'What is a Future in Dart?',
      'answer':
          'A Future represents a value that will be available at some point in the future. It’s used for asynchronous operations.'
    },
    {
      'question': 'What is a Stream in Dart?',
      'answer':
          'A Stream is an asynchronous sequence of data. It’s ideal for handling continuous data like user inputs or real-time events.'
    },
    {
      'question': 'What are Keys in Flutter?',
      'answer':
          'Keys are used to identify widgets uniquely and preserve their state across rebuilds, especially in dynamic lists.'
    },
    {
      'question':
          'What is the difference between StatelessWidget and StatefulWidget?',
      'answer':
          'StatelessWidgets are immutable and do not maintain state, while StatefulWidgets can change their state over time.'
    },
    {
      'question': 'What is Navigator in Flutter?',
      'answer':
          'Navigator manages a stack of routes and allows for navigation between different screens in a Flutter app.'
    },
    {
      'question': 'What are the lifecycle methods of a StatefulWidget?',
      'answer':
          'Key lifecycle methods include initState, build, and dispose, which manage the creation, update, and cleanup of a StatefulWidget.'
    }
  ];

  final List<Color> _backgroundColors = [
    const Color(0xFF283618),
    const Color(0xFFF023047),
    const Color(0xFFF3c096c),
    const Color(0xFFF463f3a),
    const Color(0xFFF3d348b),
  ];

  final List<Color> _cardColors = [
    const Color(0xFFFfefae0),
    const Color(0xFFF219ebc),
    const Color(0xFFFe0aaff),
    const Color(0xFFFbcb8b1),
    const Color(0xFFFeae0d5),
  ];

  int _currentIndex = 0;

  void _flipCard(int cardIndex) {
    setState(() {
      _isQuestionVisible[cardIndex] = !_isQuestionVisible[cardIndex];
    });
  }

  void _nextPage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _flashcards.length;
      _isQuestionVisible[0] = true;
      _isQuestionVisible[1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _backgroundColors[_currentIndex % _backgroundColors.length],
      appBar: AppBar(
        title: const Text('Flashcards'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
                height: 10), // Add space at the top to position the text up
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Tap on a card to flip between the question and the answer. '
                'Use the button below to go to the next set of flashcards.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildFlashcard(0),
            const SizedBox(height: 20),
            _buildFlashcard(1),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton.small(
          onPressed: _nextPage,
          child: const Icon(Icons.navigate_next),
        ),
      ),
    );
  }

  Widget _buildFlashcard(int cardIndex) {
    // Calculate the actual index in the flashcards list
    int actualIndex = (_currentIndex + cardIndex) % _flashcards.length;

    return GestureDetector(
      onTap: () => _flipCard(cardIndex),
      child: Container(
        width: 350,
        height: 250,
        decoration: BoxDecoration(
          color: _cardColors[_currentIndex % _cardColors.length],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            _isQuestionVisible[cardIndex]
                ? _flashcards[actualIndex]['question']!
                : _flashcards[actualIndex]['answer']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
