// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserSettings {
  final String interfaceLang;

  final String preferredDisplayLang;
  UserSettings({
    required this.interfaceLang,
    required this.preferredDisplayLang,
  });

  @override
  bool operator ==(covariant UserSettings other) {
    if (identical(this, other)) return true;

    return other.interfaceLang == interfaceLang &&
        other.preferredDisplayLang == preferredDisplayLang;
  }

  @override
  int get hashCode => interfaceLang.hashCode ^ preferredDisplayLang.hashCode;

  UserSettings copyWith({
    String? interfaceLang,
    String? preferredDisplayLang,
  }) {
    return UserSettings(
      interfaceLang: interfaceLang ?? this.interfaceLang,
      preferredDisplayLang: preferredDisplayLang ?? this.preferredDisplayLang,
    );
  }
}
