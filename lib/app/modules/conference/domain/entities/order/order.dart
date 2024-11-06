// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

import '../../../../../shared/utils/date_time_convert/date_time_convert.dart';
import '../../enum/conference_status/conference_status.dart';
import '../../enum/conference_type/conference_type.dart';
import '../../enum/employee_status/employee_status.dart';
import '../../enum/order_status/order_status.dart';
import 'order_fields_name/order_fields_name.dart';

class Order extends Equatable {
  final int supplierCode;
  final String supplierName;
  final int serie;
  final int orderNumber;
  final DateTime? entryDate;
  final DateTime? inHomeDate;
  final DateTime? createDate;
  final DateTime? transferDate;
  final DateTime? finishDate;
  final DateTime? closingDate;
  final DateTime? setToEmployeeDate;

  final EmployeeStatus employeeStatus;
  final ConferenceStatus conferenceStatus;
  final ConferenceType conferenceType;
  final OrderStatus orderStatus;
  final int employeeId;
  final String employeeName;
  final int totalSKUs;
  final int totalUnit;
  final int totalQuantity;
  final int conferedQuantity;
  final int enteredQuantity;
  final int pendingQuantity;

  const Order({
    required this.supplierCode,
    required this.supplierName,
    required this.serie,
    required this.orderNumber,
    this.entryDate,
    this.inHomeDate,
    this.createDate,
    this.transferDate,
    this.finishDate,
    this.closingDate,
    this.setToEmployeeDate,
    required this.conferenceStatus,
    required this.orderStatus,
    required this.employeeStatus,
    required this.conferenceType,
    required this.employeeId,
    required this.employeeName,
    required this.totalSKUs,
    required this.totalUnit,
    required this.totalQuantity,
    required this.conferedQuantity,
    required this.enteredQuantity,
    required this.pendingQuantity,
  });

  Order copyWith({
    int? supplierCode,
    String? supplierName,
    int? serie,
    int? orderNumber,
    DateTime? entryDate,
    DateTime? inHomeDate,
    DateTime? transferDate,
    DateTime? createDate,
    DateTime? finishDate,
    DateTime? closingDate,
    DateTime? setToEmployeeDate,
    ConferenceStatus? conferenceStatus,
    OrderStatus? orderStatus,
    EmployeeStatus? employeeStatus,
    ConferenceType? conferenceType,
    int? employeeId,
    String? employeeName,
    int? totalSKUs,
    int? totalUnit,
    int? totalQuantity,
    int? conferedQuantity,
    int? enteredQuantity,
    int? pendingQuantity,
  }) {
    return Order(
      supplierCode: supplierCode ?? this.supplierCode,
      supplierName: supplierName ?? this.supplierName,
      serie: serie ?? this.serie,
      orderNumber: orderNumber ?? this.orderNumber,
      entryDate: entryDate ?? this.entryDate,
      inHomeDate: inHomeDate ?? this.inHomeDate,
      createDate: createDate ?? this.createDate,
      transferDate: transferDate ?? this.transferDate,
      finishDate: finishDate ?? this.finishDate,
      closingDate: closingDate ?? this.closingDate,
      setToEmployeeDate: setToEmployeeDate ?? this.setToEmployeeDate,
      conferenceStatus: conferenceStatus ?? this.conferenceStatus,
      orderStatus: orderStatus ?? this.orderStatus,
      employeeStatus: employeeStatus ?? this.employeeStatus,
      conferenceType: conferenceType ?? this.conferenceType,
      employeeId: employeeId ?? this.employeeId,
      employeeName: employeeName ?? this.employeeName,
      totalSKUs: totalSKUs ?? this.totalSKUs,
      totalUnit: totalUnit ?? this.totalUnit,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      conferedQuantity: conferedQuantity ?? this.conferedQuantity,
      enteredQuantity: enteredQuantity ?? this.enteredQuantity,
      pendingQuantity: pendingQuantity ?? this.pendingQuantity,
    );
  }

  @override
  List<Object?> get props => [
        supplierCode,
        supplierName,
        serie,
        orderNumber,
        entryDate,
        inHomeDate,
        setToEmployeeDate,
        createDate,
        transferDate,
        finishDate,
        closingDate,
        conferenceStatus,
        employeeStatus,
        orderStatus,
        employeeId,
        employeeName,
        conferenceType,
        totalSKUs,
        totalUnit,
        totalQuantity,
        conferedQuantity,
        enteredQuantity,
        pendingQuantity,
      ];

  factory Order.fromMap(Map<String, dynamic> map) {
    DateTime? getDate(String? date, {bool isOnlyTime = false}) {
      return DateTimeConvert().stringToDateTime(
        date,
        isOnlyTime: isOnlyTime,
      );
    }

    return Order(
      supplierCode: map[OrderFieldsName.supplierCode] ?? 0,
      supplierName: map[OrderFieldsName.supplierName] ?? '',
      serie: map[OrderFieldsName.serie] ?? 0,
      orderNumber: map[OrderFieldsName.orderNumber] ?? 0,
      entryDate: getDate(map[OrderFieldsName.entryDate]),
      inHomeDate: getDate(map[OrderFieldsName.inHomeDate]),
      createDate: getDate(map[OrderFieldsName.createDate]),
      transferDate: getDate(map[OrderFieldsName.transferDate]),
      finishDate: getDate(map[OrderFieldsName.finishDate]),
      closingDate: getDate(map[OrderFieldsName.closingDate]),
      setToEmployeeDate: getDate(map[OrderFieldsName.setToEmployeeDate]),
      conferenceStatus: ConferenceStatus.getStatus(
        map[OrderFieldsName.conferenceStatus] ?? 99,
      ),
      orderStatus:
          OrderStatus.getStatus(map[OrderFieldsName.orderStatus] ?? 99),
      conferenceType: ConferenceType.getStatus(map[OrderFieldsName.conferenceType] ?? 99),
      employeeStatus: EmployeeStatus.getStatus(map[OrderFieldsName.employeeStatus]?? 99),
      employeeId: map[OrderFieldsName.employeeId] ?? 0,
      employeeName: map[OrderFieldsName.employeeName] ?? '',
      totalSKUs: (map[OrderFieldsName.totalSKUs] ?? 0).toInt(),
      totalUnit: (map[OrderFieldsName.totalUnit] ?? 0).toInt(),
      totalQuantity: (map[OrderFieldsName.totalQuantity] ?? 0).toInt(),
      conferedQuantity: (map[OrderFieldsName.conferedQuantity] ?? 0).toInt(),
      enteredQuantity: (map[OrderFieldsName.enteredQuantity] ?? 0).toInt(),
      pendingQuantity: (map[OrderFieldsName.pendingQuantity] ?? 0).toInt(),
    );
  }
}
