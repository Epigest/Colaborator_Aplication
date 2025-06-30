import 'package:epigest_client/main.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class NotificationWidget extends StatefulWidget {
  final IconData icone;
  final Color cor;
  final String titulo, frase;

  const NotificationWidget({
    super.key,
    this.icone = Icons.info_outline_rounded,
    this.cor = Colors.blue,
    this.titulo = "Notificação Teste",
    this.frase = "frase teste para o EPI Luvas de Anti-corte.",
  });

  const NotificationWidget.epiVencido({
    super.key,
    this.icone = Icons.warning_amber_rounded,
    this.cor = Colors.red,
    this.titulo = "EPI Vencido",
    this.frase = "Luvas de Anti-corte venceu há 2 dias. Solicite a troca imediatamente",
  });

  const NotificationWidget.epiAVencer({
    super.key,
    this.icone = Icons.history,
    this.cor = Colors.orange,
    this.titulo = "EPI Prestes a vencer",
    this.frase = "Luvas de Anti-corte vencerá daqui 10 dias. Solicite a troca antes que a validade acabe",
  });

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: Border(
        bottom: BorderSide(
          width: 1,
          color: Colors.grey,
        ),
      ),
      leading: Card.filled(
        color: widget.cor,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            widget.icone,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(widget.titulo),
      subtitle: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.frase),
          Row(
            spacing: 20,
            children: [
              FilledButton.icon(
                onPressed: () {
                  Routefly.push(routePaths.epi.epiRequest);
                },
                style: ElevatedButton.styleFrom(minimumSize: Size(80, 30), backgroundColor: widget.cor),
                label: Text(
                  'Solicitar Troca',
                  style: TextStyle(fontSize: 13),
                ),
                icon: Icon(Icons.swap_horiz_sharp),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(80, 30),
                  foregroundColor: Theme.of(context).colorScheme.tertiaryContainer,
                ),
                label: Text(
                  'Detalhes',
                  style: TextStyle(fontSize: 13),
                ),
                icon: Icon(Icons.info),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
