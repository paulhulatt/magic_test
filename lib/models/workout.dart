import 'dart:convert';

import 'package:flutter/foundation.dart';

/// Defines a Workout which is made up of [uuid] a UUID used to identify the Workout,
/// [name] a friendly name to identify it,
/// [date] the date the Workout was first created,
/// and [sets] which contains a number of WorkoutSets
///
class Workout {
  String? id;
  String? name;
  DateTime? date;
  List<WorkoutSet>? sets;
  Workout({
    this.id,
    this.name,
    this.date,
    this.sets,
  });

  Workout copyWith({
    String? id,
    String? name,
    DateTime? date,
    List<WorkoutSet>? sets,
  }) {
    return Workout(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      sets: (sets == null) ? List.from(this.sets!) : sets,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date?.millisecondsSinceEpoch,
      'sets': sets?.map((x) => x.toMap()).toList(),
    };
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      id: map['id'],
      name: map['name'],
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'])
          : null,
      sets: map['sets'] != null
          ? List<WorkoutSet>.from(
              map['sets']?.map((x) => WorkoutSet.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Workout.fromJson(String source) =>
      Workout.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Workout(id: $id, name: $name, date: $date, sets: $sets)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Workout &&
        other.id == id &&
        other.name == name &&
        other.date == date &&
        listEquals(other.sets, sets);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ date.hashCode ^ sets.hashCode;
  }
}

/// Defines a WorkoutSet which is made up of [uuid] a UUID used to identify the Set,
/// [exercise] the UUID of an exercise type,
/// [weight] the weight used for this set,
/// and [reps] the number of repitions performed
///
class WorkoutSet {
  String? id;
  String? exercise;
  int? weight;
  int? reps;
  WorkoutSet({
    this.id,
    this.exercise,
    this.weight,
    this.reps,
  });

  WorkoutSet copyWith({
    String? id,
    String? exercise,
    int? weight,
    int? reps,
  }) {
    return WorkoutSet(
      id: id ?? this.id,
      exercise: exercise ?? this.exercise,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'exercise': exercise,
      'weight': weight,
      'reps': reps,
    };
  }

  factory WorkoutSet.fromMap(Map<String, dynamic> map) {
    return WorkoutSet(
      id: map['id'],
      exercise: map['exercise'],
      weight: map['weight']?.toInt(),
      reps: map['reps']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkoutSet.fromJson(String source) =>
      WorkoutSet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WorkoutSet(id: $id, exercise: $exercise, weight: $weight, reps: $reps)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WorkoutSet &&
        other.id == id &&
        other.exercise == exercise &&
        other.weight == weight &&
        other.reps == reps;
  }

  @override
  int get hashCode {
    return id.hashCode ^ exercise.hashCode ^ weight.hashCode ^ reps.hashCode;
  }
}
