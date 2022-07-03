# amazing_login_ui

I created this Login UI while learning how to use Firebase authentication with Flutter.

If you want me to add, remove or change anything in the app, please do let me know! I will be making a YouTube video soon on how I coded this login UI from scratch.

Feel free to use this repo however you like (personal or commercial), but please do credit me - Safwan Parkar 😁

**Please ⭐ this repo as it will really help me out!**

# Installation

To make sure that your cloned repository works with Firebase, you will need to set up the Firebase CLI.

- These instructions can be found in the Firebase console when creating an app, and must be run from the root directory of your Flutter project:
  `dart pub global activate flutterfire_cli`
  `flutterfire configure --project=project_identifier_here`

- Add these dependencies to your `pubspec.yaml` file:
  `firebase_core: ^1.18.0`
  `firebase_auth: ^3.3.20`
  Latest versions of the dependencies can be found here: [firebase_auth](https://pub.dev/packages/firebase_auth), [firebase_core](https://pub.dev/packages/firebase_core)

- Add the following imports to your .dart files
  `import 'package:firebase_core/firebase_core.dart';`
  `import 'firebase_options.dart';`

- Run `./gradlew signingReport` from the `/android` directory of your flutter project (e.g. `D:\development\flutter\amazing_login_ui\android`), and add the `SHA1` and `SHA256` keys to your Android app settings in the Firebase console.

# App Screenshots

![1](https://i.imgur.com/EX4nwPG.png) ![2](https://i.imgur.com/rFAysSn.png) ![3](https://i.imgur.com/gfX4wEF.png)
