import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../shared/presenter/components/alert_dialog_info/alert_dialog_info.dart';
import '../../../../../shared/presenter/components/app_logo/app_logo.dart';
import '../../../../../shared/presenter/components/app_version_informations/app_version_informaitons.dart';
import '../../../../../shared/presenter/components/default_elevated_button/default_elevated_button.dart';
import '../../../../../shared/presenter/components/default_text_button/default_text_button.dart';
import '../../../../../shared/utils/default_failure_messages/default_failure_messages.dart';
import '../../../../../shared/utils/routes/app_routes.dart';
import '../../../../../shared/utils/styles/colors_app/colors_app.dart';
import '../../../../../shared/utils/styles/screen_manager/screen_size/screen_size.dart';
import '../../../../../shared/utils/styles/text_styles/text_styles.dart';
import 'home_controller.dart';

typedef HomeTripleBuilder = TripleBuilder<HomeController, bool>;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();
  // late final Disposer disposer;

  @override
  void initState() {
    super.initState();
    // disposer = controller.observer(
    //   onError: (error) async {
    //     showDialog(
    //       barrierDismissible: false,
    //       context: context,
    //       builder: (context) {
    //         return AlertDialogInfo(
    //           title: error is EmptyOrderFailure
    //               ? 'Sem Notas'
    //               : 'Comportamento Inesperado',
    //           description: error.message ?? DefaultFailureMessages.errorMessage,
    //         );
    //       },
    //     );
    //   },
    // );
  }

  @override
  void dispose() {
    // disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          HomeTripleBuilder(
            store: this.controller,
            builder: (_, triple) {
              return DefaultTextButton(
                label: 'Configurações',
                icon: Icons.settings,
                onPressed: triple.isLoading
                    ? null
                    : () => Modular.to.pushNamed('${AppRoutes.settings}/'),
              );
            },
          ),
          Expanded(child: Container()),
          HomeTripleBuilder(
            store: this.controller,
            builder: (_, triple) {
              return DefaultTextButton(
                label: 'Sair',
                icon: Icons.logout,
                onPressed: triple.isLoading ? null : this.controller.doLogout,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const AppLogo(),
            Column(
              children: <Widget>[
                const Divider(
                  color: Colors.white,
                  height: 20,
                ),
                Text(
                  this.controller.displayName,
                  style: context.textStyles.title.copyWith(color: Colors.white),
                ),
                const Divider(
                  color: Colors.white,
                  height: 20,
                ),
              ],
            ),
            Column(
              children: [
                HomeTripleBuilder(
                  store: this.controller,
                  builder: (_, triple) {
                    return DefaultElevatedButton(
                      height: 50,
                      onPressed: () {},
                      label: 'Buscar Nota',
                      backgroundColor: Colors.white,
                      textColor: context.colors.primary,
                      isLoading: triple.isLoading,
                      elevation: 10,
                      width: context.screenWidth,
                    );
                  },
                ),
                const SizedBox(height: 30),
                HomeTripleBuilder(
                  store: this.controller,
                  builder: (_, triple) {
                    return Visibility(
                      visible: this.controller.isAdmin,
                      child: Row(
                        children: [
                          Expanded(
                            child: DefaultElevatedButton(
                              height: 50,
                              // onPressed: this.controller.loadingTest,
                              onPressed: this.controller.pushOrdersPage,
                              label: 'Notas',
                              backgroundColor: Colors.white,
                              textColor: context.colors.primary,
                              isLoading: triple.isLoading,
                              elevation: 10,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: DefaultElevatedButton(
                              height: 50,
                              onPressed: this.controller.pushRegisterCode,
                              label: 'Cad. Código',
                              backgroundColor: Colors.white,
                              textColor: context.colors.primary,
                              isLoading: triple.isLoading,
                              elevation: 10,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Desenvolvido por SRS Desenvolvimento de Sistemas LTDA',
                  textAlign: TextAlign.center,
                  style: context.textStyles.body.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 5),
                AppVersionInformations(
                  appVersion: controller.appVersion,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
