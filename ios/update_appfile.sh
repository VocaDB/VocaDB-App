#!/bin/sh
APP_IDENTIFIER=$1
APPLE_ID=$2
TEAM_NAME=$3
TEAMN_ID=$4

sed -i '' "s/##APP_IDENTIFIER##/$APP_IDENTIFIER/g" fastlane/Appfile
sed -i '' "s/##APPLE_ID##/$APPLE_ID/g" fastlane/Appfile
sed -i '' "s/##TEAM_NAME##/$TEAM_NAME/g" fastlane/Appfile
sed -i '' "s/##TEAMN_ID##/$TEAMN_ID/g" fastlane/Appfile
