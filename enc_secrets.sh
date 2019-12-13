#!/bin/sh

# Clear old files
rm -rf ./secrets
rm ./secrets.tar

ANDROID_GOOGLE_SERVICE_FILE=./android/app/google-services.json
ANDROID_GOOGLE_PLAY_ACCOUNT_FILE=./android/google-play-service-account.json
ANDROID_RELEASE_KEYSTORE_FILE=./android/app/release-key.keystore
IOS_GOOGLE_SERVICE_FILE=./ios/Runner/GoogleService-Info.plist

ANDROID_KEYS=(
  # File google service for android
  $ANDROID_GOOGLE_SERVICE_FILE

  # Keystore for signing
  $ANDROID_RELEASE_KEYSTORE_FILE

  # Google play account file for fastlane
  $ANDROID_GOOGLE_PLAY_ACCOUNT_FILE
)

IOS_KEYS=(
  # File google service for ios
  $IOS_GOOGLE_SERVICE_FILE
)

fail_counter=0
echo "######### Android #########"
for i in "${ANDROID_KEYS[@]}"
do
    if test -f "$i"; then
        echo "Checking file $i.......[DONE]"
    else
        counter=$((counter+1))
        echo "Checking file $i.......[FAILED]"
    fi
done

echo "######### iOS #########"
for i in "${IOS_KEYS[@]}"
do
    if test -f "$i"; then
        echo "Checking file $i.......[DONE]"
    else
        counter=$((counter+1))
        echo "Checking file $i.......[FAILED]"
    fi
done

if [ $((counter)) -gt 0 ]; then
    echo "ERROR: : $counter"
    exit 1
else
    echo "ALL FILE EXISTS"
fi

# zip and encrypt file
echo "----------------------"
echo "Copy files..."
mkdir -p ./secrets/android
mkdir -p ./secrets/ios
cp $ANDROID_GOOGLE_SERVICE_FILE ./secrets/android/google-services.json
cp $ANDROID_RELEASE_KEYSTORE_FILE ./secrets/android/release-key.keystore
cp $ANDROID_GOOGLE_PLAY_ACCOUNT_FILE ./secrets/android/google-play-service-account.json
cp $IOS_GOOGLE_SERVICE_FILE ./secrets/ios/GoogleService-Info.plist

echo "ZIP Files..."
tar cvf secrets.tar ./secrets

echo "Clear temp directory"
rm -rf ./secrets

## Encrypted with travis
travis encrypt-file ./secrets.tar