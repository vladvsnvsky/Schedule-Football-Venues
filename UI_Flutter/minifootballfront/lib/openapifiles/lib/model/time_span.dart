//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TimeSpan {
  /// Returns a new [TimeSpan] instance.
  TimeSpan({
    this.ticks,
    this.days,
    this.hours,
    this.milliseconds,
    this.microseconds,
    this.nanoseconds,
    this.minutes,
    this.seconds,
    this.totalDays,
    this.totalHours,
    this.totalMilliseconds,
    this.totalMicroseconds,
    this.totalNanoseconds,
    this.totalMinutes,
    this.totalSeconds,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? ticks;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? days;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? hours;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? milliseconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? microseconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? nanoseconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? minutes;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? seconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? totalDays;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? totalHours;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? totalMilliseconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? totalMicroseconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? totalNanoseconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? totalMinutes;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? totalSeconds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TimeSpan &&
    other.ticks == ticks &&
    other.days == days &&
    other.hours == hours &&
    other.milliseconds == milliseconds &&
    other.microseconds == microseconds &&
    other.nanoseconds == nanoseconds &&
    other.minutes == minutes &&
    other.seconds == seconds &&
    other.totalDays == totalDays &&
    other.totalHours == totalHours &&
    other.totalMilliseconds == totalMilliseconds &&
    other.totalMicroseconds == totalMicroseconds &&
    other.totalNanoseconds == totalNanoseconds &&
    other.totalMinutes == totalMinutes &&
    other.totalSeconds == totalSeconds;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (ticks == null ? 0 : ticks!.hashCode) +
    (days == null ? 0 : days!.hashCode) +
    (hours == null ? 0 : hours!.hashCode) +
    (milliseconds == null ? 0 : milliseconds!.hashCode) +
    (microseconds == null ? 0 : microseconds!.hashCode) +
    (nanoseconds == null ? 0 : nanoseconds!.hashCode) +
    (minutes == null ? 0 : minutes!.hashCode) +
    (seconds == null ? 0 : seconds!.hashCode) +
    (totalDays == null ? 0 : totalDays!.hashCode) +
    (totalHours == null ? 0 : totalHours!.hashCode) +
    (totalMilliseconds == null ? 0 : totalMilliseconds!.hashCode) +
    (totalMicroseconds == null ? 0 : totalMicroseconds!.hashCode) +
    (totalNanoseconds == null ? 0 : totalNanoseconds!.hashCode) +
    (totalMinutes == null ? 0 : totalMinutes!.hashCode) +
    (totalSeconds == null ? 0 : totalSeconds!.hashCode);

  @override
  String toString() => 'TimeSpan[ticks=$ticks, days=$days, hours=$hours, milliseconds=$milliseconds, microseconds=$microseconds, nanoseconds=$nanoseconds, minutes=$minutes, seconds=$seconds, totalDays=$totalDays, totalHours=$totalHours, totalMilliseconds=$totalMilliseconds, totalMicroseconds=$totalMicroseconds, totalNanoseconds=$totalNanoseconds, totalMinutes=$totalMinutes, totalSeconds=$totalSeconds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.ticks != null) {
      json[r'ticks'] = this.ticks;
    } else {
      json[r'ticks'] = null;
    }
    if (this.days != null) {
      json[r'days'] = this.days;
    } else {
      json[r'days'] = null;
    }
    if (this.hours != null) {
      json[r'hours'] = this.hours;
    } else {
      json[r'hours'] = null;
    }
    if (this.milliseconds != null) {
      json[r'milliseconds'] = this.milliseconds;
    } else {
      json[r'milliseconds'] = null;
    }
    if (this.microseconds != null) {
      json[r'microseconds'] = this.microseconds;
    } else {
      json[r'microseconds'] = null;
    }
    if (this.nanoseconds != null) {
      json[r'nanoseconds'] = this.nanoseconds;
    } else {
      json[r'nanoseconds'] = null;
    }
    if (this.minutes != null) {
      json[r'minutes'] = this.minutes;
    } else {
      json[r'minutes'] = null;
    }
    if (this.seconds != null) {
      json[r'seconds'] = this.seconds;
    } else {
      json[r'seconds'] = null;
    }
    if (this.totalDays != null) {
      json[r'totalDays'] = this.totalDays;
    } else {
      json[r'totalDays'] = null;
    }
    if (this.totalHours != null) {
      json[r'totalHours'] = this.totalHours;
    } else {
      json[r'totalHours'] = null;
    }
    if (this.totalMilliseconds != null) {
      json[r'totalMilliseconds'] = this.totalMilliseconds;
    } else {
      json[r'totalMilliseconds'] = null;
    }
    if (this.totalMicroseconds != null) {
      json[r'totalMicroseconds'] = this.totalMicroseconds;
    } else {
      json[r'totalMicroseconds'] = null;
    }
    if (this.totalNanoseconds != null) {
      json[r'totalNanoseconds'] = this.totalNanoseconds;
    } else {
      json[r'totalNanoseconds'] = null;
    }
    if (this.totalMinutes != null) {
      json[r'totalMinutes'] = this.totalMinutes;
    } else {
      json[r'totalMinutes'] = null;
    }
    if (this.totalSeconds != null) {
      json[r'totalSeconds'] = this.totalSeconds;
    } else {
      json[r'totalSeconds'] = null;
    }
    return json;
  }

  /// Returns a new [TimeSpan] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TimeSpan? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TimeSpan[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TimeSpan[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TimeSpan(
        ticks: mapValueOfType<int>(json, r'ticks'),
        days: mapValueOfType<int>(json, r'days'),
        hours: mapValueOfType<int>(json, r'hours'),
        milliseconds: mapValueOfType<int>(json, r'milliseconds'),
        microseconds: mapValueOfType<int>(json, r'microseconds'),
        nanoseconds: mapValueOfType<int>(json, r'nanoseconds'),
        minutes: mapValueOfType<int>(json, r'minutes'),
        seconds: mapValueOfType<int>(json, r'seconds'),
        totalDays: mapValueOfType<double>(json, r'totalDays'),
        totalHours: mapValueOfType<double>(json, r'totalHours'),
        totalMilliseconds: mapValueOfType<double>(json, r'totalMilliseconds'),
        totalMicroseconds: mapValueOfType<double>(json, r'totalMicroseconds'),
        totalNanoseconds: mapValueOfType<double>(json, r'totalNanoseconds'),
        totalMinutes: mapValueOfType<double>(json, r'totalMinutes'),
        totalSeconds: mapValueOfType<double>(json, r'totalSeconds'),
      );
    }
    return null;
  }

  static List<TimeSpan> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TimeSpan>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TimeSpan.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TimeSpan> mapFromJson(dynamic json) {
    final map = <String, TimeSpan>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TimeSpan.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TimeSpan-objects as value to a dart map
  static Map<String, List<TimeSpan>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TimeSpan>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TimeSpan.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

