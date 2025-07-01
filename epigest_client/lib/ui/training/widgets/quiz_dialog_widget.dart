import 'package:flutter/material.dart';

class QuizDialogWidget extends StatefulWidget {
  const QuizDialogWidget({super.key});

  @override
  State<QuizDialogWidget> createState() => _QuizDialogWidgetState();
}

class _QuizDialogWidgetState extends State<QuizDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  final List<int?> _answers = [null, null, null, null, null];
  int _currentQuestionIndex = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'O que significa NR 10?',
      'options': [
        'Norma Regulamentadora sobre Segurança em Instalações e Serviços em Eletricidade',
        'Norma de Regulação 10',
        'Norma de Resistência 10',
        'Nenhuma das alternativas'
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'O uso de EPI é obrigatório em trabalhos com eletricidade?',
      'options': ['Sim, sempre', 'Não, é opcional', 'Apenas em alta tensão', 'Apenas em baixa tensão'],
      'correctAnswer': 0,
    },
    {
      'question': 'Qual a tensão considerada baixa tensão?',
      'options': ['Até 1000V em CA ou 1500V em CC', 'Até 500V', 'Até 220V', 'Até 380V'],
      'correctAnswer': 0,
    },
    {
      'question': 'É permitido trabalhar sozinho em instalações elétricas?',
      'options': ['Sim, sempre', 'Não, nunca', 'Apenas em baixa tensão', 'Depende da situação'],
      'correctAnswer': 3,
    },
    {
      'question': 'Você assistiu ao vídeo completo sobre NR 10?',
      'options': ['Sim', 'Não'],
      'correctAnswer': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prova NR 10'),
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Questão ${_currentQuestionIndex + 1} de ${_questions.length}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${((_currentQuestionIndex + 1) / _questions.length * 100).round()}%',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: (_currentQuestionIndex + 1) / _questions.length,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
                  ),
                ],
              ),
            ),
            // Question content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          _questions[_currentQuestionIndex]['question'],
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _questions[_currentQuestionIndex]['options'].length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: RadioListTile<int>(
                              title: Text(
                                _questions[_currentQuestionIndex]['options'][index],
                                style: const TextStyle(fontSize: 16),
                              ),
                              value: index,
                              groupValue: _answers[_currentQuestionIndex],
                              onChanged: (value) {
                                setState(() {
                                  _answers[_currentQuestionIndex] = value;
                                });
                              },
                              activeColor: const Color(0xFF2196F3),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Navigation buttons
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  if (_currentQuestionIndex > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            _currentQuestionIndex--;
                          });
                        },
                        child: const Text('Anterior'),
                      ),
                    ),
                  if (_currentQuestionIndex > 0) const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2196F3),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        if (_answers[_currentQuestionIndex] == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Por favor, selecione uma resposta'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        if (_currentQuestionIndex < _questions.length - 1) {
                          setState(() {
                            _currentQuestionIndex++;
                          });
                        } else {
                          _finishQuiz();
                        }
                      },
                      child: Text(
                        _currentQuestionIndex < _questions.length - 1 ? 'Próxima' : 'Finalizar',
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _finishQuiz() {
    int correctAnswers = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_answers[i] == _questions[i]['correctAnswer']) {
        correctAnswers++;
      }
    }

    double percentage = (correctAnswers / _questions.length) * 100;
    bool passed = percentage >= 70; // 70% para aprovação

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(passed ? 'Parabéns!' : 'Resultado'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              passed ? Icons.check_circle : Icons.cancel,
              color: passed ? Colors.green : Colors.red,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              'Você acertou $correctAnswers de ${_questions.length} questões',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              '${percentage.round()}%',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              passed ? 'Aprovado!' : 'Reprovado - Necessário 70% para aprovação',
              style: TextStyle(
                color: passed ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o dialog
              Navigator.of(context).pop(); // Volta para a tela anterior
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}