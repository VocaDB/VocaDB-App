#!/bin/sh
BUILD_NAME=$1
BUILD_CODE=$2

echo "Update version name"
sed -i '' "s/##versionName##/\"$BUILD_NAME\"/g" android/app/build.gradle

echo "Update version code"
sed -i '' "s/##versionCode##/$BUILD_CODE/g" android/app/build.gradle

echo "Update bundle version"
sed -i '' "s/##bundleVersion##/$BUILD_NAME/g" ios/Runner/Info.plist

echo "Update bundle build number"
sed -i '' "s/##bundleBuild##/$BUILD_CODE/g" ios/Runner/Info.plist