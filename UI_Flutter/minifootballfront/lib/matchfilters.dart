class MatchFilters {
  int? organizerId;
  int? fieldId;
  int? countryId;
  int? cityId;
  DateTime? startDateFrom;
  DateTime? startDateTo;
  DateTime? endDateFrom;
  DateTime? endDateTo;
  int? minPlayersRequired;
  int? maxPlayersRequired;
  bool? playerCanJoin;
  bool? finished;
  bool? cancelled;
  int? minSpotsAvailable;
  int? maxSpotsAvailable;

  MatchFilters({
    this.organizerId,
    this.fieldId,
    this.countryId,
    this.cityId,
    this.startDateFrom,
    this.startDateTo,
    this.endDateFrom,
    this.endDateTo,
    this.minPlayersRequired,
    this.maxPlayersRequired,
    this.playerCanJoin,
    this.finished,
    this.cancelled,
    this.minSpotsAvailable,
    this.maxSpotsAvailable,
  });

  MatchFilters copyWith({
    int? organizerId,
    int? fieldId,
    int? countryId,
    int? cityId,
    DateTime? startDateFrom,
    DateTime? startDateTo,
    DateTime? endDateFrom,
    DateTime? endDateTo,
    int? minPlayersRequired,
    int? maxPlayersRequired,
    bool? playerCanJoin,
    bool? finished,
    bool? cancelled,
    int? minSpotsAvailable,
    int? maxSpotsAvailable,
  }) {
    return MatchFilters(
      organizerId: organizerId ?? this.organizerId,
      fieldId: fieldId ?? this.fieldId,
      countryId: countryId ?? this.countryId,
      cityId: cityId ?? this.cityId,
      startDateFrom: startDateFrom ?? this.startDateFrom,
      startDateTo: startDateTo ?? this.startDateTo,
      endDateFrom: endDateFrom ?? this.endDateFrom,
      endDateTo: endDateTo ?? this.endDateTo,
      minPlayersRequired: minPlayersRequired ?? this.minPlayersRequired,
      maxPlayersRequired: maxPlayersRequired ?? this.maxPlayersRequired,
      playerCanJoin: playerCanJoin ?? this.playerCanJoin,
      finished: finished ?? this.finished,
      cancelled: cancelled ?? this.cancelled,
      minSpotsAvailable: minSpotsAvailable ?? this.minSpotsAvailable,
      maxSpotsAvailable: maxSpotsAvailable ?? this.maxSpotsAvailable,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'organizerId': organizerId,
      'fieldId': fieldId,
      'countryId': countryId,
      'cityId': cityId,
      'startDateFrom': startDateFrom?.toIso8601String(),
      'startDateTo': startDateTo?.toIso8601String(),
      'endDateFrom': endDateFrom?.toIso8601String(),
      'endDateTo': endDateTo?.toIso8601String(),
      'minPlayersRequired': minPlayersRequired,
      'maxPlayersRequired': maxPlayersRequired,
      'playerCanJoin': playerCanJoin,
      'finished': finished,
      'cancelled': cancelled,
      'minSpotsAvailable': minSpotsAvailable,
      'maxSpotsAvailable': maxSpotsAvailable,
    };
  }

  factory MatchFilters.fromMap(Map<String, dynamic> map) {
    return MatchFilters(
      organizerId: map['organizerId'],
      fieldId: map['fieldId'],
      countryId: map['countryId'],
      cityId: map['cityId'],
      startDateFrom: map['startDateFrom'] != null
          ? DateTime.parse(map['startDateFrom'])
          : null,
      startDateTo: map['startDateTo'] != null
          ? DateTime.parse(map['startDateTo'])
          : null,
      endDateFrom: map['endDateFrom'] != null
          ? DateTime.parse(map['endDateFrom'])
          : null,
      endDateTo:
          map['endDateTo'] != null ? DateTime.parse(map['endDateTo']) : null,
      minPlayersRequired: map['minPlayersRequired'],
      maxPlayersRequired: map['maxPlayersRequired'],
      playerCanJoin: map['playerCanJoin'],
      finished: map['finished'],
      cancelled: map['cancelled'],
      minSpotsAvailable: map['minSpotsAvailable'],
      maxSpotsAvailable: map['maxSpotsAvailable'],
    );
  }

  @override
  String toString() {
    return 'MatchFilters(organizerId: $organizerId, fieldId: $fieldId, countryId: $countryId, cityId: $cityId, startDateFrom: $startDateFrom, startDateTo: $startDateTo, endDateFrom: $endDateFrom, endDateTo: $endDateTo, minPlayersRequired: $minPlayersRequired, maxPlayersRequired: $maxPlayersRequired, playerCanJoin: $playerCanJoin, finished: $finished, cancelled: $cancelled, minSpotsAvailable: $minSpotsAvailable, maxSpotsAvailable: $maxSpotsAvailable)';
  }
}
