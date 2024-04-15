mixin ServiceAddressValidators {
  String? ipValidator(String? newIP) {
    final ipRegex = RegExp(
      r'^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$',
    );
    if (newIP == null || newIP.isEmpty) {
      return 'Campo Obrigatório';
    } else if (!ipRegex.hasMatch(newIP)) {
      return 'IP Inválido';
    }
    return null;
  }

  String? portValidator(String? newPort) {
    return (newPort == null || newPort.isEmpty) ? 'Campo Obrigatório' : null;
  }
}
