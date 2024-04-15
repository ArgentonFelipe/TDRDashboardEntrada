import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validatorless/validatorless.dart';

import '../../validators/service_address_validators.dart';

class PortTextField extends StatelessWidget with ServiceAddressValidators {
  final TextEditingController controller;
  final Function(String?) onSaved;

  const PortTextField({
    super.key,
    required this.controller,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorWidth: 2,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Porta',
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: Validatorless.required('Campo Obrigatório'),
      textAlign: TextAlign.center,
      onSaved: onSaved,
    );
  }
}
