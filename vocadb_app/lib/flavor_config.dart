import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlavorConfig {
  String appTitle;
  String apiAuthority;
  bool useFakeData;

  FlavorConfig({
    this.appTitle = "VocaDB",
    this.apiAuthority = "vocadb.net",
    this.useFakeData = true,
  });
}

var flavorConfigProvider = StateProvider(
  (ref) => FlavorConfig(),
);
