#!/bin/sh
APP_NAME=$1

echo "Replace file android/app/src/main/AndroidManifest.xml"
cp ./assets/store/$APP_NAME/android/AndroidMAnifest.xml ./android/app/src/main/AndroidManifest.xml

echo "Replace file app/build.gradle"
cp ./assets/store/$APP_NAME/android/app.build.gradle ./android/app/src/build.gradle

echo "Replace android package structure"
rm -r ./android/app/src/main/kotlin
cp -r ./assets/store/$APP_NAME/android/kotlin ./android/app/src/main/kotlin

# Replace icon/launcher
echo "Replace app icons"
rm -r ./android/app/src/main/res/mipmap-hdpi
rm -r ./android/app/src/main/res/mipmap-mdpi
rm -r ./android/app/src/main/res/mipmap-xhdpi
rm -r ./android/app/src/main/res/mipmap-xxhdpi
rm -r ./android/app/src/main/res/mipmap-xxxhdpi

cp -r ./assets/store/$APP_NAME/android/launchers/mipmap-hdpi ./android/app/src/main/res/mipmap-hdpi
cp -r ./assets/store/$APP_NAME/android/launchers/mipmap-mdpi ./android/app/src/main/res/mipmap-mdpi
cp -r ./assets/store/$APP_NAME/android/launchers/mipmap-xhdpi ./android/app/src/main/res/mipmap-xhdpi
cp -r ./assets/store/$APP_NAME/android/launchers/mipmap-xxhdpi ./android/app/src/main/res/mipmap-xxhdpi
cp -r ./assets/store/$APP_NAME/android/launchers/mipmap-xxxhdpi ./android/app/src/main/res/mipmap-xxxhdpi

# Replace constants
echo "Replace constants file"
cp ./assets/store/$APP_NAME/constants ./lib/constants.dart





