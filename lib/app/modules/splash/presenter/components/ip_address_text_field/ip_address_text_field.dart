import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validatorless/validatorless.dart';

import '../../validators/service_address_validators.dart';

class IPAddressTextField extends StatelessWidget with ServiceAddressValidators {
  final TextEditingController controller;
  final TextInputAction inputAction;

  final Function(String?) onSave;

  const IPAddressTextField({
    super.key,
    required this.controller,
    this.inputAction = TextInputAction.done,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'Endereço de IP',
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(15),
      ],
      textAlign: TextAlign.center,
      validator: Validatorless.multiple([
        Validatorless.regex(
          RegExp(
            r'^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$',
          ),
          'IP Inválido',
        ),
        Validatorless.required('Campo Obrigatório'),
      ]),
      onSaved: onSave,
    );
  }
}
