#!/bin/sh
MANIFEST_FILE=./android/app/src/main/AndroidManifest.xml
APP_NAME=TouhouDB
APP_PACKAGE=com.touhoudb.app
APP_BUNDLE_ID=com.touhoudb.app

echo "Rename android:label to $APP_NAME and package to $APP_PACKAGE in android/app/src/main/AndroidManifest.xml"
sed -i -e "s/com.coolappz.Vocadb/$APP_PACKAGE/g" ./android/app/src/main/AndroidManifest.xml
sed -i -e "s/android:label=\"VocaDB\"/android:label=\"$APP_NAME\"/g" ./android/app/src/main/AndroidManifest.xml

# Rename value in app/build.gradle
# applicationId "com.coolappz.Vocadb" > applicationId "com.touhoudb.app"
echo "Rename applicationId in android/app/build.gradle to $APP_PACKAGE"
sed -i -e "s/applicationId \"com.coolappz.Vocadb\"/applicationId \"$APP_PACKAGE\"/g" ./android/app/build.gradle

echo "Rename directory structure to package name $APP_PACKAGE"
# Rename directory structure
# android\app\src\main\kotlin\com\coolappz\Vocadb > android\app\src\main\kotlin\com\touhoudb\app
mkdir temp
mv android/app/src/main/kotlin temp/kotlin
DIR=android/app/src/main/kotlin
IFS='.' read -ra packages <<< "$APP_PACKAGE"
mkdir -p android/app/src/main/kotlin/${packages[0]}/${packages[1]}/${packages[2]}
mv temp/kotlin/com/coolappz/Vocadb/MainActivity.kt android/app/src/main/kotlin/${packages[0]}/${packages[1]}/${packages[2]}/MainActivity.kt
rm -rf temp

# Rename package in MainActivity inside android\app\src\main\kotlin\com\touhoudb\app\MainActivity.kt
echo "Rename package in MainActivity.kt"
sed -i -e "s/com.coolappz.Vocadb/$APP_PACKAGE/g" ./android/app/src/main/kotlin/${packages[0]}/${packages[1]}/${packages[2]}/MainActivity.kt

echo "Rename CFBundleIdentifier in Info.plist"
sed -i -e "s/com.up2up.vocadb/$APP_PACKAGE/g" ./ios/Runner/Info.plist

echo "Rename CFBundleName in Info.plist"
sed -i -e "s/vocadb/$APP_NAME/g" ./ios/Runner/Info.plist

echo "Repalce google service file"
# mv ./assets/store/$APP_NAME/android/google-service.json ./android/app/google-service.json
# mv ./assets/store/$APP_NAME/ios/GoogleService-Info.plist ./ios/Runner/GoogleService-Info.plist

# Replace icon/launcher
echo "Replace app icons"
mv ./assets/store/$APP_NAME/android/launchers ./android/app/src/main/res
mv ./assets/store/$APP_NAME/ios/AppIcon.appiconset  > ./ios/Runner/Assets.xcassets/AppIcon.appiconset

# Replace constants
echo "Replace constants file"
mv ./assets/store/$APP_NAME/constants ./lib/constants.dart





