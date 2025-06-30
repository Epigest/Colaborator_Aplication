import 'package:epigest_client/main.dart';
import 'package:epigest_client/ui/epi/widgets/card_epi_widget.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class EpiListPage extends StatefulWidget {
  const EpiListPage({super.key});

  @override
  State<EpiListPage> createState() => _EpiListPageState();
}

class _EpiListPageState extends State<EpiListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        children: [
          Row(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardEpiWidget(
                titulo: 'EPIs Ativos',
                subtitulo: 'Em uso atualmente',
                icone: Icons.shield_rounded,
                valor: 5,
                cor: Colors.blue,
              ),
              CardEpiWidget(
                titulo: 'Alertas',
                subtitulo: 'EPIs para atenção',
                icone: Icons.warning_rounded,
                valor: 2,
                cor: Colors.orange,
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 16),
              Text(
                'Seus EPIs',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ListView.builder(
            itemCount: 25,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Card.filled(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: index % 3 == 0
                            ? index % 5 == 0
                                  ? Colors.red
                                  : Colors.orange
                            : Colors.green,
                        width: 6,
                      ),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Routefly.pushNavigate(
                        routePaths.epi.epiDetails,
                        arguments: {
                          'index': index,
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        spacing: 6,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                spacing: 5,
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    size: 18,
                                  ),
                                  Text(
                                    "Entregue em 14/05/2025",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Card(
                                color: index % 3 == 0
                                    ? index % 5 == 0
                                          ? Colors.red[100]
                                          : Colors.orange[100]
                                    : Colors.green[100],
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Row(
                                    spacing: 5,
                                    children: [
                                      Icon(
                                        index % 3 == 0
                                            ? index % 5 == 0
                                                  ? Icons.error_outline
                                                  : Icons.warning_amber_rounded
                                            : Icons.verified,
                                        color: index % 3 == 0
                                            ? index % 5 == 0
                                                  ? Colors.red
                                                  : Colors.orange
                                            : Colors.green,
                                        size: 15,
                                      ),
                                      Text(
                                        index % 3 == 0
                                            ? index % 5 == 0
                                                  ? 'Vencido'
                                                  : 'Vencerá em breve'
                                            : 'Em dia',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: index % 3 == 0
                                              ? index % 5 == 0
                                                    ? Colors.red
                                                    : Colors.orange
                                              : Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    child: Image.asset(
                                      'assets/imgs/epi.jpeg',
                                      width: 90,
                                      height: 90,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 5,
                                children: [
                                  Text(
                                    'Luva de Proteção',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Modelo: isvbsroyb',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            spacing: 5,
                            children: [
                              Row(
                                spacing: 5,
                                children: [
                                  Icon(
                                    Icons.event_available,
                                    size: 18,
                                  ),
                                  Text(
                                    'Válido até: 18/08/2026',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      borderRadius: BorderRadius.circular(10),
                                      value: index % 3 == 0
                                          ? index % 5 == 0
                                                ? 0.15
                                                : 0.35
                                          : 0.85,
                                      backgroundColor: Colors.white,
                                      minHeight: 7,
                                      color: index % 3 == 0
                                          ? index % 5 == 0
                                                ? Colors.red
                                                : Colors.orange
                                          : Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: OutlinedButton.icon(
                              onPressed: () {
                                Routefly.push(
                                  routePaths.epi.epiRequest,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(50, 35),
                              ),
                              label: Text(
                                'Solicitar Troca',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              icon: Icon(
                                Icons.swap_horiz_sharp,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
