import 'package:result_dart/result_dart.dart';

import '../../entities/app_informations/app_informations.dart';
import '../../services/app_service_interface.dart';
import '../../shared_failures/shared_failure.dart';
import 'get_app_info_interface.dart';

class GetAppInfo implements IGetAppInfo {
  final IAppService _appService;

  GetAppInfo({
    required IAppService appService,
  }) : _appService = appService;

  @override
  Future<Result<AppInformations, ISharedFailure>> call() async {
    return await _appService.getAppInfo();
  }
}
