import 'package:flutter_modular/flutter_modular.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../shared/utils/app_routes/app_routes.dart';
import 'domain/repositories/conference_rest_repository_interface.dart';
import 'domain/usecases/filter_local_orders/filter_local_orders.dart';
import 'domain/usecases/filter_local_orders/filter_local_orders_interface.dart';
import 'domain/usecases/filter_order_status/filter_order_status.dart';
import 'domain/usecases/filter_order_status/filter_order_status_interface.dart';
import 'domain/usecases/get_orders/get_orders.dart';
import 'domain/usecases/get_orders/get_orders_interface.dart';
import 'domain/usecases/search_orders_with_text/search_orders_with_text.dart';
import 'domain/usecases/search_orders_with_text/search_orders_with_text_interface.dart';
import 'external/repositories/conference_rest_repository.dart';
import 'presenter/pages/orders/components/right_menu/sub_components/conference_type_chart/conference_type_chart_controller.dart';
import 'presenter/pages/orders/components/right_menu/sub_components/status_order_chart/status_order_chart_controller.dart';
import 'presenter/pages/orders/orders_page.dart';
import 'presenter/stores/conference_status_filter_store/conference_status_filter_store.dart';
import 'presenter/stores/local_filter_store/local_filter_store.dart';
import 'presenter/stores/orders_store/orders_store.dart';

class ConferenceModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    //? CONTROLLERS - WIDGETS
    i.addLazySingleton<ConferenceTypeChartController>(
      ConferenceTypeChartController.new,
    );
    i.addLazySingleton<StatusOrderChartController>(
      StatusOrderChartController.new,
    );

    //? USECASES
    i.addLazySingleton<ISearchOrdersWithText>(
      SearchOrdersWithText.new,
    );
    i.addLazySingleton<IGetOrders>(
      GetOrders.new,
    );
    i.addLazySingleton<IFilterOrderStatus>(
      FilterOrderStatus.new,
    );
    i.addLazySingleton<IFilterLocalOrders>(
      FilterLocalOrders.new,
    );

    //? REPOSITORIES
    i.addLazySingleton<IConferenceRestRepository>(
      ConferenceRestRepository.new,
    );

    //? STORES
    i.addLazySingleton<OrdersStore>(
      OrdersStore.new,
    );
    i.addLazySingleton<ConferenceStatusFilterStore>(
      ConferenceStatusFilterStore.new,
    );
    i.addLazySingleton<LocalFilterStore>(
      LocalFilterStore.new,
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.menu, child: (_) => const OrdersPage());
  }
}
