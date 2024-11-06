import 'package:flutter/material.dart';
import 'package:tdr_core/utils/styles/colors_app/colors_app.dart';

enum ConferenceStatus {
  notBegining(description: 'Não Iniciada', type: 0),
  inConference(description: 'Em Conferência', type: 10),
  confered(description: 'Conferida', type: 100);

  const ConferenceStatus({required this.type, required this.description});

  final int type;
  final String description;

  static ConferenceStatus getStatus(int status) {
    switch (status) {
      case 0:
        return ConferenceStatus.notBegining;
      case 10:
        return ConferenceStatus.inConference;
      case 100:
        return ConferenceStatus.confered;
      default:
        return ConferenceStatus.notBegining;
    }
  }

  Color get color {
    switch (this.type) {
      case 0:
        return ColorsApp.red;
      case 10:
        return Colors.blue[800] ?? Colors.blue;
      case 100:
        return Colors.green[800] ?? Colors.green;

      default:
        return Colors.grey[800] ?? Colors.grey;
    }
  }
}
