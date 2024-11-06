import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';
import '../../../../../../../domain/entities/box/box.dart';

class BoxTile extends StatelessWidget {
  final Box box;

  const BoxTile({
    super.key,
    required this.box,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'X${this.box.boxId}',
          style: TextStyleApp.title.copyWith(
            fontSize: context.isTabletDOWN ? 16 : 18,
          ),
        ),
      ),
    );
  }
}
