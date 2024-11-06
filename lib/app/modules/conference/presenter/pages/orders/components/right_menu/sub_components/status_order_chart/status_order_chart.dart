import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';
import '../../../../../../../domain/enum/conference_status/conference_status.dart';
import '../graph_indicator/graph_indicador.dart';
import '../menu_card_title/menu_card_title.dart';
import 'status_order_chart_controller.dart';

class StatusOrderChart extends StatefulWidget {
  final int notBeginingQuantity;
  final int inConferenceQuantity;

  final int conferedQuantity;

  const StatusOrderChart({
    super.key,
    required this.notBeginingQuantity,
    required this.inConferenceQuantity,
    required this.conferedQuantity,
  });
  @override
  _StatusOrderChartState createState() => _StatusOrderChartState();
}

class _StatusOrderChartState extends State<StatusOrderChart> {
  final controller = Modular.get<StatusOrderChartController>();
  @override
  Widget build(BuildContext context) {
    controller.setOrdersQuantity(
      notBeginingQuantity: this.widget.notBeginingQuantity,
      inConferenceQuantity: this.widget.inConferenceQuantity,
      conferedQuantity: this.widget.conferedQuantity,
    );
    return SizedBox(
      height: controller.isExpanded
          ? context.isTabletDOWN
              ? 350
              : 400
          : 70,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              MenuCardTitle(
                title: 'Resumo',
                isExpanded: this.controller.isExpanded,
                onPressed: () {
                  setState(() {
                    controller.toggleExpanded();
                  });
                },
              ),
              Visibility(
                visible:
                    this.controller.isExpanded && this.controller.canBuildChart,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 32),
                    child: BarChart(
                      BarChartData(
                        gridData: const FlGridData(show: false),
                        barTouchData: BarTouchData(
                          enabled: false,
                          touchTooltipData: BarTouchTooltipData(
                            tooltipMargin: 8,
                            getTooltipItem: (_, __, rod, ___) {
                              return BarTooltipItem(
                                rod.toY.round().toString(),
                                TextStyleApp.body.copyWith(
                                  fontSize: context.isTabletDOWN
                                      ? 18
                                      : context.isDesktopXlDOWN
                                          ? 22
                                          : 26,
                                ),
                              );
                            },
                            tooltipBorder: const BorderSide(
                              color: Colors.transparent,
                            ),
                            getTooltipColor: (group) {
                              return Colors.transparent;
                            },
                          ),
                        ),
                        titlesData: const FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        barGroups: ConferenceStatus.values.map((status) {
                          return BarChartGroupData(
                            x: status.type + 1,
                            barsSpace: 1,
                            barRods: [
                              BarChartRodData(
                                toY: switch (status) {
                                  ConferenceStatus.notBegining =>
                                    this.controller.notBeginingOrdersQuantity,
                                  ConferenceStatus.inConference =>
                                    this.controller.inConferenceOrdersQuantity,
                                  ConferenceStatus.confered =>
                                    this.controller.conferedOrdersQuantity,
                                },
                                width: context.isTabletDOWN
                                    ? 18
                                    : context.isDesktopXlDOWN
                                        ? 22
                                        : 26,
                                color: getColor(status),
                              ),
                            ],
                            showingTooltipIndicators: [0],
                          );
                        }).toList(),
                        alignment: BarChartAlignment.spaceAround,
                        maxY: controller.totaLQuantity,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible:
                    this.controller.isExpanded && this.controller.canBuildChart,
                child: Wrap(
                  alignment: context.isTabletDOWN
                      ? WrapAlignment.start
                      : WrapAlignment.center,
                  spacing: 10,
                  children: ConferenceStatus.values.map((status) {
                    return GraphIndicator(
                      label: status.description,
                      color: status.color,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getColor(ConferenceStatus status) {
    return switch (status) {
      ConferenceStatus.notBegining => ColorsApp.red,
      ConferenceStatus.inConference => Colors.blue[800] ?? Colors.blue,
      ConferenceStatus.confered => Colors.green[800] ?? Colors.green,
    };
  }
}
