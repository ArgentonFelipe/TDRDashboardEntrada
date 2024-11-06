import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';
import '../../../../../domain/failures/failures.dart';

class ErrorTile extends StatelessWidget {
  final IConferenceFailure homeFailure;
  const ErrorTile({
    super.key,
    required this.homeFailure,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: context.screenWidth * 0.3,
          height: context.screenHeight * 0.45,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.screenHeight * 0.05,
              horizontal: context.screenWidth * 0.05,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    size: context.screenHeight * 0.1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    this.homeFailure.message ??
                        'Ocorreu um comportamento inesperado. Por favor aguarde até a próxima atualização de tela',
                    style: TextStyleApp.body.copyWith(
                      fontSize: context.screenWidth * 0.012,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
