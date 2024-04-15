import 'package:result_dart/result_dart.dart';

import '../../entities/app_informations/app_informations.dart';
import '../../shared_failures/shared_failure.dart';

abstract interface class IGetAppInfo {
  Future<Result<AppInformations, ISharedFailure>> call();
}
