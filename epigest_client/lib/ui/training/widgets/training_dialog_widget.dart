import 'package:epigest_client/ui/training/widgets/quiz_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class TrainingDialogWidget extends StatefulWidget {
  const TrainingDialogWidget({super.key});

  @override
  State<TrainingDialogWidget> createState() => _TrainingDialogWidgetState();
}

class _TrainingDialogWidgetState extends State<TrainingDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    'NR 10 - Segurança em Eletricidade',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Routefly.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              spacing: 12,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 3,
                      children: [
                        Text(
                          'Validade: 15/08/2022',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          color: Colors.red[100],
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Row(
                              spacing: 5,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                  size: 20,
                                ),
                                Text(
                                  'Vencido',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.play_circle_fill,
                      color: Colors.red,
                      size: 64,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 45),
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                  ),
                  icon: const Icon(Icons.description, color: Colors.white),
                  label: const Text(
                    'Iniciar Prova',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () {
                    Routefly.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => const QuizDialogWidget(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
