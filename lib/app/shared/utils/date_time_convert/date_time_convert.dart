import 'package:flutter/material.dart';

class DateTimeConvert {
  static const _indexNotFound = -1;

  DateTime? stringToDateTime(String? dateTime, {bool isOnlyTime = false}) {
    if (dateTime == null || dateTime.isEmpty) {
      return null;
    }
    final hour = _getHour(dateTime);
    final minutes = _getMinutes(dateTime);
    final seconds = _getSeconds(dateTime);

    if (isOnlyTime) {
      final dateTime = DateTime.now();
      return DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
        hour,
        minutes,
        seconds,
      );
    }

    final year = _getYear(dateTime);
    final month = _getMonth(dateTime);
    final day = _getDay(dateTime);

    return DateTime(
      year,
      month,
      day,
      hour,
      minutes,
      seconds,
    );
  }

  int _getYear(String? dateTime) {
    const defaultYear = 1900;
    try {
      if (dateTime == null || dateTime.isEmpty || !dateTime.contains('/')) {
        return defaultYear;
      }

      final yearBeginIndex = dateTime.lastIndexOf('/') + 1;
      late final String yearString;

      if (yearBeginIndex == _indexNotFound) {
        yearString = '1900';
      } else {
        const yearLength = 4;
        yearString = dateTime.substring(
          yearBeginIndex,
          yearBeginIndex + yearLength,
        );
      }
      return int.tryParse(yearString) ?? defaultYear;
    } on FormatException catch (exception) {
      debugPrint(exception.message);
      return defaultYear;
    }
  }

  int _getMonth(String? dateTime) {
    const defaultMonth = 1;
    try {
      if (dateTime == null || dateTime.isEmpty || !dateTime.contains('/')) {
        return defaultMonth;
      }

      final monthBeginIndex = dateTime.indexOf('/') + 1;

      late final String mothString;

      if (monthBeginIndex == _indexNotFound) {
        mothString = '01';
      } else {
        const monthLength = 2;
        mothString = dateTime.substring(
          monthBeginIndex,
          monthBeginIndex + monthLength,
        );
      }
      return int.tryParse(mothString) ?? defaultMonth;
    } on FormatException catch (exception) {
      debugPrint(exception.message);
      return defaultMonth;
    }
  }

  int _getDay(String? dateTime) {
    const defaultDay = 1;
    try {
      if (dateTime == null || dateTime.isEmpty || !dateTime.contains('/')) {
        return defaultDay;
      }

      final dayEndIndex = dateTime.indexOf('/');
      late final String dayString;

      if (dayEndIndex == _indexNotFound) {
        dayString = '01';
      } else {
        dayString = dateTime.substring(0, dayEndIndex);
      }
      return int.tryParse(dayString) ?? defaultDay;
    } on FormatException catch (exception) {
      debugPrint(exception.message);
      return defaultDay;
    }
  }

  int _getHour(String? dateTime) {
    const defaultHour = 0;
    const separator = ':';
    try {
      if (dateTime == null ||
          dateTime.isEmpty ||
          !dateTime.contains(separator)) {
        return defaultHour;
      }

      final hourEndIndex = dateTime.indexOf(separator);
      late final String hourString;

      if (hourEndIndex == _indexNotFound) {
        hourString = '00';
      } else {
        const hourLength = 2;
        hourString = dateTime.substring(
          hourEndIndex - hourLength,
          hourEndIndex,
        );
      }
      return int.tryParse(hourString) ?? defaultHour;
    } on FormatException catch (exception) {
      debugPrint(exception.message);
      return defaultHour;
    }
  }

  int _getMinutes(String? dateTime) {
    const defaultMinutes = 00;
    const separator = ':';
    try {
      if (dateTime == null ||
          dateTime.isEmpty ||
          !dateTime.contains(separator)) {
        return defaultMinutes;
      }

      final minutesBeginIndex = dateTime.indexOf(separator) + 1;
      final minutesEndIndex = dateTime.lastIndexOf(separator);

      late final String minutesString;

      if (minutesBeginIndex == _indexNotFound) {
        minutesString = '00';
      } else {
        minutesString = dateTime.substring(
          minutesBeginIndex,
          minutesEndIndex,
        );
      }
      return int.tryParse(minutesString) ?? defaultMinutes;
    } on FormatException catch (exception) {
      debugPrint(exception.message);
      return defaultMinutes;
    }
  }

  int _getSeconds(String? dateTime) {
    const defaultSeconds = 00;
    const separator = ':';
    try {
      if (dateTime == null ||
          dateTime.isEmpty ||
          !dateTime.contains(separator)) {
        return defaultSeconds;
      }

      final secondsBeginIndex = dateTime.lastIndexOf(separator) + 1;
      late final String secondesString;

      if (secondsBeginIndex == _indexNotFound) {
        secondesString = '00';
      } else {
        secondesString = dateTime.substring(
          secondsBeginIndex,
          dateTime.length,
        );
      }
      return int.tryParse(secondesString) ?? defaultSeconds;
    } on FormatException catch (exception) {
      debugPrint(exception.message);
      return defaultSeconds;
    }
  }
}
