import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../../../shared/utils/screen_manager/grid_columns/grid_columns.dart';
import '../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';
import '../../../../../../../domain/entities/order/order.dart';
import '../order_title/order_title.dart';

class OrderTile extends StatefulWidget {
  final Order order;

  const OrderTile({
    super.key,
    required this.order,
  });
  @override
  _OrderTileState createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  Order get order => this.widget.order;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.isDesktopXXlUP
          ? context.columnSize5 / 2
          : context.isDesktopLgUP
              ? context.columnSize3
              : context.isDesktopLgUP
                  ? context.columnSize4
                  : context.columnSize12,
      height: 320,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 20,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OrderTitle(order: this.order),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    height: 2,
                    color: Colors.black87,
                  ),
                  Text(
                    this.order.supplierName,
                    style: TextStyleApp.body.copyWith(
                      fontSize: context.isTabletDOWN
                          ? 14
                          : context.isDesktopXlDOWN
                              ? 16
                              : 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Data em Casa',
                    style: TextStyleApp.subtitle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    DateFormat(
                      "dd'/'MM'/'yyyy - HH:mm",
                      'pt_BR',
                    ).format(this.order.inHomeDate ?? DateTime(1900)),
                    style: TextStyleApp.subtitle.copyWith(
                      fontSize: context.isTabletDOWN
                          ? 14
                          : context.isDesktopXlDOWN
                              ? 16
                              : 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Nome do Conferente',
                        style: TextStyleApp.subtitle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        this.order.employeeName.isEmpty
                            ? 'Não Atribuido'
                            : '${this.order.employeeId} - ${this.order.employeeName}',
                        style: TextStyleApp.subtitle.copyWith(
                          fontSize: context.isTabletDOWN
                              ? 14
                              : context.isDesktopXlDOWN
                                  ? 16
                                  : 18,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Forma de Conferência',
                              style: TextStyleApp.subtitle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              this.order.conferenceType.description,
                              style: TextStyleApp.subtitle.copyWith(
                                fontSize: context.isTabletDOWN
                                    ? 14
                                    : context.isDesktopXlDOWN
                                        ? 16
                                        : 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Vinculado em',
                              style: TextStyleApp.subtitle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              this.order.setToEmployeeDate != null
                                  ? DateFormat(
                                      "dd'/'MM'/'yyyy - HH:mm",
                                      'pt_BR',
                                    ).format(
                                      this.order.setToEmployeeDate ??
                                          DateTime(1900),
                                    )
                                  : 'Aguardando',
                              style: TextStyleApp.subtitle.copyWith(
                                fontSize: context.isTabletDOWN
                                    ? 14
                                    : context.isDesktopXlDOWN
                                        ? 16
                                        : 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // OrderInformation(
                  //   isVisible: this.order.printedAt != null,
                  //   information: DateFormat(
                  //     "dd'/'MM'/'yyyy - HH:mm",
                  //     'pt_BR',
                  //   ).format(this.order.printedAt ?? DateTime(1900)),
                  //   color:
                  //       this.order.isLostOrder ? Colors.white : Colors.black87,
                  //   icon: Icons.print,
                  // ),
                  // OrderInformation(
                  //   isVisible: this.order.conferedAt != null,
                  //   information: DateFormat(
                  //     "dd'/'MM'/'yyyy - HH:mm",
                  //     'pt_BR',
                  //   ).format(this.order.conferedAt ?? DateTime(1900)),
                  //   icon: Icons.timer_outlined,
                  //   color:
                  //       this.order.isLostOrder ? Colors.white : Colors.black87,
                  // ),
                  // const SizedBox(height: 10),
                  // Visibility(
                  //   visible: this.order.boxes.isNotEmpty,
                  //   child: SizedBox(
                  //     height: 50,
                  //     child: ListView.builder(
                  //       shrinkWrap: true,
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: this.order.boxes.length,
                  //       itemBuilder: (_, index) {
                  //         return BoxTile(
                  //           box: this.order.boxes[index],
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
