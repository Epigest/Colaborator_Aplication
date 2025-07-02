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
  final epis = [
    {
      'ca': '25148',
      'img': 'assets/imgs/epi1.jpeg',
      'nome': 'Luva de Proteção',
      'modelo': 'Kalipsu',
      'data_entrega': '14/05/2025',
      'cor': Colors.green,
      'validade': {
        'data': '18/08/2026',
        'status': 'Em dia',
        'progresso': 0.95,
      },
    },
    {
      'ca': '85472',
      'img': 'assets/imgs/epi2.png',
      'nome': 'Capacete',
      'modelo': 'isvbsroyb',
      'data_entrega': '20/01/2025',
      'cor': Colors.red,
      'validade': {
        'data': '09/07/2025',
        'status': 'Vencerá em breve',
        'progresso': 0.05,
      },
    },
    {
      'ca': '57293',
      'img': 'assets/imgs/epi3.jpg',
      'nome': 'Protetor auricular plug',
      'modelo': 'isvbsroyb',
      'data_entrega': '16/06/2025',
      'cor': Colors.green,
      'validade': {
        'data': '18/09/2025',
        'status': 'Em dia',
        'progresso': 0.75,
      },
    },
    {
      'ca': '81057',
      'img': 'assets/imgs/epi4.jpg',
      'nome': 'Luva Química',
      'modelo': 'isvbsroyb',
      'data_entrega': '25/06/2025',
      'cor': Colors.green,
      'validade': {
        'data': '08/11/2025',
        'status': 'Em dia',
        'progresso': 0.85,
      },
    },
    {
      'ca': '71385',
      'img': 'assets/imgs/epi5.jpg',
      'nome': 'Botina de Segurança',
      'modelo': 'isvbsroyb',
      'data_entrega': '30/06/2025',
      'cor': Colors.orange,
      'validade': {
        'data': '30/07/2025',
        'status': 'Vencerá em breve',
        'progresso': 0.35,
      },
    },
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Vencido':
        return Colors.red[100]!;
      case 'Vencerá em breve':
        return Colors.orange[100]!;
      default:
        return Colors.green[100]!;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Vencido':
        return Icons.error_outline;
      case 'Vencerá em breve':
        return Icons.warning_amber_rounded;
      default:
        return Icons.verified;
    }
  }

  Color _getStatusIconColor(String status) {
    switch (status) {
      case 'Vencido':
        return Colors.red;
      case 'Vencerá em breve':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

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
            itemCount: epis.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final epi = epis[index];
              final validade = epi['validade'] as Map<String, dynamic>;

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
                        color: epis[index]['cor'] as Color,
                        width: 6,
                      ),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Routefly.pushNavigate(
                        routePaths.epi.epiDetails,
                        arguments: {'epi': epi},
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
                                    "Entregue em ${epis[index]['data_entrega']}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Card(
                                color: _getStatusColor(validade['status']),
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Row(
                                    spacing: 5,
                                    children: [
                                      Icon(
                                        _getStatusIcon(validade['status']),
                                        color:  _getStatusIconColor(validade['status']),
                                        size: 15,
                                      ),
                                      Text(
                                        validade['status'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: _getStatusIconColor(validade['status']),
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
                                      '${epi['img']}',
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
                                    '${epi['nome']}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Modelo: ${epi['modelo']}',
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
                                    'Válido até: ${validade['data']}',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      borderRadius: BorderRadius.circular(10),
                                      value: validade['progresso'],
                                      backgroundColor: Colors.white,
                                      minHeight: 7,
                                      color: epi['cor'] as Color,
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
                                Routefly.pushNavigate(
                                  routePaths.epi.epiRequest,
                                  arguments: {'epi': epi}
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
