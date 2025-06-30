import 'package:epigest_client/ui/home/widgets/app_bar_widget.dart';
import 'package:epigest_client/ui/notification/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(backButton: true),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    if (index % 5 == 0) {
                      return NotificationWidget.epiVencido();
                    }
                    return NotificationWidget.epiAVencer();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
