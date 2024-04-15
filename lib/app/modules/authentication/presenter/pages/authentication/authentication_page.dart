import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../shared/domain/entities/user/login_credential.dart';
import '../../../../../shared/presenter/components/alert_dialog_info/alert_dialog_info.dart';
import '../../../../../shared/presenter/components/app_logo/app_logo.dart';
import '../../../../../shared/presenter/components/app_version_informations/app_version_informaitons.dart';
import '../../../../../shared/presenter/components/default_loading/default_loading.dart';
import '../../../../../shared/presenter/components/default_text_button/default_text_button.dart';
import '../../../../../shared/utils/default_failure_messages/default_failure_messages.dart';
import '../../../../../shared/utils/routes/app_routes.dart';
import '../../../../../shared/utils/styles/colors_app/colors_app.dart';
import '../../../../../shared/utils/styles/text_styles/text_styles.dart';
import 'authentication_controller.dart';
import 'components/authentication_text_input_field/authentication_text_input_field.dart';

typedef AuthenticationTripleBuilder
    = TripleBuilder<AuthenticationController, Unit>;

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final controller = Modular.get<AuthenticationController>();
  final usernameTextController = TextEditingController(text: '');
  final passwordTextController = TextEditingController(text: '');

  late final Disposer disposer;

  @override
  void dispose() {
    disposer();
    usernameTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    disposer = controller.observer(
      onError: (error) async {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialogInfo(
              title: 'Comportamento Inesperado',
              description: error.message ?? DefaultFailureMessages.errorMessage,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: sizeOf.width,
            height: sizeOf.height,
            color: Colors.grey,
          ),
          SizedBox(
            width: sizeOf.width * 0.3,
            height: sizeOf.height * 0.8,
            child: Card(
              color: context.colors.primary,
              child: AuthenticationTripleBuilder(
                store: controller,
                builder: (_, triple) {
                  return Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        DefaultTextButton(
                          label: 'Configurações',
                          icon: Icons.settings,
                          onPressed: triple.isLoading
                              ? null
                              : () {
                                  Modular.to
                                      .pushNamed('${AppRoutes.settings}/');
                                },
                        ),
                        Expanded(child: Container()),
                        const AppLogo(),
                        Expanded(child: Container()),
                        Column(
                          children: [
                            Text(
                              'Insira seu código de usuário para ter acesso ao aplicativo',
                              textAlign: TextAlign.center,
                              style: context.textStyles.body
                                  .copyWith(color: Colors.white),
                            ),
                            AuthenticationTextInputField(
                              key: const Key('user_text_field'),
                              isEnabled: !triple.isLoading,
                              textInputAction: TextInputAction.next,
                              controller: this.usernameTextController,
                              hintText: 'Usuário',
                              iconData: Icons.person,
                            ),
                            AuthenticationTextInputField(
                              key: const Key('password_text_field'),
                              isEnabled: !triple.isLoading,
                              textInputAction: TextInputAction.next,
                              controller: this.passwordTextController,
                              hintText: 'Senha',
                              isObscureText: true,
                              iconData: Icons.lock_rounded,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: triple.isLoading
                                  ? null
                                  : () => controller.doLogin(
                                        LoginCredential.withUsernameAndPassword(
                                          username: usernameTextController.text
                                              .trim(),
                                          password: passwordTextController.text
                                              .trim(),
                                        ),
                                      ),
                              style: ElevatedButton.styleFrom(
                                disabledBackgroundColor: Colors.white,
                                backgroundColor: Colors.white,
                                minimumSize: const Size.fromHeight(52),
                                maximumSize: const Size.fromHeight(52),
                              ),
                              child: Visibility(
                                visible: triple.isLoading,
                                replacement: Text(
                                  'Entrar',
                                  style: context.textStyles.button.copyWith(
                                    color: context.colors.primary,
                                  ),
                                ),
                                child: DefaultLoading(
                                  color: context.colors.primary,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppVersionInformations(
                              appVersion: controller.appVersion,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
