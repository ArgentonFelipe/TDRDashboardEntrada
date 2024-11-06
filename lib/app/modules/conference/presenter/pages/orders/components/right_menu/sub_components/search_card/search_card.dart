import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';
import '../../../../../../stores/orders_store/orders_store.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersStore = Modular.get<OrdersStore>();
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Busca - Nº Pedido',
                textAlign: TextAlign.center,
                style: TextStyleApp.title.copyWith(
                  fontSize: context.isTabletDOWN
                      ? 14
                      : context.isDesktopXlDOWN
                          ? 15
                          : 16,
                ),
              ),
              const Divider(),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text(
                    'Pesquisar',
                    style: TextStyleApp.body,
                  ),
                ),
                style: TextStyleApp.body.copyWith(
                  fontSize: context.isTabletDOWN
                      ? 14
                      : context.isDesktopXlDOWN
                          ? 15
                          : 16,
                ),
                onChanged: ordersStore.searchWithText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
