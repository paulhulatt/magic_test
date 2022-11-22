import 'package:flutter/material.dart';

/// Model for Exercise types
///
/// [id] - The UUID by which this Exercise will be referenced
///
/// [name] - Display name for this Exercise
///
class Exercise {
  String id;
  String name;

  Exercise(this.id, this.name);
}
