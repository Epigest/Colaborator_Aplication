import 'package:flutter/material.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 16),
            Text(
              'Seus Treinamentos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SingleChildScrollView(
          child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Card.filled(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: index % 3 == 0
                            ? index % 5 == 0
                                  ? Colors.red
                                  : Colors.orange
                            : Colors.green,
                        width: 6,
                      ),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Text(
                            "NR 10 - Segurança em Eletricidade",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            spacing: 3,
                            children: [
                              Text(
                                "Validade: ",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "15/07/2025",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                color: index % 3 == 0
                                    ? index % 5 == 0
                                          ? Colors.red[100]
                                          : Colors.orange[100]
                                    : Colors.green[100],
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Row(
                                    spacing: 5,
                                    children: [
                                      Icon(
                                        index % 3 == 0
                                            ? index % 5 == 0
                                                  ? Icons.error_outline
                                                  : Icons.warning_amber_rounded
                                            : Icons.verified,
                                        color: index % 3 == 0
                                            ? index % 5 == 0
                                                  ? Colors.red
                                                  : Colors.orange
                                            : Colors.green,
                                        size: 15,
                                      ),
                                      Text(
                                        index % 3 == 0
                                            ? index % 5 == 0
                                                  ? 'Vencido'
                                                  : 'Vencerá em breve'
                                            : 'Em dia',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: index % 3 == 0
                                              ? index % 5 == 0
                                                    ? Colors.red
                                                    : Colors.orange
                                              : Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              OutlinedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(50, 35),
                                  foregroundColor: Theme.of(context).colorScheme.tertiaryContainer,
                                ),
                                label: Text(
                                  'Visualizar',
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                icon: Icon(
                                  Icons.visibility_outlined,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
