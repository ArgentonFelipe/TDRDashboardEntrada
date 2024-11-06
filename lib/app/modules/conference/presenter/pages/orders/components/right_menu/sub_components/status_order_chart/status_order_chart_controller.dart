class StatusOrderChartController {
  StatusOrderChartController();

  late double notBeginingOrdersQuantity;
  late double inConferenceOrdersQuantity;

  late double conferedOrdersQuantity;

  void setOrdersQuantity({
    required int notBeginingQuantity,
    required int inConferenceQuantity,
    required int conferedQuantity,
  }) {
    notBeginingOrdersQuantity = notBeginingQuantity + 0.01;
    inConferenceOrdersQuantity = inConferenceQuantity + 0.01;
    conferedOrdersQuantity = conferedQuantity + 0.01;
  }

  bool isExpanded = true;

  double get totaLQuantity =>
      notBeginingOrdersQuantity +
      inConferenceOrdersQuantity +
      conferedOrdersQuantity * 1.0 +
      0.04;

  void toggleExpanded() {
    isExpanded = !isExpanded;
  }

  bool get canBuildChart =>
      (notBeginingOrdersQuantity +
          inConferenceOrdersQuantity +
          conferedOrdersQuantity) !=
      0;
}
