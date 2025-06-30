import 'package:flutter/material.dart';

class CardEpiWidget extends StatefulWidget {
  const CardEpiWidget({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.icone,
    required this.valor,
    required this.cor,
  });

  final String titulo;
  final String subtitulo;
  final IconData icone;
  final int valor;
  final Color cor;

  @override
  State<CardEpiWidget> createState() => _CardEpiWidgetState();
}

class _CardEpiWidgetState extends State<CardEpiWidget> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card.filled(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        color: status ? widget.cor.withValues(alpha: 0.4) : null,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: widget.cor,
                width: 6,
              ),
            ),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                status = !status;
              });
            },
            child: Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 15,
                    children: [
                      Text(
                        widget.titulo,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Card.filled(
                        color: widget.cor,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(widget.icone, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.valor.toString(),
                    style: TextStyle(
                      fontSize: 32,
                      color: widget.cor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.subtitulo),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
