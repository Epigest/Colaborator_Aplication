import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String campo;
  final String value;

  const TextFieldWidget({super.key, required this.campo, required this.value});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      maxLines: null,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        label: Text(
          widget.campo,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w500
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 2,
          ),
        ),
      ),
      controller: TextEditingController(
        text: widget.value,
      ),
    );
  }
}
