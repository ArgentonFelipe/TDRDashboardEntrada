import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../styles/colors_app/colors_app.dart';
import '../../styles/text_styles/text_styles.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  bool isOpen = false;

  void showLoader({required String message, String? title}) {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return PopScope(
            canPop: false,
            child: AlertDialog(
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LoadingAnimationWidget.threeArchedCircle(
                      color: context.colors.primary,
                      size: 60,
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: title != null && title.isNotEmpty,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          title ?? '',
                          textAlign: TextAlign.center,
                          style: context.textStyles.title,
                        ),
                      ),
                    ),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: context.textStyles.body,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
