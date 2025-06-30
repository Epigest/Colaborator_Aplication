import 'package:epigest_client/ui/documents/documents_page.dart';
import 'package:epigest_client/ui/epi/epi_list_page.dart';
import 'package:epigest_client/ui/ficha_epi/ficha_epi_page.dart';
import 'package:epigest_client/ui/home/widgets/app_bar_widget.dart';
import 'package:epigest_client/ui/training/training_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    EpiListPage(),
    FichaEpiPage(),
    DocumentsPage(),
    TrainingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(backButton: false),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.construction_sharp),
            label: 'EPIs',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_turned_in),
            label: 'Ficha de EPI',
          ),
          NavigationDestination(
            icon: Icon(Icons.edit_document),
            label: 'Documentos',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_rounded),
            label: 'Treinamentos',
          ),
        ],
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
