import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class Anexo {
  final String nome;
  final DateTime dataRealizacao;
  final DateTime dataVencimento;
  final String arquivo;

  Anexo({
    required this.nome,
    required this.dataRealizacao,
    required this.dataVencimento,
    required this.arquivo,
  });
}

class DocumentsTopicsWidget extends StatefulWidget {
  const DocumentsTopicsWidget({
    super.key,
    required this.icone,
    required this.nomeDocumento,
    required this.anexo,
    required this.corPadrao,
  });

  final IconData icone;
  final String nomeDocumento;
  final Anexo anexo;
  final Color corPadrao;

  @override
  State<DocumentsTopicsWidget> createState() => _DocumentsTopicsWidgetState();
}

class _DocumentsTopicsWidgetState extends State<DocumentsTopicsWidget> {

  Future<void> openPDFAsset(BuildContext context, String arquivo) async {
    try {
      final byteData = await rootBundle.load(arquivo);

      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/meuarquivo.pdf');
      await tempFile.writeAsBytes(byteData.buffer.asUint8List());

      await OpenFile.open(tempFile.path);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao abrir PDF: $e')),
      );
    }
  }

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
        children: [
          ListTile(
            title: Text(widget.anexo.nome),
            subtitle: Text(
              'Realizado: ${_formatDate(widget.anexo.dataRealizacao)}\n'
              'Vence: ${_formatDate(widget.anexo.dataVencimento)}',
            ),
            trailing: ElevatedButton(
              onPressed: () {
                openPDFAsset(context, widget.anexo.arquivo);
              },
              style: ElevatedButton.styleFrom(foregroundColor: widget.corPadrao),
              child: Text('Visualizar PDF'),
            ),
          )]
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}
