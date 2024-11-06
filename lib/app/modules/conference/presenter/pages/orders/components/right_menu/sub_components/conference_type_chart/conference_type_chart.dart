import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';
import '../menu_card_title/menu_card_title.dart';
import 'conference_type_chart_controller.dart';

class ConferenceTypeChart extends StatefulWidget {
  final int separatedBySmartphone;
  final int separatedByPaper;
  final int newQuantity;
  const ConferenceTypeChart({
    super.key,
    required this.separatedBySmartphone,
    required this.separatedByPaper,
    required this.newQuantity,
  });
  @override
  _ConferenceTypeChartState createState() => _ConferenceTypeChartState();
}

class _ConferenceTypeChartState extends State<ConferenceTypeChart> {
  final controller = Modular.get<ConferenceTypeChartController>();

  @override
  Widget build(BuildContext context) {
    controller.setValues(
      newSeparatedByPaper: this.widget.separatedByPaper,
      newSeparatedBySmartphone: this.widget.separatedBySmartphone,
      newQuantity: this.widget.newQuantity,
    );

    return SizedBox(
      height: controller.isExpanded
          ? context.isTabletDOWN
              ? 350
              : 350
          : 70,
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: controller.isExpanded
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MenuCardTitle(
                title: 'Separação',
                isExpanded: this.controller.isExpanded,
                onPressed: () {
                  setState(() {
                    controller.toggleExpanded();
                  });
                },
              ),
              Visibility(
                visible: this.controller.isExpanded,
                child: const SizedBox(height: 30),
              ),
              Visibility(
                visible: this.controller.isExpanded,
                child: Expanded(
                  child: PieChart(
                    dataMap: {
                      'Não Iniciado': this.controller.newQuantity,
                      'Coletor': this.controller.smartphoneQuantity,
                      'TDRConfereE': this.controller.paperQuantity,
                    },
                    colorList: [
                      Colors.purple,
                      Colors.green[800] ?? Colors.green,
                      Colors.orange[800] ?? Colors.orange,
                    ],
                    legendOptions: const LegendOptions(
                      legendPosition: LegendPosition.bottom,
                      legendTextStyle: TextStyleApp.body,
                      showLegendsInRow: true,
                    ),
                    initialAngleInDegree: 0,
                    chartValuesOptions: const ChartValuesOptions(
                      chartValueBackgroundColor: Colors.transparent,
                      chartValueStyle: TextStyleApp.title,
                      decimalPlaces: 0,
                      showChartValuesInPercentage: true,
                    ),
                    emptyColor: Colors.green[800] ?? Colors.green,
                    chartType: ChartType.ring,
                    ringStrokeWidth: context.isTabletDOWN ? 40 : 60,
                  ),
                ),
              ),
              Visibility(
                visible: this.controller.isExpanded &&
                    !this.controller.canBuildChart,
                child: Text(
                  'Sem dados suficientes para gerar um gráfico detalhado. Por favor aguarde até a próxima atualização',
                  textAlign: TextAlign.center,
                  style: TextStyleApp.title.copyWith(
                    color: ColorsApp.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
