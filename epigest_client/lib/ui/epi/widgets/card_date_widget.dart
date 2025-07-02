import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class CardDateWidget extends StatefulWidget {
  const CardDateWidget({super.key, this.epi});

  final epi;

  @override
  State<CardDateWidget> createState() => _CardDateWidgetState();
}

class _CardDateWidgetState extends State<CardDateWidget> {
  @override
  Widget build(BuildContext context) {
    final validade = widget.epi['validade'] as Map<String, dynamic>;

    Color _getStatusColor(String status) {
      switch (status) {
        case 'Vencido':
          return Colors.red[100]!;
        case 'Vencerá em breve':
          return Colors.orange[100]!;
        default:
          return Colors.green[100]!;
      }
    }

    IconData _getStatusIcon(String status) {
      switch (status) {
        case 'Vencido':
          return Icons.error_outline;
        case 'Vencerá em breve':
          return Icons.warning_amber_rounded;
        default:
          return Icons.verified;
      }
    }

    Color _getStatusIconColor(String status) {
      switch (status) {
        case 'Vencido':
          return Colors.red;
        case 'Vencerá em breve':
          return Colors.orange;
        default:
          return Colors.green;
      }
    }

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
                      'Válido até: ${validade['data']}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Card(
                  color: _getStatusColor(validade['status']),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      spacing: 5,
                      children: [
                        Icon(
                          _getStatusIcon(validade['status']),
                          color: _getStatusIconColor(validade['status']),
                          size: 15,
                        ),
                        Text(
                          validade['status'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: _getStatusIconColor(validade['status']),
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
                    value:validade['progresso'],
                    backgroundColor: Colors.white,
                    minHeight: 7,
                    color: widget.epi['cor'] as Color,
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
