import 'dart:async';

import 'package:result_dart/result_dart.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../shared/external/urls/app_urls.dart';
import '../../domain/entities/order/order.dart';
import '../../domain/failures/failures.dart';
import '../../domain/repositories/conference_rest_repository_interface.dart';

class ConferenceRestRepository implements IConferenceRestRepository {
  final IRestClient _restClient;

  const ConferenceRestRepository({
    required IRestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<Result<List<Order>, IConferenceFailure>> getOrders() async {
    try {
      final RestClientResponse(:data) = await _restClient.get(
        AppUrls.dashboardOrders,
      );
      if (data is List) {
        // final orders = OrdersMock.json.map((order) {
        //   return Order.fromMap(order);
        // }).toList();

        // return Success(orders);
        final orders = data.map((order) {
          return Order.fromMap(order);
        }).toList();

        return Success(orders);
      }
      return const Success([]);
    } on RestClientException catch (failure) {
      return Failure(ConferenceRestRepositoryFailure(message: failure.message));
    } on TimeoutException {
      return Failure(
        ConferenceRestRepositoryFailure(
          message: DefaultFailureMessages.timeout,
        ),
      );
    }
  }
}
