# VocaDB App (PoC)
This project is still under PoC to see how to build VocaDB App with React native + Redux.
***NOTICE : FOR TESTING ONLY, MANY FUNCTIONALITIES ARE UNUSABLE YET.***

## Prerequisite
- [NodeJS](https://nodejs.org/en/)
- [Expo](https://expo.io) (Optional, Availiable on both [iOS](https://itunes.apple.com/app/apple-store/id982107779?ct=www&mt=8) and [Android](https://play.google.com/store/apps/details?id=host.exp.exponent&referrer=www))

## Setup

```shell
$ git clone -b poc/revamp https://github.com/VocaDB/VocaDB-App.git
$ cd VocaDB-App
$ npm install
```

## Run

```shell
$ npm start
```
Now you can use Expo app to scan QR code that display in terminal (make sure you are in the same network with your PC)

Another way is run project by [Expo XDE](https://docs.expo.io/versions/latest/introduction/installation.html) so you can use this QR code and share to the other as long as your Expo XDE is running.

## Config
in *src/constants/config* you can switch **useMock** to **false** to fetch real data from VocaDB API instead of mock.