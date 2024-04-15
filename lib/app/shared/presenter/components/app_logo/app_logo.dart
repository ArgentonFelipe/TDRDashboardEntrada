import 'package:flutter/material.dart';

import '../../../utils/default_strings/default_strings.dart';
import '../../../utils/styles/text_styles/text_styles.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // CircleAvatar(
        //   backgroundColor: Colors.white,
        //   maxRadius: MediaQuery.sizeOf(context).width * 0.05,
        //   minRadius: MediaQuery.sizeOf(context).width * 0.05,
        //   child: Image.asset('images/logo_app.png'),
        // ),
        // const SizedBox(height: 10),
        Text(
          DefaultStrings.appName,
          textAlign: TextAlign.center,
          style: context.textStyles.title.copyWith(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
