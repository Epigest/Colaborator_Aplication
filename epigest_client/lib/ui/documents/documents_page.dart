import 'package:flutter/material.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              List documents = ['Atestado Médico', 'Certificados', 'Exames Ocupacionais'];
              return ListTile(
                shape: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                leading: Icon(Icons.edit_document),
                title: Text(documents[index]),
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
