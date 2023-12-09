# VocaDB App
VocaDB mobile version with [Flutter framework](https://flutter.dev/).

## Download
### VocaDB
- [Playstore for Android](https://play.google.com/store/apps/details?id=com.coolappz.Vocadb)
- [Playstore (Alpha/Beta)](https://play.google.com/apps/testing/com.coolappz.Vocadb)
- [App Store for iOS](https://itunes.apple.com/us/app/vocadb/id907510673)

### TouhouDB
- [Playstore for Android](https://play.google.com/store/apps/details?id=com.touhoudb.app)

## Getting started for development

### Prerequisite
- [Flutter](https://flutter.dev/) (Currently this project use version 3.3)
- Run `flutter doctor`

### Install package dependencies
```
$ flutter pub get
```

## Test
### Run unit tests
```
$ flutter test
```

### With coverage report
```
$ flutter test --coverage
```

## Build
WIP

## Translation / Localization

### Create new language (For anyone)
1. Create new `.arb` file in `${FLUTTER_PROJECT}/lib/src/localization`. File format will be `app_{lang_code}_{country_code}.arb`.
2. Copy file content from `app_en.arb` as template and then edit on your own language.

### Edit existing language
You can edit file inside `${FLUTTER_PROJECT}/lib/src/localization`.

### Run codegen (For developer)
```
$ flutter gen-l10n
```

### Reference
- [Internationalizing Flutter apps](https://docs.flutter.dev/development/accessibility-and-localization/internationalization)

