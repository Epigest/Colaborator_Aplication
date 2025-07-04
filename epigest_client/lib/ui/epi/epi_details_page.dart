import 'package:epigest_client/ui/epi/widgets/card_date_widget.dart';
import 'package:epigest_client/ui/epi/widgets/card_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

import 'package:epigest_client/main.dart';
import 'package:epigest_client/ui/home/widgets/app_bar_widget.dart';
import 'package:epigest_client/ui/epi/widgets/text_field_widget.dart';

class EpiDetailsPage extends StatefulWidget {
  const EpiDetailsPage({super.key});

  @override
  State<EpiDetailsPage> createState() => _EpiDetailsPageState();
}

class _EpiDetailsPageState extends State<EpiDetailsPage> {
  final epi = Routefly.query.arguments['epi'];

  @override
  Widget build(BuildContext context) {
    final validade = epi['validade'] as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBarWidget(backButton: true),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    spacing: 16,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 80),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                            width: 1.5,
                          ),
                        ),
                        child: Image.asset(
                          '${epi['img']}',
                          width: 210,
                          height: 210,
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: TextFieldWidget(
                          campo: 'Código',
                          value: 'LV1M84575',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 15,
                        children: [
                          OutlinedButton.icon(
                            onPressed: () {
                              Routefly.pushNavigate(
                                routePaths.epi.epiRequest,
                                arguments: {'epi': epi},
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(150, 40),
                            ),
                            label: Text(
                              'Solicitar Troca',
                            ),
                            icon: Icon(Icons.swap_horiz_sharp),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      CardTitleWidget(
                        icone: Icons.info,
                        titulo: 'Informações Técnicas',
                        children: Column(
                          spacing: 15,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 32,
                              children: [
                                SizedBox(
                                  width: 90,
                                  child: TextFieldWidget(
                                    campo: 'CA',
                                    value: '${epi['ca']}',
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: TextFieldWidget(
                                    campo: 'Vencimento CA',
                                    value: '${validade['data']}',
                                  ),
                                ),
                              ],
                            ),
                            TextFieldWidget(
                              campo: 'Nome do EPI',
                              value: '${epi['nome']}',
                            ),
                            Row(
                              spacing: 16,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextFieldWidget(
                                    campo: 'Fabricante',
                                    value: '${epi['modelo']}',
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextFieldWidget(
                                    campo: 'Tamanho',
                                    value: 'P',
                                  ),
                                ),
                              ],
                            ),
                            TextFieldWidget(
                              campo: 'Responsável',
                              value: 'José Silva (RH)',
                            ),
                            TextFieldWidget(
                              campo: 'Local de Armazenamento',
                              value: 'Almoxarifado Central',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
                child: SizedBox(height: 80, child: CardDateWidget(epi: epi)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
