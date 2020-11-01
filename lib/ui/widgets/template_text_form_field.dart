import 'package:flutter/material.dart';

class TemplateTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const TemplateTextFormField({
    Key key,
    @required this.controller,
    this.label = 'label',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Masukkan $label',
        border: UnderlineInputBorder(),
      ),
      validator: (val) {
        if (val.isEmpty)
          return 'Isian $label tidak boleh kosong';
        else
          return null;
      },
    );
  }
}
