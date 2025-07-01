import 'package:flutter/material.dart';

class Anexo {
  final String nome;
  final DateTime dataRealizacao;
  final DateTime dataVencimento;
  final String pdfUrl;

  Anexo({
    required this.nome,
    required this.dataRealizacao,
    required this.dataVencimento,
    required this.pdfUrl,
  });
}

class DocumentsTopicsWidget extends StatefulWidget {
  const DocumentsTopicsWidget({
    super.key,
    required this.icone,
    required this.nomeDocumento,
    required this.anexos,
    required this.corPadrao,
  });

  final IconData icone;
  final String nomeDocumento;
  final List<Anexo> anexos;
  final Color corPadrao;

  @override
  State<DocumentsTopicsWidget> createState() => _DocumentsTopicsWidgetState();
}

class _DocumentsTopicsWidgetState extends State<DocumentsTopicsWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.corPadrao.withValues(alpha: 0.5),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
          side: BorderSide(color: widget.corPadrao),
        ),
        textColor: widget.corPadrao,
        iconColor: widget.corPadrao,
        leading: Icon(widget.icone),
        title: Text(widget.nomeDocumento),
        trailing: Icon(Icons.arrow_drop_down),
        backgroundColor: Colors.white,
        collapsedBackgroundColor: widget.corPadrao,
        children: widget.anexos.map((anexo) {
          return ListTile(
            title: Text(anexo.nome),
            subtitle: Text(
              'Realizado: ${_formatDate(anexo.dataRealizacao)}\n'
              'Vence: ${_formatDate(anexo.dataVencimento)}',
            ),
            trailing: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(foregroundColor: widget.corPadrao),
              child: Text('Visualizar PDF'),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}
