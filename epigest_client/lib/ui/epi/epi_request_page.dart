import 'package:dotted_border/dotted_border.dart';
import 'package:epigest_client/ui/home/widgets/app_bar_widget.dart';
import 'package:epigest_client/ui/epi/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

enum RequestType { normal, urgente }

class EpiRequestPage extends StatefulWidget {
  const EpiRequestPage({super.key});

  @override
  State<EpiRequestPage> createState() => _EpiRequestPageState();
}

class _EpiRequestPageState extends State<EpiRequestPage> {
  String _selectedChoice = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(backButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 24,
              children: [
                Row(
                  spacing: 16,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                          width: 1.5,
                        ),
                      ),
                      child: Image.asset(
                        'assets/imgs/epi.jpeg',
                        width: 140,
                        height: 140,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        spacing: 10,
                        children: [
                          TextFieldWidget(
                            campo: 'Nome do EPI',
                            value: 'Luva de Proteção para Construção Cívil',
                          ),
                          TextFieldWidget(
                            campo: 'Validade EPI',
                            value: '18/08/2026',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    ChoiceChip(
                      label: const Text('Defeito'),
                      selected: _selectedChoice == 'defeito',
                      avatar: Icon(Icons.warning_amber_rounded),
                      showCheckmark: false,
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedChoice = selected ? 'defeito' : '';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Desgaste'),
                      avatar: Icon(Icons.broken_image_outlined),
                      showCheckmark: false,
                      selected: _selectedChoice == 'desgaste',
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedChoice = selected ? 'desgaste' : '';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Vencido'),
                      selected: _selectedChoice == 'vencido',
                      showCheckmark: false,
                      avatar: Icon(Icons.event_busy),
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedChoice = selected ? 'vencido' : '';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Perca'),
                      selected: _selectedChoice == 'perca',
                      showCheckmark: false,
                      avatar: Icon(Icons.remove_circle_outline),
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedChoice = selected ? 'perca' : '';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Substituir'),
                      selected: _selectedChoice == 'substituir',
                      showCheckmark: false,
                      avatar: Icon(Icons.published_with_changes_outlined),
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedChoice = selected ? 'substituir' : '';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Outro'),
                      avatar: Icon(Icons.more_horiz),
                      showCheckmark: false,
                      selected: _selectedChoice == 'outro',
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedChoice = selected ? 'outro' : '';
                        });
                      },
                    ),
                  ],
                ),
                DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    dashPattern: [10, 5],
                    radius: Radius.circular(10),
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(16),
                      child: Column(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 70,
                          ),
                          Text(
                            'Toque para adicionar uma foto',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Mostre o estado atual do equipamento',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Observações',
                    hintText: "Descreva o problema com detalhes (opcional)",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Realizar a solicitação'),
        icon: Icon(Icons.send),
      ),
    );
  }
}
