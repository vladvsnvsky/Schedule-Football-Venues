//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MatchDTO {
  /// Returns a new [MatchDTO] instance.
  MatchDTO({
    this.id,
    this.fieldId,
    this.organizerId,
    this.startTime,
    this.endTime,
    this.nrOfPlayersRequired,
    this.pricePerPlayerUnits,
    this.playerCanJoin,
    this.finished,
    this.cancelled,
    this.cancelledReason,
    this.goalsTeam1,
    this.goalsTeam2,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? fieldId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? organizerId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? startTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? endTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? nrOfPlayersRequired;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? pricePerPlayerUnits;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? playerCanJoin;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? finished;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? cancelled;

  String? cancelledReason;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? goalsTeam1;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? goalsTeam2;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MatchDTO &&
    other.id == id &&
    other.fieldId == fieldId &&
    other.organizerId == organizerId &&
    other.startTime == startTime &&
    other.endTime == endTime &&
    other.nrOfPlayersRequired == nrOfPlayersRequired &&
    other.pricePerPlayerUnits == pricePerPlayerUnits &&
    other.playerCanJoin == playerCanJoin &&
    other.finished == finished &&
    other.cancelled == cancelled &&
    other.cancelledReason == cancelledReason &&
    other.goalsTeam1 == goalsTeam1 &&
    other.goalsTeam2 == goalsTeam2;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (fieldId == null ? 0 : fieldId!.hashCode) +
    (organizerId == null ? 0 : organizerId!.hashCode) +
    (startTime == null ? 0 : startTime!.hashCode) +
    (endTime == null ? 0 : endTime!.hashCode) +
    (nrOfPlayersRequired == null ? 0 : nrOfPlayersRequired!.hashCode) +
    (pricePerPlayerUnits == null ? 0 : pricePerPlayerUnits!.hashCode) +
    (playerCanJoin == null ? 0 : playerCanJoin!.hashCode) +
    (finished == null ? 0 : finished!.hashCode) +
    (cancelled == null ? 0 : cancelled!.hashCode) +
    (cancelledReason == null ? 0 : cancelledReason!.hashCode) +
    (goalsTeam1 == null ? 0 : goalsTeam1!.hashCode) +
    (goalsTeam2 == null ? 0 : goalsTeam2!.hashCode);

  @override
  String toString() => 'MatchDTO[id=$id, fieldId=$fieldId, organizerId=$organizerId, startTime=$startTime, endTime=$endTime, nrOfPlayersRequired=$nrOfPlayersRequired, pricePerPlayerUnits=$pricePerPlayerUnits, playerCanJoin=$playerCanJoin, finished=$finished, cancelled=$cancelled, cancelledReason=$cancelledReason, goalsTeam1=$goalsTeam1, goalsTeam2=$goalsTeam2]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.fieldId != null) {
      json[r'fieldId'] = this.fieldId;
    } else {
      json[r'fieldId'] = null;
    }
    if (this.organizerId != null) {
      json[r'organizerId'] = this.organizerId;
    } else {
      json[r'organizerId'] = null;
    }
    if (this.startTime != null) {
      json[r'startTime'] = this.startTime!.toUtc().toIso8601String();
    } else {
      json[r'startTime'] = null;
    }
    if (this.endTime != null) {
      json[r'endTime'] = this.endTime!.toUtc().toIso8601String();
    } else {
      json[r'endTime'] = null;
    }
    if (this.nrOfPlayersRequired != null) {
      json[r'nrOfPlayersRequired'] = this.nrOfPlayersRequired;
    } else {
      json[r'nrOfPlayersRequired'] = null;
    }
    if (this.pricePerPlayerUnits != null) {
      json[r'pricePerPlayerUnits'] = this.pricePerPlayerUnits;
    } else {
      json[r'pricePerPlayerUnits'] = null;
    }
    if (this.playerCanJoin != null) {
      json[r'playerCanJoin'] = this.playerCanJoin;
    } else {
      json[r'playerCanJoin'] = null;
    }
    if (this.finished != null) {
      json[r'finished'] = this.finished;
    } else {
      json[r'finished'] = null;
    }
    if (this.cancelled != null) {
      json[r'cancelled'] = this.cancelled;
    } else {
      json[r'cancelled'] = null;
    }
    if (this.cancelledReason != null) {
      json[r'cancelledReason'] = this.cancelledReason;
    } else {
      json[r'cancelledReason'] = null;
    }
    if (this.goalsTeam1 != null) {
      json[r'goalsTeam1'] = this.goalsTeam1;
    } else {
      json[r'goalsTeam1'] = null;
    }
    if (this.goalsTeam2 != null) {
      json[r'goalsTeam2'] = this.goalsTeam2;
    } else {
      json[r'goalsTeam2'] = null;
    }
    return json;
  }

  /// Returns a new [MatchDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MatchDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "MatchDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "MatchDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MatchDTO(
        id: mapValueOfType<int>(json, r'id'),
        fieldId: mapValueOfType<int>(json, r'fieldId'),
        organizerId: mapValueOfType<int>(json, r'organizerId'),
        startTime: mapDateTime(json, r'startTime', r''),
        endTime: mapDateTime(json, r'endTime', r''),
        nrOfPlayersRequired: mapValueOfType<int>(json, r'nrOfPlayersRequired'),
        pricePerPlayerUnits: mapValueOfType<int>(json, r'pricePerPlayerUnits'),
        playerCanJoin: mapValueOfType<bool>(json, r'playerCanJoin'),
        finished: mapValueOfType<bool>(json, r'finished'),
        cancelled: mapValueOfType<bool>(json, r'cancelled'),
        cancelledReason: mapValueOfType<String>(json, r'cancelledReason'),
        goalsTeam1: mapValueOfType<int>(json, r'goalsTeam1'),
        goalsTeam2: mapValueOfType<int>(json, r'goalsTeam2'),
      );
    }
    return null;
  }

  static List<MatchDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MatchDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MatchDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MatchDTO> mapFromJson(dynamic json) {
    final map = <String, MatchDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MatchDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MatchDTO-objects as value to a dart map
  static Map<String, List<MatchDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MatchDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MatchDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

