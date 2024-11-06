import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';

class SectionTile extends StatefulWidget {
  final String title;

  const SectionTile({
    super.key,
    required this.title,
  });
  @override
  State<SectionTile> createState() => _SectionTileState();
}

class _SectionTileState extends State<SectionTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Center(
          child: Text(
            this.widget.title,
            style: TextStyleApp.body.copyWith(
              fontSize: context.isTabletDOWN
                  ? 20
                  : context.isDesktopLgDOWN
                      ? 28
                      : 32,
            ),
          ),
        ),
      ),
    );
  }
}
