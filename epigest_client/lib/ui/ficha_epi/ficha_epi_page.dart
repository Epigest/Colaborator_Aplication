import 'package:flutter/material.dart';

class FichaEpiPage extends StatefulWidget {
  const FichaEpiPage({super.key});

  @override
  State<FichaEpiPage> createState() => _FichaEpiPageState();
}

class _FichaEpiPageState extends State<FichaEpiPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                shape: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                leading: Icon(Icons.assignment_turned_in),
                title: Text('Ficha EPI ${index + 1} - 00/00/0000'),
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
