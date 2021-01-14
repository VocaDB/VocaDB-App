[![Download](https://img.shields.io/github/v/release/VocaDB/VocaDB-App)](https://github.com/VocaDB/VocaDB-App/releases)
[![Download](https://img.shields.io/github/license/VocaDB/VocaDB-App)](https://github.com/VocaDB/VocaDB-App/LICENSE)


# VocaDB App
VocaDB mobile version with [Flutter framework](https://flutter.dev/). 

![Screenshot](/assets/store/VocaDB/android/vocadb_demo.gif)

## Download

- [Playstore for Android](https://play.google.com/store/apps/details?id=com.coolappz.Vocadb)
- [Playstore (Alpha/Beta)](https://play.google.com/apps/testing/com.coolappz.Vocadb)
- [App Store for iOS](https://itunes.apple.com/us/app/vocadb/id907510673)

## Setup for development
- [Flutter SDK](https://flutter.dev/docs/get-started/install)

## Editor (Optional)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Android Studio](https://developer.android.com/studio)
- [IntelliJ](https://www.jetbrains.com/idea/download/)

## API Documentation
Use [dartdoc](https://dart.dev/tools/dartdoc) for generate documentation.


### Installing dartdoc

Run `pub global activate dartdoc` to install the latest version of dartdoc compatible with your SDK.
```
$ pub global activate dartdoc
```
Then run `dartdoc` command to generate document.

```
$ dartdoc
```

Document generated result to {current_dir}/doc/api and can open index.html to view it in browser.

## UI Translation

Translation files in _lib/src/i18n_. File should be named with `{language code}.dart` or `{language_code}_{country_code}.dart`.

If anyone would like to update or add more language, You can add/edit and pull request to me.