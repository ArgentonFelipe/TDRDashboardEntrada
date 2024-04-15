import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../shared/domain/entities/service_address/service_address.dart';
import '../../../../../shared/presenter/components/alert_dialog_button/alert_dialog_button.dart';
import '../../../../../shared/utils/styles/colors_app/colors_app.dart';
import '../../../../../shared/utils/styles/text_styles/text_styles.dart';
import '../ip_address_text_field/ip_address_text_field.dart';
import '../port_text_field/port_text_field.dart';
import 'alert_dialog_device_configurations_controller.dart';

typedef DeviceConfigurationsTripe
    = TripleBuilder<AlertDialogServiceAddressController, ServiceAddress>;

class AlertDialogServiceAddress extends StatefulWidget {
  const AlertDialogServiceAddress({super.key});

  @override
  State<AlertDialogServiceAddress> createState() =>
      _AlertDialogDeviceConfigurationsState();
}

class _AlertDialogDeviceConfigurationsState
    extends State<AlertDialogServiceAddress> {
  final controller = Modular.get<AlertDialogServiceAddressController>();

  final formKey = GlobalKey<FormState>();

  final ipAddressController = TextEditingController(text: '');
  final portAddressController = TextEditingController(text: '');

  @override
  void dispose() {
    ipAddressController.dispose();
    portAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Configuração Inicial',
          style: context.textStyles.title,
        ),
      ),
      content: Form(
        key: this.formKey,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Informações para ao serviço',
                textAlign: TextAlign.center,
                style: context.textStyles.body,
              ),
              const SizedBox(height: 20),
              IPAddressTextField(
                controller: this.ipAddressController,
                onSave: controller.saveIPAddress,
              ),
              const SizedBox(height: 20),
              PortTextField(
                controller: this.portAddressController,
                onSaved: controller.savePort,
              ),
              const SizedBox(height: 10),
              Text(
                'Estes dados podem ser alterados na aba de configurações',
                textAlign: TextAlign.center,
                style: context.textStyles.body.copyWith(
                  color: context.colors.primary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        const Divider(),
        Center(
          child: AlertDialogButton(
            label: 'Configurar',
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                this.controller.setConfigurations().then(
                  (canPop) {
                    if (canPop) {
                      Navigator.of(context).pop();
                    }
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
