import 'question_module.dart';
import 'package:flutter/material.dart';

class QuizAppPage extends StatefulWidget {
  const QuizAppPage({super.key});

  @override
  State<QuizAppPage> createState() => _QuizAppPageState();
}

class _QuizAppPageState extends State<QuizAppPage> {
  List<QuestionModules> list = [
    const QuestionModules(
        question: 'What is the current year',
        options: ['2022', '2024', '1796', '1947'],
        answerOption: 1),
    const QuestionModules(
        question: 'Independance Year of India is',
        options: ['1947', '1756', '2018', '1897'],
        answerOption: 0),
    const QuestionModules(
        question: 'Which is sportShoes brand from below',
        options: ['Ray Ban', 'Neod', 'Samsung', 'Nike'],
        answerOption: 3),
    const QuestionModules(
        question: 'Who is called Missile Man',
        options: [
          'Sardar Wallabhbhai Patel',
          'Manmohan Singh',
          'APJ Abdul Kalam',
          'Narendra Modi'
        ],
        answerOption: 2),
    const QuestionModules(
        question: 'Flutter Codes are written in which language',
        options: ['Dart', 'Java', 'Python', 'JavaScript'],
        answerOption: 0),
  ];

  int questionIndex = 0;
  bool quizScreen = true;

  int optionChossen = -1;
  int result = 0;

  MaterialStatePropertyAll<Color?> check(int option) {
    if (optionChossen != -1) {
      if (option == list[questionIndex].answerOption) {
        if (option == optionChossen) {
          result++;
        }
        return const MaterialStatePropertyAll(Colors.green);
      } else if (option == optionChossen) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(Colors.white);
      }
    } else {
      return const MaterialStatePropertyAll(Colors.white);
    }
  }

  Padding costumButton(option) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: check(option)),
        onPressed: () {
          if (optionChossen == -1) {
            optionChossen = option;
          }
          setState(() {
            result;
          });
        },
        child: SizedBox(
          width: 250,
          child: Text(
            list[questionIndex].options[option],
            style: const TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  congratsPopUp() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Congratulations ! ',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/congo.png'),
              Text(
                'Congratulations ! You have scored $result of ${list.length}',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  result = 0;
                  questionIndex = 0;
                });
                Navigator.pop(context);
              },
              child: const Text('Reset'),
            ),
          ],
        );
      },
    );
  }

  wroungPopUp() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Null Input !'),
          content: const Text('Please chose the option from above'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Okay !'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu_open_rounded,
          color: Colors.white,
          size: 30,
        ),
        title: const Text(
          'Quiz App',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 26,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromRGBO(43, 64, 86, 1),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.quiz_outlined,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (optionChossen == -1) {
              wroungPopUp();
            } else {
              questionIndex++;
              if (questionIndex == 5) {
                questionIndex = 4;
                congratsPopUp();
              }
            }

            optionChossen = -1;
          });
        },
        child: const Icon(Icons.navigate_next),
      ),
      body: Container(
        color: const Color.fromRGBO(37, 42, 64, 1),
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 50),
                child: Text(
                  'Score : $result/5',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 50, bottom: 50, right: 20, left: 20),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(10, 10),
                          blurRadius: 8),
                      BoxShadow(
                          color: Color.fromARGB(255, 245, 245, 245),
                          offset: Offset(10, 10),
                          blurRadius: 8)
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${questionIndex + 1} . ${list[questionIndex].question}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    costumButton(0),
                    costumButton(1),
                    costumButton(2),
                    costumButton(3),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
