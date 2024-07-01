//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GameDetailsDTO {
  /// Returns a new [GameDetailsDTO] instance.
  GameDetailsDTO({
    this.id,
    this.organizerName,
    this.organizerId,
    this.fieldId,
    this.fieldName,
    this.cityId,
    this.cityName,
    this.countryId,
    this.countryName,
    this.nrOfPlayersRequired,
    this.currentNumberOfPlayers,
    this.gameTypeName,
    this.matchDurationInMinutes,
    this.finished,
    this.isCancelled,
    this.cancellationReason,
    this.pricePerPlayerUnits,
    this.day,
    this.month,
    this.year,
    this.startHour,
    this.endHour,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  String? organizerName;

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
  int? fieldId;

  String? fieldName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? cityId;

  String? cityName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? countryId;

  String? countryName;

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
  int? currentNumberOfPlayers;

  String? gameTypeName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? matchDurationInMinutes;

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
  bool? isCancelled;

  String? cancellationReason;

  int? pricePerPlayerUnits;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? day;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? month;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? year;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? startHour;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? endHour;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GameDetailsDTO &&
    other.id == id &&
    other.organizerName == organizerName &&
    other.organizerId == organizerId &&
    other.fieldId == fieldId &&
    other.fieldName == fieldName &&
    other.cityId == cityId &&
    other.cityName == cityName &&
    other.countryId == countryId &&
    other.countryName == countryName &&
    other.nrOfPlayersRequired == nrOfPlayersRequired &&
    other.currentNumberOfPlayers == currentNumberOfPlayers &&
    other.gameTypeName == gameTypeName &&
    other.matchDurationInMinutes == matchDurationInMinutes &&
    other.finished == finished &&
    other.isCancelled == isCancelled &&
    other.cancellationReason == cancellationReason &&
    other.pricePerPlayerUnits == pricePerPlayerUnits &&
    other.day == day &&
    other.month == month &&
    other.year == year &&
    other.startHour == startHour &&
    other.endHour == endHour;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (organizerName == null ? 0 : organizerName!.hashCode) +
    (organizerId == null ? 0 : organizerId!.hashCode) +
    (fieldId == null ? 0 : fieldId!.hashCode) +
    (fieldName == null ? 0 : fieldName!.hashCode) +
    (cityId == null ? 0 : cityId!.hashCode) +
    (cityName == null ? 0 : cityName!.hashCode) +
    (countryId == null ? 0 : countryId!.hashCode) +
    (countryName == null ? 0 : countryName!.hashCode) +
    (nrOfPlayersRequired == null ? 0 : nrOfPlayersRequired!.hashCode) +
    (currentNumberOfPlayers == null ? 0 : currentNumberOfPlayers!.hashCode) +
    (gameTypeName == null ? 0 : gameTypeName!.hashCode) +
    (matchDurationInMinutes == null ? 0 : matchDurationInMinutes!.hashCode) +
    (finished == null ? 0 : finished!.hashCode) +
    (isCancelled == null ? 0 : isCancelled!.hashCode) +
    (cancellationReason == null ? 0 : cancellationReason!.hashCode) +
    (pricePerPlayerUnits == null ? 0 : pricePerPlayerUnits!.hashCode) +
    (day == null ? 0 : day!.hashCode) +
    (month == null ? 0 : month!.hashCode) +
    (year == null ? 0 : year!.hashCode) +
    (startHour == null ? 0 : startHour!.hashCode) +
    (endHour == null ? 0 : endHour!.hashCode);

  @override
  String toString() => 'GameDetailsDTO[id=$id, organizerName=$organizerName, organizerId=$organizerId, fieldId=$fieldId, fieldName=$fieldName, cityId=$cityId, cityName=$cityName, countryId=$countryId, countryName=$countryName, nrOfPlayersRequired=$nrOfPlayersRequired, currentNumberOfPlayers=$currentNumberOfPlayers, gameTypeName=$gameTypeName, matchDurationInMinutes=$matchDurationInMinutes, finished=$finished, isCancelled=$isCancelled, cancellationReason=$cancellationReason, pricePerPlayerUnits=$pricePerPlayerUnits, day=$day, month=$month, year=$year, startHour=$startHour, endHour=$endHour]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.organizerName != null) {
      json[r'organizerName'] = this.organizerName;
    } else {
      json[r'organizerName'] = null;
    }
    if (this.organizerId != null) {
      json[r'organizerId'] = this.organizerId;
    } else {
      json[r'organizerId'] = null;
    }
    if (this.fieldId != null) {
      json[r'fieldId'] = this.fieldId;
    } else {
      json[r'fieldId'] = null;
    }
    if (this.fieldName != null) {
      json[r'fieldName'] = this.fieldName;
    } else {
      json[r'fieldName'] = null;
    }
    if (this.cityId != null) {
      json[r'cityId'] = this.cityId;
    } else {
      json[r'cityId'] = null;
    }
    if (this.cityName != null) {
      json[r'cityName'] = this.cityName;
    } else {
      json[r'cityName'] = null;
    }
    if (this.countryId != null) {
      json[r'countryId'] = this.countryId;
    } else {
      json[r'countryId'] = null;
    }
    if (this.countryName != null) {
      json[r'countryName'] = this.countryName;
    } else {
      json[r'countryName'] = null;
    }
    if (this.nrOfPlayersRequired != null) {
      json[r'nrOfPlayersRequired'] = this.nrOfPlayersRequired;
    } else {
      json[r'nrOfPlayersRequired'] = null;
    }
    if (this.currentNumberOfPlayers != null) {
      json[r'currentNumberOfPlayers'] = this.currentNumberOfPlayers;
    } else {
      json[r'currentNumberOfPlayers'] = null;
    }
    if (this.gameTypeName != null) {
      json[r'gameTypeName'] = this.gameTypeName;
    } else {
      json[r'gameTypeName'] = null;
    }
    if (this.matchDurationInMinutes != null) {
      json[r'matchDurationInMinutes'] = this.matchDurationInMinutes;
    } else {
      json[r'matchDurationInMinutes'] = null;
    }
    if (this.finished != null) {
      json[r'finished'] = this.finished;
    } else {
      json[r'finished'] = null;
    }
    if (this.isCancelled != null) {
      json[r'isCancelled'] = this.isCancelled;
    } else {
      json[r'isCancelled'] = null;
    }
    if (this.cancellationReason != null) {
      json[r'cancellationReason'] = this.cancellationReason;
    } else {
      json[r'cancellationReason'] = null;
    }
    if (this.pricePerPlayerUnits != null) {
      json[r'pricePerPlayerUnits'] = this.pricePerPlayerUnits;
    } else {
      json[r'pricePerPlayerUnits'] = null;
    }
    if (this.day != null) {
      json[r'day'] = this.day;
    } else {
      json[r'day'] = null;
    }
    if (this.month != null) {
      json[r'month'] = this.month;
    } else {
      json[r'month'] = null;
    }
    if (this.year != null) {
      json[r'year'] = this.year;
    } else {
      json[r'year'] = null;
    }
    if (this.startHour != null) {
      json[r'startHour'] = this.startHour;
    } else {
      json[r'startHour'] = null;
    }
    if (this.endHour != null) {
      json[r'endHour'] = this.endHour;
    } else {
      json[r'endHour'] = null;
    }
    return json;
  }

  /// Returns a new [GameDetailsDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GameDetailsDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GameDetailsDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GameDetailsDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GameDetailsDTO(
        id: mapValueOfType<int>(json, r'id'),
        organizerName: mapValueOfType<String>(json, r'organizerName'),
        organizerId: mapValueOfType<int>(json, r'organizerId'),
        fieldId: mapValueOfType<int>(json, r'fieldId'),
        fieldName: mapValueOfType<String>(json, r'fieldName'),
        cityId: mapValueOfType<int>(json, r'cityId'),
        cityName: mapValueOfType<String>(json, r'cityName'),
        countryId: mapValueOfType<int>(json, r'countryId'),
        countryName: mapValueOfType<String>(json, r'countryName'),
        nrOfPlayersRequired: mapValueOfType<int>(json, r'nrOfPlayersRequired'),
        currentNumberOfPlayers: mapValueOfType<int>(json, r'currentNumberOfPlayers'),
        gameTypeName: mapValueOfType<String>(json, r'gameTypeName'),
        matchDurationInMinutes: mapValueOfType<int>(json, r'matchDurationInMinutes'),
        finished: mapValueOfType<bool>(json, r'finished'),
        isCancelled: mapValueOfType<bool>(json, r'isCancelled'),
        cancellationReason: mapValueOfType<String>(json, r'cancellationReason'),
        pricePerPlayerUnits: mapValueOfType<int>(json, r'pricePerPlayerUnits'),
        day: mapValueOfType<int>(json, r'day'),
        month: mapValueOfType<int>(json, r'month'),
        year: mapValueOfType<int>(json, r'year'),
        startHour: mapValueOfType<int>(json, r'startHour'),
        endHour: mapValueOfType<int>(json, r'endHour'),
      );
    }
    return null;
  }

  static List<GameDetailsDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GameDetailsDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GameDetailsDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GameDetailsDTO> mapFromJson(dynamic json) {
    final map = <String, GameDetailsDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GameDetailsDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GameDetailsDTO-objects as value to a dart map
  static Map<String, List<GameDetailsDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GameDetailsDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GameDetailsDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

