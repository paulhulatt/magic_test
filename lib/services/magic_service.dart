import 'package:flutter/foundation.dart';

class MagicService {
  static MagicService? _instance;

  bool initialised = false;

  static Future<MagicService> init() async {
    _instance ??= MagicService();

    return Future.value(_instance);
  }
}
