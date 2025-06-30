import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class CardDateWidget extends StatefulWidget {
  const CardDateWidget({super.key});

  @override
  State<CardDateWidget> createState() => _CardDateWidgetState();
}

class _CardDateWidgetState extends State<CardDateWidget> {
  int index = Routefly.query.arguments['index'] + 1 ?? 0;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          spacing: 12,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Icon(
                      Icons.event_available,
                      size: 22,
                    ),
                    Text(
                      'Válido até: 18/08/2026',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
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
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    value: index % 3 == 0
                        ? index % 5 == 0
                              ? 0.15
                              : 0.35
                        : 0.85,
                    backgroundColor: Colors.white,
                    minHeight: 7,
                    color: index % 3 == 0
                        ? index % 5 == 0
                              ? Colors.red
                              : Colors.orange
                        : Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
