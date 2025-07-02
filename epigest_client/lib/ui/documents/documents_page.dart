import 'package:epigest_client/ui/documents/widgets/documents_topics_widget.dart';
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
              final docs = ['Atestado Médico', 'Certificados', 'Exames Ocupacionais'];
              final icons = [Icons.medical_information_rounded, Icons.workspace_premium, Icons.assignment];
              final cores = [Colors.green, Colors.orange, Colors.blue];
              final anexos = [
                Anexo(
                  nome: 'Atestado Médico',
                  dataRealizacao: DateTime(2024, 6, 1),
                  dataVencimento: DateTime(2025, 6, 1),
                  arquivo: 'assets/pdfs/Atestado Médico.pdf',
                ),
                Anexo(
                  nome: 'Certificados',
                  dataRealizacao: DateTime(2024, 6, 1),
                  dataVencimento: DateTime(2025, 6, 1),
                  arquivo: 'assets/pdfs/modelo_certificado_nr1.pdf',
                ),
                Anexo(
                  nome: 'Exames Ocupacionais',
                  dataRealizacao: DateTime(2024, 6, 1),
                  dataVencimento: DateTime(2025, 6, 1),
                  arquivo: 'assets/pdfs/Exame Ocupacional.pdf',
                ),
              ];
              return DocumentsTopicsWidget(
                icone: icons[index],
                nomeDocumento: docs[index],
                anexo: anexos[index],
                corPadrao: cores[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
