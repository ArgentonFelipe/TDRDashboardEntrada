class ConferenceTypeChartController {
  ConferenceTypeChartController();

  void setValues({
    required int newSeparatedByPaper,
    required int newSeparatedBySmartphone,
    required int newQuantity,
  }) {
    _separatedByPaper = newSeparatedByPaper;
    _separatedBySmartphone = newSeparatedBySmartphone;
    _newQuantity = newQuantity;
  }

  late int _separatedByPaper;
  late int _separatedBySmartphone;
  late int _newQuantity;
  bool isExpanded = true;

  double get smartphoneQuantity => _separatedBySmartphone.toDouble();
  double get paperQuantity => _separatedByPaper.toDouble();
  double get newQuantity => _newQuantity.toDouble();

  double get totalQuantity =>
      _separatedBySmartphone.toDouble() +
      _separatedByPaper.toDouble() +
      _newQuantity.toDouble();

  int get smartphonePercent {
    final total =
        _separatedBySmartphone / (totalQuantity == 0 ? 1 : totalQuantity);
    return (total * 100).round();
  }

  int get paperPercent {
    final total = _separatedByPaper / (totalQuantity == 0 ? 1 : totalQuantity);
    return (total * 100).round();
  }

  int get newPercent {
    final total = _newQuantity / (totalQuantity == 0 ? 1 : totalQuantity);
    return (total * 100).round();
  }

  void toggleExpanded() {
    isExpanded = !isExpanded;
  }

  bool get canBuildChart => totalQuantity != 0;
}
