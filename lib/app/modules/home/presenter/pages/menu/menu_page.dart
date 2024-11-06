import 'dart:async';

import 'package:flutter/material.dart' hide MenuController;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../shared/utils/app_routes/app_routes.dart';
import '../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';
import 'components/menu_item_card/menu_item_card.dart';
import 'menu_controller.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with MessageViewMixin, Loader {
  final controller = Modular.get<MenuController>();

  @override
  void initState() {
    super.initState();
    messageListener(controller);

    scheduleMicrotask(() async {
      showLoader(
        title: 'Preparando Ambiente',
        message:
            'Estamos preparando tudo para o correto funcionamento do sistema',
      );

      await Future.wait(
        [this.controller.init(), this.controller.getAppInformations()],
      );

      hideLoader();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: context.screenWidth,
        height: context.screenHeight,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: context.screenWidth,
                height: context.screenHeight * 0.45,
                color: ColorsApp.red,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MenuItemCard(
                    label: 'Separação',
                    description: 'Área para acompanhar todos os pedidos',
                    onPressed: () {
                      Modular.to.pushNamed('${AppRoutes.conference}/');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
