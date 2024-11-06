import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';

class CleanFilterButton extends StatelessWidget {
  final Function() onPressed;
  const CleanFilterButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPressed,
      child: Text(
        'Limpar - Filtro',
        style: TextStyleApp.button.copyWith(
          fontSize: context.isTabletDOWN
              ? 14
              : context.isDesktopXlDOWN
                  ? 15
                  : 16,
          color: ColorsApp.red,
        ),
      ),
    );
  }
}
