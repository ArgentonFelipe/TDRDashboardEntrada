import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:tdr_core/tdr_core.dart';

class MenuController with MessageStateMixin {
  final IGetAppInfo _getAppInfo;
  final AppInfoStore _appInfoStore;
  final ISetBaseUrl _setBaseUrl;

  MenuController({
    required IGetAppInfo getAppInfo,
    required AppInfoStore appInfoStore,
    required ISetBaseUrl setBaseUrl,
  })  : _getAppInfo = getAppInfo,
        _appInfoStore = appInfoStore,
        _setBaseUrl = setBaseUrl;

  Future<void> getAppInformations() async {
    final appInfo = await _getAppInfo();
    appInfo.fold(
      (newAppInformations) async {
        _appInfoStore.setAppInfo(newAppInformations);
      },
      (failure) {
        showError(failure.message ?? DefaultFailureMessages.error);
      },
    );
  }

  Future<void> init() async {
    final configJSON = await rootBundle.loadString(
      Platform.isWindows ? 'assets/config.json' : 'web/assets/config.json',
    );

    final configMap = jsonDecode(configJSON);

    final isSSL = configMap['ssl'] ?? false;

    final sslProtocol = isSSL ? 'https' : 'http';

    final ipAddress = configMap['ip_address'] ?? '';

    if (ipAddress.isEmpty) {
      showError('Endereço de IP em branco. Por favor contate o suporte');
    }

    final int port = configMap['port'] ?? 0;
    if (port == 0) {
      showError('Porta do serviço é igual a 0. Por favor contate o suporte');
    }

    final String serviceName = configMap['service_name'] ?? '';
    if (serviceName.isEmpty) {
      showError('Nome do Serviço esta branco. Por favor contate o suporte');
    }

    final setResult = _setBaseUrl(
      '$sslProtocol://$ipAddress:${port.toString()}/$serviceName',
    );

    setResult.fold(
      (_) {},
      (failure) =>
          showAlertError(failure.message ?? DefaultFailureMessages.error),
    );
  }
}
