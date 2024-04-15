import 'package:flutter/material.dart';

import '../../../utils/styles/text_styles/text_styles.dart';

class AppVersionInformations extends StatelessWidget {
  final String appVersion;

  const AppVersionInformations({
    super.key,
    required this.appVersion,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      this.appVersion,
      textAlign: TextAlign.center,
      style:
          context.textStyles.title.copyWith(color: Colors.white, fontSize: 14),
    );
  }
}
