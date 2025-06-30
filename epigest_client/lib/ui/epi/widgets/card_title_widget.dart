import 'package:flutter/material.dart';

class CardTitleWidget extends StatelessWidget {
  const CardTitleWidget({
    super.key,
    required this.titulo,
    required this.children,
    required this.icone,
  });

  final String titulo;
  final IconData icone;
  final Widget children;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
        side: BorderSide(color: Colors.black45),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 5,
              children: [
                Icon(icone, size: 20),
                Text(titulo),
              ],
            ),
            children,
          ],
        ),
      ),
    );
  }
}
