import 'package:result_dart/result_dart.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../entities/order/order.dart';
import '../../failures/failures.dart';
import '../../repositories/conference_rest_repository_interface.dart';
import 'get_orders_interface.dart';

class GetOrders implements IGetOrders {
  final IConnectivityService _connectivityService;
  final IConferenceRestRepository _conferenceRestRepository;

  const GetOrders({
    required IConferenceRestRepository conferenceRestRepository,
    required IConnectivityService connectivityService,
  })  : _conferenceRestRepository = conferenceRestRepository,
        _connectivityService = connectivityService;

  @override
  Future<Result<List<Order>, IConferenceFailure>> call() async {
    final connectivityResult = await _connectivityService.checkConnectivity();
    return connectivityResult.fold(
      (_) async {
        return await _conferenceRestRepository.getOrders();
      },
      (failure) => Failure(GetOrdersFailure(message: failure.message)),
    );
  }
}
