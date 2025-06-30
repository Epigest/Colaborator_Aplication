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
  int index = Routefly.query.arguments['index'] + 1 ?? 0;

  @override
  Widget build(BuildContext context) {
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
                          'assets/imgs/epi.jpeg',
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(150, 40),
                              iconColor: Colors.blueAccent,
                              foregroundColor: Colors.blueAccent,
                            ),
                            label: Text(
                              'Ficha de EPI',
                            ),
                            icon: Icon(Icons.file_open_outlined),
                          ),
                          OutlinedButton.icon(
                            onPressed: () {
                              Routefly.push(routePaths.epi.epiRequest);
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
                                    value: '321568',
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: TextFieldWidget(
                                    campo: 'Vencimento CA',
                                    value: '14/07/2026',
                                  ),
                                ),
                              ],
                            ),
                            TextFieldWidget(
                              campo: 'Nome do EPI',
                              value: 'Luva de Proteção',
                            ),
                            Row(
                              spacing: 16,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextFieldWidget(
                                    campo: 'Fabricante',
                                    value: 'Kalipso',
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
                child: SizedBox(height: 80, child: CardDateWidget()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
