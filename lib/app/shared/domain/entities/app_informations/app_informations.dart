import 'package:equatable/equatable.dart';

class AppInformations extends Equatable {
  final String buildNumber;
  final String version;
  final String packageName;

  const AppInformations({
    required this.buildNumber,
    required this.version,
    required this.packageName,
  });

  bool get isInvalidAppInformations =>
      buildNumber.isEmpty || version.isEmpty || packageName.isEmpty;

  @override
  List<Object> get props => [buildNumber, version, packageName];
}
