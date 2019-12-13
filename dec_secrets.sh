#!/bin/sh

# Clear old files
rm -rf ./secrets

SECRETS_ZIP_FILE=./secrets.tar

if test -f "$SECRETS_ZIP_FILE"; then
  echo "Extracting encrypted secret file"
else
  echo "No such file $SECRETS_ZIP_FILE"
  exit 1
fi

ANDROID_GOOGLE_SERVICE_FILE=./android/app/google-services.json
ANDROID_GOOGLE_PLAY_ACCOUNT_FILE=./android/google-play-service-account.json
ANDROID_RELEASE_KEYSTORE_FILE=./android/app/release-key.keystore
IOS_GOOGLE_SERVICE_FILE=./ios/Runner/GoogleService-Info.plist

SECRET_ANDROID_GOOGLE_SERVICE_FILE=./secrets/android/google-services.json
SECRET_ANDROID_GOOGLE_PLAY_ACCOUNT_FILE=./secrets/android/google-play-service-account.json
SECRET_ANDROID_RELEASE_KEYSTORE_FILE=./secrets/android/release-key.keystore
SECRET_IOS_GOOGLE_SERVICE_FILE=./secrets/ios/GoogleService-Info.plist

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

ANDROID_SECRET_FILES=(
  # File google service for android
  $SECRET_ANDROID_GOOGLE_SERVICE_FILE

  # Keystore for signing
  $SECRET_ANDROID_RELEASE_KEYSTORE_FILE

  # Google play account file for fastlane
  $SECRET_ANDROID_GOOGLE_PLAY_ACCOUNT_FILE
)

IOS_SECRET_FILES=(
  # File google service for ios
  $SECRET_IOS_GOOGLE_SERVICE_FILE
)

tar xvf ./secrets.tar

echo "Validating secret files"
fail_counter=0
echo "######### Android #########"
for i in "${ANDROID_SECRET_FILES[@]}"
do
    if test -f "$i"; then
        echo "Checking file $i.......[DONE]"
    else
        fail_counter=$((fail_counter+1))
        echo "Checking file $i.......[FAILED]"
    fi
done

echo "######### iOS #########"
for i in "${IOS_SECRET_FILES[@]}"
do
    if test -f "$i"; then
        echo "Checking file $i.......[DONE]"
    else
        fail_counter=$((fail_counter+1))
        echo "Checking file $i.......[FAILED]"
    fi
done

if [ $fail_counter -gt 0 ]; then
    echo "MISSING SOME SECRET FILE(S)"
    exit 1
fi

echo "----------------------"
echo "Moving secret files..."
cp $SECRET_ANDROID_GOOGLE_SERVICE_FILE $ANDROID_GOOGLE_SERVICE_FILE
cp $SECRET_ANDROID_RELEASE_KEYSTORE_FILE $ANDROID_RELEASE_KEYSTORE_FILE
cp $SECRET_ANDROID_GOOGLE_PLAY_ACCOUNT_FILE $ANDROID_GOOGLE_PLAY_ACCOUNT_FILE
cp $IOS_GOOGLE_SERVICE_FILE $SECRET_IOS_GOOGLE_SERVICE_FILE

fail_counter=0

echo "Re-checking sensitive files..."
echo "######### Android #########"
for i in "${ANDROID_KEYS[@]}"
do
    if test -f "$i"; then
        echo "Checking file $i.......[DONE]"
    else
        fail_counter=$((fail_counter+1))
        echo "Checking file $i.......[FAILED]"
    fi
done

echo "######### iOS #########"
for i in "${IOS_KEYS[@]}"
do
    if test -f "$i"; then
        echo "Checking file $i.......[DONE]"
    else
        fail_counter=$((fail_counter+1))
        echo "Checking file $i.......[FAILED]"
    fi
done

if [ $fail_counter -gt 0 ]; then
    echo "MISSING SOME KEY FILE(S)"
    exit 1
fi

echo "FINISHED!"

