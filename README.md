# VocaDB App (PoC)
This project is still under PoC to see how to build VocaDB App with React native + Redux.

***NOTICE : FOR TESTING ONLY, MANY FUNCTIONALITIES ARE UNUSABLE YET.***

## Prerequisite
- [NodeJS](https://nodejs.org/en/)
- [Expo Client](https://expo.io) (Availiable on both [iOS](https://itunes.apple.com/app/apple-store/id982107779?ct=www&mt=8) and [Android](https://play.google.com/store/apps/details?id=host.exp.exponent&referrer=www))
- [Storybook](https://storybook.js.org) like a component dictionary.

## Setup

```shell
$ git clone -b poc/revamp https://github.com/VocaDB/VocaDB-App.git
$ cd VocaDB-App
$ npm install
```

## Storybook

In case if you never used storybook before
```shell
$ npm i -g @storybook/cli
```

Then you can start storybook by running

```shell
$ npm run storybook
```

## Run App

There was several ways to run app.

### iOS
Mac OS Only. You must have Xcode installed first.

```shell
$ npm run ios
```

### Android

I never tried this before but you can try if you have android emulator or with actual device.
```shell
$ npm run android
```

### Default Expo

```shell
$ npm start
```

Now you can use Expo app to scan QR code that display in terminal (make sure you are in the same network with your PC)

### Expo XDE
[Expo XDE](https://docs.expo.io/versions/latest/introduction/installation.html) is required.

- Open Expo XDE
- Open Project
- Locate to VocaDB-App directory
- Wait for building script
- When done. You can sacn QR code from `Share` button via `Expo Client` from your phone.

### Using storybook

See in `App.js` file.

- Export `StorybookUI` if you want to run with storybook.
- Export `App` if you want to test real app.

## Config
in *src/constants/config* you can switch **useMock** to **false** to fetch real data from VocaDB API instead of mock.