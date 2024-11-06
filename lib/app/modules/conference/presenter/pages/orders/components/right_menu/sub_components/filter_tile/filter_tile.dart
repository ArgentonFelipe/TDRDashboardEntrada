import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../stores/conference_status_filter_store/conference_status_filter_store.dart';
import '../../../../../../stores/local_filter_store/local_filter_store.dart';
import '../menu_card_title/menu_card_title.dart';
import 'components/clean_filter_button/clean_filter_button.dart';
import 'components/order_state_filter_group/order_state_filter_group.dart';

class FilterTile extends StatefulWidget {
  const FilterTile({
    super.key,
  });
  @override
  _FilterTileState createState() => _FilterTileState();
}

class _FilterTileState extends State<FilterTile> {
  final _localFilterStore = Modular.get<LocalFilterStore>();
  final _ConferenceStatusFilterStore =
      Modular.get<ConferenceStatusFilterStore>();

  bool _isExpanded = false;

  void toggleExpanded() {}

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: _isExpanded
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              MenuCardTitle(
                title: 'Filtros',
                isExpanded: _isExpanded,
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
              Visibility(
                visible: _isExpanded,
                child: Column(
                  children: [
                    OrderStateFilterGroup(),
                    CleanFilterButton(
                      onPressed: () {
                        _localFilterStore.cleanFilter();
                        _ConferenceStatusFilterStore.cleanFilter();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
