import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlavorConfig {
  String appTitle;
  String apiAuthority;
  bool useFakeData;

  FlavorConfig({
    this.appTitle = "VocaDB",
    this.apiAuthority = "vocadb.net",
    this.useFakeData = false,
  });
}

var flavorConfigProvider = StateProvider(
  (ref) => FlavorConfig(),
);
