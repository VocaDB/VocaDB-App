# VocaDB App
New VocaDB app with React native.

[![Build Status](https://www.bitrise.io/app/424cdc66aab2e8e1/status.svg?token=1OdgCmNWesLCEyd0bUABsw)](https://www.bitrise.io/app/424cdc66aab2e8e1)

![Screenshot](/resources/screenshot/android/home.png)

## Download

- [Playstore](https://play.google.com/store/apps/details?id=com.coolappz.Vocadb)
- [Playstore (Alpha/Beta)](https://play.google.com/apps/testing/com.coolappz.Vocadb)

## Setup on local 

### Prerequisite
- [NodeJS](https://nodejs.org/en/)
- [react-native-cli](https://www.npmjs.com/package/react-native-cli)
- [Storybook](https://storybook.js.org) like a component dictionary.

### Install

```shell
$ git clone https://github.com/VocaDB/VocaDB-App.git
$ cd VocaDB-App
$ npm install
```

### Storybook

In case if you never used storybook before
```shell
$ npm i -g @storybook/cli
```

Then you can start storybook by running

```shell
$ npm run storybook
```

### Run App

#### iOS
Mac OS Only. You must have Xcode installed first.

```shell
$ react-native run-ios
```

#### Android

```shell
$ react-native run-android
```

Getting started instruction is [here](https://facebook.github.io/react-native/docs/getting-started.html) 

#### Using storybook

See in `App.js` file.

- Export `StorybookUI` if you want to run with storybook.
- Export `App` if you want to test real app.

### Config
in *src/constants/config* you can switch **useMock** to **false** to fetch real data from VocaDB API instead of mock.