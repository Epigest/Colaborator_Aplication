import 'package:flutter/material.dart';

class DocumentsTopicsWidget extends StatefulWidget {
  const DocumentsTopicsWidget({super.key});

  @override
  State<DocumentsTopicsWidget> createState() => _DocumentsTopicsWidgetState();
}

class _DocumentsTopicsWidgetState extends State<DocumentsTopicsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(16),
          child: ExpansionTile(
            title: Text('Fichas de EPIs'),
          ),
        );
      },
    );
  }
}
